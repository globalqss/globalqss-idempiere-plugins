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
	private static final BigDecimal THREE	= BigDecimal.valueOf(3.0);
	
	private static double TWOTHIRDS			= (double) 2 / (double) 3;

	public BigDecimal getQtyToOrder(MWarehouse wh, X_T_Replenish replenish) {
		BigDecimal qtyToOrder = Env.ZERO;
		BigDecimal redLevel = replenish.getLevel_Max().divide(THREE, SCALE_FOR_LEVELS, BigDecimal.ROUND_DOWN);
		BigDecimal yellowLevel = replenish.getLevel_Max().multiply(TWO).divide(THREE, SCALE_FOR_LEVELS, BigDecimal.ROUND_DOWN);
		BigDecimal qtyOnHand = replenish.getQtyOnHand();
		
		Properties ctx = replenish.getCtx();
		String trxName = replenish.get_TrxName();

		MProduct product = MProduct.get(ctx, replenish.getM_Product_ID());

		MPInstance pi = new MPInstance(ctx, replenish.getAD_PInstance_ID(), trxName);

		// Validate red level and raise alert
		// red level is when qty on hand is less or equal than one third of the max level
		if (qtyOnHand.compareTo(redLevel) <= 0) {
			pi.addLog(null, (Integer) null, null, "Product [" + product.getName() + "] IN RED LEVEL!!!  Replenish immediately!");
			int supervisor_id = MOrgInfo.get(ctx, wh.getAD_Org_ID()).getSupervisor_ID();
			if (supervisor_id <= 0) {
				pi.addLog(null, (Integer) null, null, "Org " + wh.getAD_Org_ID() + " doesn't have supervisor configured");
			} else {
				MUser from = MUser.get(ctx, pi.getAD_User_ID());
				MUser user = MUser.get(ctx, supervisor_id);
				boolean email = user.isNotificationEMail();
				boolean notice = user.isNotificationNote();
				String subject = "TOC Buffer Management - red level for Product [" + product.getName() + "]";
				String text = "Product [" + product.getValue()+"-"+product.getName() + "] IN RED LEVEL!!!  Replenish immediately!";
				if (email)
				{
					MClient client = MClient.get(ctx, replenish.getAD_Client_ID());
					client.sendEMail(from, user, subject, text, null);
				}
				if (notice) {
					int AD_Message_ID = 793; // HARDCODED Replenishment
					MNote note = new MNote(ctx, AD_Message_ID, supervisor_id, null);
					note.setClientOrg(replenish.getAD_Client_ID(), wh.getAD_Org_ID());
					note.setTextMsg(subject);
					note.setDescription(text);
					note.setRecord(MPInstance.Table_ID, pi.getAD_PInstance_ID());
					note.save();
				}
			}
			
			// do not replenish, just raise the alert
			qtyToOrder = Env.ZERO;
		} else {
			// Replenish to the max level
			BigDecimal qtyOnHandPlusOrdered = qtyOnHand.add(replenish.getQtyOrdered());
			qtyToOrder = replenish.getLevel_Max().subtract(qtyOnHandPlusOrdered);
			if (qtyToOrder.signum() < 0)
				qtyToOrder = Env.ZERO;
		}
		
		// Create or update the Replenish History record
		// just when the process is ran on working days
		Timestamp today = new Timestamp(System.currentTimeMillis());
		boolean isWorkingDay = true;
		if (today.getDay() == 0 /* Sunday */ || today.getDay() == 6 /* Saturday */) {
			isWorkingDay = false;
		} else {
			int defaultCalendarID = MClientInfo.get(ctx, replenish.getAD_Client_ID()).getC_Calendar_ID();
			int nbid = DB.getSQLValue(trxName,
					"SELECT C_NonBusinessDay_ID FROM C_NonBusinessDay WHERE C_Calendar_ID=? AND AD_Client_ID=? AND AD_Org_ID IN (0, ?) AND TRUNC(Date1)=TRUNC(?) AND IsActive='Y'",
					defaultCalendarID, wh.getAD_Client_ID(), wh.getAD_Org_ID(), today);
			if (nbid > 0)
				isWorkingDay = false;
		}
		
		if (isWorkingDay) {
			int rh_id = DB.getSQLValue(trxName,
					"SELECT TOC_Replenish_History_ID FROM TOC_Replenish_History WHERE M_Warehouse_ID=? AND M_Product_ID=? AND TRUNC(DateTrx)=TRUNC(?)) AND IsActive='Y'",
					wh.getM_Warehouse_ID(), replenish.getM_Product_ID(), today);
			X_TOC_Replenish_History rh = null;
			if (rh_id > 0)  // It was already executed today
				rh = new X_TOC_Replenish_History(ctx, rh_id, trxName);
			if (rh == null) {
				rh = new X_TOC_Replenish_History(ctx, 0, trxName);
				rh.setM_Product_ID(replenish.getM_Product_ID());
				rh.setM_Warehouse_ID(wh.getM_Warehouse_ID());
			}
			rh.setAD_Org_ID(wh.getAD_Org_ID());
			rh.setDateTrx(today);
			rh.setQtyOnHand(qtyOnHand);
			rh.setQtyOrdered(replenish.getQtyOrdered());
			rh.setQtyReserved(replenish.getQtyReserved());
			rh.setLevel_Max(replenish.getLevel_Max());
			// Assign color
			if (qtyOnHand.compareTo(Env.ZERO) <= 0)
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
			
			// Recalculate Level Max if needed
			// this subprocess is ran just when the count of records in replenish history is multiple of the deliveryTime
			int deliveryTime = DB.getSQLValue(trxName,
					"SELECT DeliveryTime_Promised FROM M_Product_PO WHERE M_Product_ID=? AND IsCurrentVendor='Y' AND IsActive='Y' ORDER BY Created",
					replenish.getM_Product_ID());
			if (deliveryTime <= 0) {
				deliveryTime = DB.getSQLValue(trxName,
						"SELECT MAX(DeliveryTime_Promised) FROM M_Product_PO WHERE M_Product_ID=? AND IsActive='Y'",
						replenish.getM_Product_ID());
			}
			if (deliveryTime <= 0) {
				pi.addLog(null, (Integer) null, null, "Product [" + product.getName() + "] requires delivery time promised configured");
			} else {
				int cnt = DB.getSQLValue(trxName,
						"SELECT COUNT(*) FROM TOC_Replenish_History WHERE M_Warehouse_ID=? AND M_Product_ID=? AND TRUNC(DateTrx)<TRUNC(?)) AND IsActive='Y'",
						wh.getM_Warehouse_ID(), replenish.getM_Product_ID(), today);
				if ((cnt % deliveryTime) == 0) {
					// count the number of green, yellow, red in the last [deliveryTime] days
					int numGreenWhite = 0;
					int numYellow = 0;
					int numRedBlack = 0;
					String sql = "SELECT * FROM TOC_Replenish_History WHERE M_Warehouse_ID=? AND M_Product_ID=? AND TRUNC(DateTrx)<TRUNC(?)) AND IsActive='Y' ORDER BY DateTrx DESC";
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try
					{
						pstmt = DB.prepareStatement (sql, replenish.get_TrxName());
						pstmt.setInt (1, wh.getM_Warehouse_ID());
						pstmt.setInt (2, replenish.getM_Product_ID());
						pstmt.setTimestamp(3, today);
						rs = pstmt.executeQuery ();
						while (rs.next ()) {
							X_TOC_Replenish_History rhh = new X_TOC_Replenish_History(ctx, rs, trxName);
							int pcid = rhh.getAD_PrintColor_ID();
							if (pcid == COLOR_Green || pcid == COLOR_White)
								numGreenWhite++;
							else if (pcid == COLOR_Yellow)
								numYellow++;
							else
								numRedBlack++;
							double percentRed = (double) numRedBlack / (double) deliveryTime;
							double percentGreen = (double) numGreenWhite / (double) deliveryTime;
							BigDecimal newLevelMax = Env.ZERO;
							if (percentRed > TWOTHIRDS) {
								// increase level max by 1/3
								newLevelMax = replenish.getLevel_Max().add(replenish.getLevel_Max().divide(THREE, 0, BigDecimal.ROUND_HALF_UP));
								pi.addLog(null, (Integer) null, null, "Increainsg buffer for Product [" + product.getName() + "] from " + replenish.getLevel_Max() + " to " + newLevelMax);
								
							} else if (percentGreen > TWOTHIRDS) {
								// decrease level max by 1/3
								newLevelMax = replenish.getLevel_Max().subtract(replenish.getLevel_Max().divide(THREE, 0, BigDecimal.ROUND_HALF_UP));
								pi.addLog(null, (Integer) null, null, "Decreainsg buffer for Product [" + product.getName() + "] from " + replenish.getLevel_Max() + " to " + newLevelMax);
							}
							if (newLevelMax.signum() > 0) {
								int upd = DB.executeUpdate("UPDATE M_Replenish SET Level_Max=? WHERE M_Warehouse_ID=? AND M_Product_ID=?", 
										new Object[] {newLevelMax, wh.getM_Warehouse_ID(), replenish.getM_Product_ID()},
										false,
										trxName);
							}
						}
					}
					catch (Exception e)
					{
						pi.addLog(null, (Integer) null, null, e.getLocalizedMessage());
					}
					finally
					{
						DB.close(rs, pstmt);
						rs = null; pstmt = null;
					}
					
				}
			}
		}
		
		return qtyToOrder;
	}

}
