/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/

package org.globalqss.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;

import org.compiere.model.MClient;
import org.compiere.model.MClientInfo;
import org.compiere.model.MNote;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPInstance;
import org.compiere.model.MProduct;
import org.compiere.model.MProductCategory;
import org.compiere.model.MSequence;
import org.compiere.model.MUser;
import org.compiere.model.MWarehouse;
import org.compiere.model.X_T_Replenish;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.ReplenishInterface;

/**
 *	TOC_BufferManagement
 *  * Implementation of Buffer Management for Theory of Constraints using Custom Replenish Interface from Adempiere
 *
 *  @author Carlos Ruiz - globalqss - Quality Systems & Solutions - http://globalqss.com
 *  
 */

public class TOC_BufferManagement implements ReplenishInterface {

	private static final int COLOR_Black	= 100;
	private static final int COLOR_Red		= 102;
	private static final int COLOR_Green	= 103;
	private static final int COLOR_White	= 108;
	private static final int COLOR_Yellow	= 113;
	
	private static final int SCALE_FOR_LEVELS = 10;
	
	private static final BigDecimal TWO		= BigDecimal.valueOf(2.0);
	private static final BigDecimal THREE	= BigDecimal.valueOf(3.3333);

	public BigDecimal getQtyToOrder(MWarehouse wh, X_T_Replenish replenish) {
		BigDecimal qtyToOrder = Env.ZERO;
		if (replenish.getLevel_Max().signum() <= 0)
			return qtyToOrder;

		BigDecimal range = replenish.getLevel_Max().subtract(replenish.getLevel_Min());
		BigDecimal redLevel = range.divide(THREE, SCALE_FOR_LEVELS, BigDecimal.ROUND_DOWN).add(replenish.getLevel_Min());
		BigDecimal yellowLevel = range.multiply(TWO).divide(THREE, SCALE_FOR_LEVELS, BigDecimal.ROUND_DOWN).add(replenish.getLevel_Min());
		BigDecimal qtyOnHand = replenish.getQtyOnHand();

		Properties ctx = replenish.getCtx();
		String trxName = replenish.get_TrxName();

		MProduct product = MProduct.get(ctx, replenish.getM_Product_ID());
		MProductCategory productCategory = MProductCategory.get(ctx, product.getM_Product_Category_ID());
		int purchaseAdjustDays = 0;
		Integer purchaseAdjustDaysI = (Integer) productCategory.get_Value("TOC_PurchaseAdjustDays");
		if (purchaseAdjustDaysI != null)
			purchaseAdjustDays = purchaseAdjustDaysI.intValue();
		int freqAdjustDays = 0;
		Integer freqAdjustDaysI = (Integer) productCategory.get_Value("TOC_FreqAdjustDays");
		if (freqAdjustDaysI != null)
			freqAdjustDays = freqAdjustDaysI.intValue();
		BigDecimal pctRedDaysToIncrease = (BigDecimal) productCategory.get_Value("TOC_PctRedDaysToIncrease");
		if (pctRedDaysToIncrease == null)
			pctRedDaysToIncrease = Env.ZERO;
		BigDecimal pctGreenDaysToDecrease = (BigDecimal) productCategory.get_Value("TOC_PctGreenDaysToDecrease");
		if (pctGreenDaysToDecrease == null)
			pctGreenDaysToDecrease = Env.ZERO;
		BigDecimal pctToDecrease = (BigDecimal) productCategory.get_Value("TOC_PctToDecrease");
		if (pctToDecrease == null)
			pctToDecrease = Env.ZERO;
		BigDecimal pctToIncrease = (BigDecimal) productCategory.get_Value("TOC_PctToIncrease");
		if (pctToIncrease == null)
			pctToIncrease = Env.ZERO;

		MPInstance pi = new MPInstance(ctx, replenish.getAD_PInstance_ID(), trxName);
		int supervisor_id = MOrgInfo.get(ctx, wh.getAD_Org_ID()).getSupervisor_ID();
		MUser notifyFrom = MUser.get(ctx, pi.getAD_User_ID());
		MUser notifyTo = MUser.get(ctx, supervisor_id);
		MClient client = MClient.get(ctx, replenish.getAD_Client_ID());
		
		// Replenish to the max level
		
		// Resets negative qtyreserved
		BigDecimal qtyreserved = replenish.getQtyReserved();
		if (qtyreserved.signum() < 0)
			qtyreserved = Env.ZERO;
		
		BigDecimal qtyTheoretical = qtyOnHand.add(replenish.getQtyOrdered()).subtract(qtyreserved);
		qtyToOrder = replenish.getLevel_Max().subtract(qtyTheoretical);
		if (qtyToOrder.signum() < 0)
			qtyToOrder = Env.ZERO;
		
		if (qtyToOrder.compareTo(Env.ZERO) > 0)
			qtyToOrder = minimumOrderQuantity (product, qtyToOrder, trxName);
		
		// 1 - RED ALERT
		// Validate red level and raise alert
		// red level is when qty on hand is less or equal than one third of the max level
		if (qtyOnHand.compareTo(redLevel) <= 0) {
			//String msgred = "Nivel Rojo - Producto [" + product.getValue() + "]";
			String msgred;
			if (qtyOnHand.compareTo(replenish.getLevel_Min()) <= 0)
			   msgred = "Nivel Negro - Producto [" + product.getValue() + "]";
			else
			  msgred = "Nivel Rojo - Producto [" + product.getValue() + "]";
			addLog(pi, msgred, product.getM_Product_ID(), qtyOnHand);
			if (supervisor_id <= 0) {
				addLog(pi, "Error Org - " + wh.getAD_Org_ID() + " doesn't have supervisor configured", null, null);
			} else {
				String subject = "BM - " + msgred;
				String text = "Producto [" + product.getValue() + "] en " + msgred +
						"\nBodega                ="+wh.getName()+
						"\nCantidad en Existencia="+qtyOnHand+
						"\nCantidad Ordenada     ="+replenish.getQtyOrdered()+
						"\nCantidad Reservada    ="+qtyreserved+
						"\nStock Maximo          ="+replenish.getLevel_Max()+
						"\nStock Minimo          ="+replenish.getLevel_Min()+
						"\nSugerido              ="+qtyToOrder;
				boolean email = notifyTo.isNotificationEMail();
				boolean notice = notifyTo.isNotificationNote();
				if (email)
				{
					client.sendEMail(notifyFrom, notifyTo, subject, text, null);
				}
				if (notice) {
					int AD_Message_ID = 793; // HARDCODED Replenishment
					MNote note = new MNote(ctx, AD_Message_ID, supervisor_id, null);
					note.setClientOrg(replenish.getAD_Client_ID(), wh.getAD_Org_ID());
					note.setDescription(subject);
					note.setTextMsg(text);
					note.setRecord(MPInstance.Table_ID, pi.getAD_PInstance_ID());
					note.save();
				}
			}
			
			// do not replenish, just raise the alert
			qtyToOrder = Env.ZERO;
		}

		Timestamp today = new Timestamp(System.currentTimeMillis());
		boolean isWorkingDay = true;
		if (today.getDay() == 0 /* Sunday */ || today.getDay() == 6 /* Saturday */) {
			isWorkingDay = false;
		} else {
			int defaultCalendarID = MClientInfo.get(ctx, replenish.getAD_Client_ID()).getC_Calendar_ID();
			int nbid = DB.getSQLValue(trxName,
					"SELECT C_NonBusinessDay_ID FROM C_NonBusinessDay WHERE C_Calendar_ID=? AND AD_Client_ID=? AND AD_Org_ID IN (0, ?) AND TRUNC(Date1)=TRUNC(SYSDATE) AND IsActive='Y'",
					defaultCalendarID, wh.getAD_Client_ID(), wh.getAD_Org_ID());
			if (nbid > 0)
				isWorkingDay = false;
		}

		int rh_id = DB.getSQLValue(trxName,
				"SELECT TOC_Replenish_History_ID FROM TOC_Replenish_History WHERE M_Warehouse_ID=? AND M_Product_ID=? AND TRUNC(DateTrx)=TRUNC(SYSDATE) AND IsActive='Y'",
				wh.getM_Warehouse_ID(), replenish.getM_Product_ID());
		boolean alreadyExecutedToday = (rh_id > 0); // It was already executed today

		if (isWorkingDay && ! alreadyExecutedToday) {
			// 2 - Create the Replenish History record
			// just when the process is ran on working days
			X_TOC_Replenish_History rh = null;
			rh = new X_TOC_Replenish_History(ctx, 0, trxName);
			rh.setM_Product_ID(replenish.getM_Product_ID());
			rh.setM_Warehouse_ID(wh.getM_Warehouse_ID());
			rh.setAD_Org_ID(wh.getAD_Org_ID());
			rh.setDateTrx(today);
			rh.setQtyOnHand(qtyOnHand);
			rh.setQtyOrdered(replenish.getQtyOrdered());
			rh.setQtyReserved(qtyreserved);
			rh.setLevel_Max(replenish.getLevel_Max());
			// Assign color
			if (qtyOnHand.compareTo(replenish.getLevel_Min()) <= 0)
				rh.setAD_PrintColor_ID(COLOR_Black);
			else if (qtyOnHand.compareTo(redLevel) <= 0)
				rh.setAD_PrintColor_ID(COLOR_Red);
			else if (qtyOnHand.compareTo(yellowLevel) <= 0)
				rh.setAD_PrintColor_ID(COLOR_Yellow);
			else if (qtyOnHand.compareTo(replenish.getLevel_Max()) <= 0)
				rh.setAD_PrintColor_ID(COLOR_Green);
			else
				rh.setAD_PrintColor_ID(COLOR_White);
			rh.saveEx();

			int cntreplenishrecords = DB.getSQLValue(trxName,
					"SELECT COUNT(*) FROM TOC_Replenish_History WHERE M_Warehouse_ID=? AND M_Product_ID=? AND TRUNC(DateTrx)<=TRUNC(SYSDATE) AND IsActive='Y'",
					wh.getM_Warehouse_ID(), replenish.getM_Product_ID());

			// 3 - Recalculate Level Max if needed (just on working days, and just once per day)
			// this subprocess is ran just when the count of records in replenish history is multiple of the freqAdjustDays
			if (freqAdjustDays <= 0) {
				addLog(pi, "Error Prod - Producto [" + product.getValue() + "] no se ha configurado frecuencia ajuste", product.getM_Product_ID(), null);
			} else {
				if ((cntreplenishrecords % freqAdjustDays) == 0) {
					// count the number of green, yellow, red in the last [freqAdjustDays] days
					int numGreenWhite = 0;
					int numYellow = 0;
					int numRedBlack = 0;
					int numRecords = 0;
					String sql = "SELECT * FROM TOC_Replenish_History WHERE M_Warehouse_ID=? AND M_Product_ID=? AND TRUNC(DateTrx)<=TRUNC(SYSDATE) AND IsActive='Y' ORDER BY DateTrx DESC";
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try
					{
						pstmt = DB.prepareStatement (sql, replenish.get_TrxName());
						pstmt.setInt (1, wh.getM_Warehouse_ID());
						pstmt.setInt (2, replenish.getM_Product_ID());
						rs = pstmt.executeQuery ();
						while (rs.next ()) {
							X_TOC_Replenish_History rhh = new X_TOC_Replenish_History(ctx, rs, trxName);
							int pcid = rhh.getAD_PrintColor_ID();
							if (pcid == COLOR_Green)
								numGreenWhite++;
							else if (pcid == COLOR_Yellow)
								numYellow++;
							else
								numRedBlack++;
							numRecords++;
							if (numRecords >= freqAdjustDays)
								break;
						}
						double percentRed = (double) numRedBlack * (double) 100 / (double) freqAdjustDays;
						double percentGreen = (double) numGreenWhite * (double) 100 / (double) freqAdjustDays;
						BigDecimal newLevelMax = Env.ZERO;
						if (percentRed > pctRedDaysToIncrease.doubleValue()) {
							// increase level max by 1/3
							BigDecimal increment = range.multiply(pctToIncrease).divide(Env.ONEHUNDRED, 0, BigDecimal.ROUND_HALF_UP);
							newLevelMax = replenish.getLevel_Max().add(increment);
						} else if (percentGreen > pctGreenDaysToDecrease.doubleValue()) {
							// decrease level max by 1/3
							BigDecimal decrement = range.multiply(pctToDecrease).divide(Env.ONEHUNDRED, 0, BigDecimal.ROUND_HALF_UP);
							newLevelMax = replenish.getLevel_Max().subtract(decrement);
						}

						if (newLevelMax.signum() > 0 && newLevelMax.compareTo(replenish.getLevel_Min()) > 0) {
							String msg;
							if (newLevelMax.compareTo(replenish.getLevel_Max()) > 0)
								msg = "Incremento - ";
							else
								msg = "Decremento - ";
								
							String msgprd = msg + "Producto [" + product.getValue() + "]";
							String msglog = msgprd + " Anterior=" + replenish.getLevel_Max() + ", Nuevo=" + newLevelMax;
							addLog(pi, msglog, product.getM_Product_ID(), newLevelMax);

							int upd = DB.executeUpdate("UPDATE M_Replenish SET Level_Max=? WHERE M_Warehouse_ID=? AND M_Product_ID=?", 
									new Object[] {newLevelMax, wh.getM_Warehouse_ID(), replenish.getM_Product_ID()},
									false,
									trxName);
							
							String subject = "BM - " + msgprd;
							String text = "Producto [" + product.getValue() + "] se ha cambiado el valor del amortiguador" +
									"\nBodega                ="+wh.getName()+
									"\nStock Maximo Anterior ="+replenish.getLevel_Max()+
									"\nStock Maximo Actual   ="+newLevelMax;
							boolean email = notifyTo.isNotificationEMail();
							boolean notice = notifyTo.isNotificationNote();
							if (email)
							{
								client.sendEMail(notifyFrom, notifyTo, subject, text, null);
							}
							if (notice) {
								int AD_Message_ID = 793; // HARDCODED Replenishment
								MNote note = new MNote(ctx, AD_Message_ID, supervisor_id, null);
								note.setClientOrg(replenish.getAD_Client_ID(), wh.getAD_Org_ID());
								note.setDescription(subject);
								note.setTextMsg(text);
								note.setRecord(MPInstance.Table_ID, pi.getAD_PInstance_ID());
								note.save();
							}
						}
						
					}
					catch (Exception e)
					{
						addLog(pi, e.getLocalizedMessage(), null, null);
					}
					finally
					{
						DB.close(rs, pstmt);
						rs = null; pstmt = null;
					}

				}
			}

			// 4 - Just reorder if it's on the frequency purchase days
			// this subprocess is ran just when the count of records in replenish history is multiple of the purchaseAdjustDays
			if (purchaseAdjustDays <= 0) {
				addLog(pi, "Error Prod - Producto [" + product.getValue() + "] no configurado ajuste compra", product.getM_Product_ID(), null);
			} else {
				if ((cntreplenishrecords % purchaseAdjustDays) != 0) {
					// don't return QtyToOrder to calling process as it's not day to purchase
					qtyToOrder = Env.ZERO;
				}
			}
		}
		
		if (alreadyExecutedToday)
			qtyToOrder = Env.ZERO;
		
		if (qtyToOrder.compareTo(Env.ZERO) > 0)
			qtyToOrder = minimumOrderQuantity (product, qtyToOrder, trxName);
			
		if (qtyToOrder.compareTo(Env.ZERO) > 0) {
			addLog(pi, "Abastecer - Producto [" + product.getValue() + "] Cantidad=" + qtyToOrder, product.getM_Product_ID(), qtyToOrder);
		}
		
		return qtyToOrder;
	}

