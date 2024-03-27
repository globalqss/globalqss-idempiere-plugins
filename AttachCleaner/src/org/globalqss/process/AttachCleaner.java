/**********************************************************************
* This file is part of Adempiere ERP Bazaar                           *
* http://www.adempiere.org                                            *
*                                                                     *
* Copyright (C) Contributors                                          *
*                                                                     *
* This program is free software; you can redistribute it and/or       *
* modify it under the terms of the GNU General Public License         *
* as published by the Free Software Foundation; either version 2      *
* of the License, or (at your option) any later version.              *
*                                                                     *
* This program is distributed in the hope that it will be useful,     *
* but WITHOUT ANY WARRANTY; without even the implied warranty of      *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the        *
* GNU General Public License for more details.                        *
*                                                                     *
* You should have received a copy of the GNU General Public License   *
* along with this program; if not, write to the Free Software         *
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,          *
* MA 02110-1301, USA.                                                 *
*                                                                     *
* Contributors:                                                       *
* - Carlos Ruiz                                                      *
*                                                                     * 
* Sponsors:                                                           *
* - GlobalQSS (http://www.globalqss.com)                              *
**********************************************************************/

package org.globalqss.process;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.logging.Level;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MAttachment;
import org.compiere.model.MAttachmentEntry;
import org.compiere.model.MTable;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.DB;
import org.compiere.util.Msg;
import org.compiere.util.Util;

/**
 *	Attach Cleaner
 *	
 *  @author Jesus Garcia - globalqss
 */

public class AttachCleaner extends SvrProcess{
	
	/**	Client							*/
	private int			m_AD_Client_ID = 0;
	
	private int			p_AD_Table_ID = 0;
	private String		p_Pattern = null;
	private Timestamp	m_createdDate_From = null;
	private Timestamp	m_createdDate_To = null;
	
	protected void prepare() {
		ProcessInfoParameter[] parameter = getParameter();
		for (int i = 0; i < parameter.length; i++)
		{
			String name = parameter[i].getParameterName();
			if (parameter[i].getParameter() == null);
			else if (name.equals("AD_Table_ID"))
				p_AD_Table_ID = parameter[i].getParameterAsInt();
			else if (name.equals("FormatPattern"))
				p_Pattern = parameter[i].getParameterAsString();
			else if (name.equals("CreatedDate"))
			{
				m_createdDate_From = ((Timestamp)parameter[i].getParameter());
				m_createdDate_To = ((Timestamp)parameter[i].getParameter_To());
			}

			else
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
		}
		
		m_AD_Client_ID = getAD_Client_ID();
		
		if (!(m_createdDate_From instanceof Timestamp))
			m_createdDate_From = null;
		if (!(m_createdDate_To instanceof Timestamp))
			m_createdDate_To = null;
		if (m_createdDate_From == null)
			m_createdDate_From = new Timestamp(System.currentTimeMillis());
		if (m_createdDate_To == null)
			m_createdDate_To = m_createdDate_From;
		
	}  // prepare

	protected String doIt() throws Exception {
		
		if (log.isLoggable(Level.INFO)) log.info("AD_Table_ID=" + p_AD_Table_ID + " FormatPattern=" + p_Pattern
				+ " createdDate_From=" + m_createdDate_From + " createdDate_To=" + m_createdDate_To);
		//
		
		if (!(p_AD_Table_ID > 0) || Util.isEmpty(p_Pattern.replace("%", ""), true))
			return "Nothing To Do";
		
		MTable table = new MTable(getCtx(), p_AD_Table_ID, get_TrxName());

		int ad_table_id = table.getAD_Table_ID();
		String tableName = table.getTableName();
			
		String sql = null;
		sql = "SELECT " + tableName + "_ID" + " FROM " + tableName
			+ " WHERE AD_Client_ID=?";
		if (m_createdDate_From != null && m_createdDate_To != null)
			sql += " AND TRUNC(Created) BETWEEN "
				+ DB.TO_DATE(m_createdDate_From, true) + " AND "
				+ DB.TO_DATE(m_createdDate_To, true);
		sql += " ORDER BY " + tableName + "_ID";
		
		PreparedStatement pstmt = null;
		try
		{
			pstmt = DB.prepareStatement (sql, null);
			int index = 1;
			pstmt.setInt(index++, m_AD_Client_ID);
		}
		catch (Exception e)
		{
			log.log(Level.SEVERE, sql, e);
			throw new AdempiereException(e.getLocalizedMessage());
		}
		
		ResultSet rs = null;
		rs = pstmt.executeQuery ();
		int record_id;
		
		int noEntries = 0;
		int nodel = 0;
		int totdel = 0;
		while (rs.next ())
		{
			record_id = rs.getInt(1);
			
			MAttachment attach =  MAttachment.get(getCtx(), ad_table_id, record_id);
			if (attach == null)
				continue;
			nodel = 0;
			String filename = null;
			p_Pattern = p_Pattern.toLowerCase();
			noEntries = attach.getEntries().length;
			for (int idx = noEntries - 1; idx >= 0; idx--) {
				MAttachmentEntry entry = attach.getEntry(idx);
				filename = entry.getName().toLowerCase();
				if  ( (p_Pattern.startsWith("%") && filename.endsWith(p_Pattern.replaceAll("%", "")))
						|| (p_Pattern.endsWith("%") && filename.startsWith(p_Pattern.replaceAll("%", "")))
						|| filename.contains(p_Pattern.replace("%", ""))
					    || p_Pattern.replace("%", "").equals("*") )
					{ if (attach.deleteEntry(idx))
						nodel++;
					}
			}
			if (nodel > 0) {
				attach.save(null);
				totdel = totdel + nodel;
			}
		}
		
		addLog("@Deleted@ " + totdel);
		StringBuilder msg = new StringBuilder().append(Msg.getElement(getCtx(), tableName + "_ID")).append(" #").append(totdel);
		
		return msg.toString();
		
	}	// doIt

}