	private void addLog(MPInstance pi, String message, Integer p_id, BigDecimal p_number) {
		DB.executeUpdate("INSERT INTO AD_PInstance_Log (ad_pinstance_id,log_id,p_date,p_msg,p_id,p_number) VALUES (?,?,SYSDATE,?,?,?)", 
				new Object[] {pi.getAD_PInstance_ID(), MSequence.getNextID(pi.getAD_Client_ID(), "AD_PInstance_Log"), message, p_id, p_number}, 
				false,
				pi.get_TrxName());
	}
	
	public BigDecimal minimumOrderQuantity (MProduct product, BigDecimal qtytoorder, String trxname)
	{
		// Minimum Order Quantity
		BigDecimal ordermin = DB.getSQLValueBD(trxname, "SELECT Order_Min FROM M_Product_PO WHERE AD_Client_ID = ? AND M_Product_ID = ? AND IsCurrentVendor = 'Y'", product.getAD_Client_ID(), product.getM_Product_ID());
		if (ordermin != null && ordermin.compareTo(qtytoorder) > 0 )
			qtytoorder = ordermin;
		
		// Even dividable by Pack
		BigDecimal orderpack = DB.getSQLValueBD(trxname, "SELECT Order_Pack FROM M_Product_PO WHERE AD_Client_ID = ? AND M_Product_ID = ? AND IsCurrentVendor = 'Y'", product.getAD_Client_ID(), product.getM_Product_ID());
		if (orderpack != null && qtytoorder.remainder(orderpack).compareTo(Env.ZERO) > 0 )
			qtytoorder = qtytoorder.subtract(qtytoorder.remainder(orderpack)).add(orderpack);
						
		
		return qtytoorder;
	}	//	minimumOrderQuantity

}
