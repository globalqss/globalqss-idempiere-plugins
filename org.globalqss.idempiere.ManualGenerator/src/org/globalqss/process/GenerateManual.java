/***********************************************************************
 * This file is part of iDempiere ERP Open Source                      *
 * http://www.idempiere.org                                            *
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
 * - Carlos Ruiz - globalqss                                           *
 **********************************************************************/

package org.globalqss.process;

import static org.compiere.model.SystemIDs.TREE_MENUPRIMARY;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.Adempiere;
import org.compiere.model.MField;
import org.compiere.model.MForm;
import org.compiere.model.MInfoWindow;
import org.compiere.model.MMenu;
import org.compiere.model.MProcess;
import org.compiere.model.MProcessPara;
import org.compiere.model.MSysConfig;
import org.compiere.model.MTab;
import org.compiere.model.MTask;
import org.compiere.model.MTree;
import org.compiere.model.MTreeNode;
import org.compiere.model.MWindow;
import org.compiere.model.Query;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.compiere.util.Util;
import org.compiere.wf.MWorkflow;
import org.jopendocument.dom.ODSingleXMLDocument;
import org.jopendocument.dom.template.JavaScriptFileTemplate;

/**
 *	GenerateManual
 *
 *  @author Carlos Ruiz - globalqss - Quality Systems & Solutions - http://globalqss.com
 */
public class GenerateManual extends SvrProcess {

	File m_fullManual = null;
	ODSingleXMLDocument m_fullDoc = null;
	int m_count = 0;
	int m_items = 0;
	String m_templateFolder = null;

	/**
	 *  Prepare - e.g., get Parameters.
	 */
	protected void prepare()
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			if (para[i].getParameter() == null)
				;
			else
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
		}
	}	//	prepare

	/**
	 * 	Process
	 *	@return message
	 *	@throws Exception
	 */
	protected String doIt() throws Exception {
		m_templateFolder = MSysConfig.getValue("QSS_TEMPLATE_FOLDER_GENERATE_MANUAL", Adempiere.getAdempiereHome() + "/templates");
		m_fullManual = new File("/tmp/FullManual.odt");

		// Load the menu tree
		Properties ctx = getCtx();
		int adRoleId = Env.getAD_Role_ID(ctx);
		int adTreeId = DB.getSQLValueEx(get_TrxName(),
				"SELECT COALESCE(r.AD_Tree_Menu_ID, ci.AD_Tree_Menu_ID)"
						+ "FROM AD_ClientInfo ci"
						+ " INNER JOIN AD_Role r ON (ci.AD_Client_ID=r.AD_Client_ID) "
						+ "WHERE AD_Role_ID=?", adRoleId);
		if (adTreeId <= 0)
			adTreeId = TREE_MENUPRIMARY;    //  Menu
		MTree mTree = new MTree(ctx, adTreeId, false, true, get_TrxName());
		MTreeNode rootNode = mTree.getRoot();

		countMenu(rootNode);

		File templateFile = new File(m_templateFolder + "/TemplateStart.odt");
		m_fullDoc = ODSingleXMLDocument.createFromPackage(templateFile);
		m_fullDoc.saveToPackageAs(m_fullManual);
		m_fullDoc = null;

		generateMenu(rootNode);

		if (processUI != null)
			processUI.download(m_fullManual);

		return "OK";
	}

	private void countMenu(MTreeNode rootNode) {
		Enumeration<?> nodeEnum = rootNode.children();
		while (nodeEnum.hasMoreElements()) {
			m_items++;
			MTreeNode mChildNode = (MTreeNode)nodeEnum.nextElement();
			if(mChildNode.getChildCount() != 0) {
				countMenu(mChildNode);
			}
		}
	}

	private void generateMenu(MTreeNode rootNode) throws Exception {
		Enumeration<?> nodeEnum = rootNode.children();
		while (nodeEnum.hasMoreElements()) {
			m_count++;
			MTreeNode mChildNode = (MTreeNode)nodeEnum.nextElement();
			int percent = m_count * 100 / m_items;
			processUI.statusUpdate(percent + "%");
			// System.out.println(m_count + " - " + mChildNode.getName());

			generateTitle(mChildNode);
			if(mChildNode.getChildCount() != 0) {
				generateMenu(mChildNode);
			} else {
				generatePage(mChildNode);
			}

			if (m_count % 10 == 0) { // gc and sleep every 10 pages
				System.gc(); // dirty hack to keep the memory consumption low
				Thread.sleep(250); // allowing time to garbage collection
			}
		}
	}

	private void generateTitle(MTreeNode mChildNode) throws Exception {
		int templateLevel = mChildNode.getLevel();
		File templateFile = new File(m_templateFolder + "/TemplateTitle"+templateLevel+".odt");
		File pageFile = new File("/tmp/ManualTmpTitle.fodt");
		JavaScriptFileTemplate template = new JavaScriptFileTemplate(templateFile);
		template.setField("Title", mChildNode.getName());
		template.setField("Description", mChildNode.getDescription());
		ODSingleXMLDocument page = template.createDocument();
		page.saveAs(pageFile);
		appendToFullDoc(page);
	}

	private void appendToFullDoc(ODSingleXMLDocument page) throws Exception {
		m_fullDoc = ODSingleXMLDocument.createFromPackage(m_fullManual);
		m_fullDoc.add(page, false);
		m_fullDoc.saveToPackageAs(m_fullManual);
		m_fullDoc = null;
	}

	private void generatePage(MTreeNode mChildNode) throws Exception {
		File templateFile = new File(m_templateFolder + "/TemplatePage"+mChildNode.getImageIndiactor()+".odt");
		File pageFile = new File("/tmp/ManualTmpPage.fodt");
		JavaScriptFileTemplate template = new JavaScriptFileTemplate(templateFile);
		MMenu node = new MMenu(getCtx(), mChildNode.getNode_ID(), get_TrxName());
		if (MMenu.ACTION_Window.equals(node.getAction())) {
			MWindow window = MWindow.get(getCtx(), node.getAD_Window_ID());
			template.setField("LabelName", Msg.getElement(getCtx(), MWindow.COLUMNNAME_AD_Window_ID));
			template.setField("LabelDescription", Msg.getElement(getCtx(), MWindow.COLUMNNAME_Description));
			template.setField("LabelHelp", Msg.getElement(getCtx(), MWindow.COLUMNNAME_Help));
			template.setField("Name", window.get_Translation(MWindow.COLUMNNAME_Name));
			template.setField("Description", window.get_Translation(MWindow.COLUMNNAME_Description));
			template.setField("Help", window.get_Translation(MWindow.COLUMNNAME_Help));
			ODSingleXMLDocument page = template.createDocument();
			page.saveAs(pageFile);
			appendToFullDoc(page);

			List<MTab> mtabs = new Query(getCtx(), MTab.Table_Name, "AD_Window_ID=?", get_TrxName())
			.setOnlyActiveRecords(true)
			.setOrderBy(MTab.COLUMNNAME_SeqNo)
			.setParameters(window.getAD_Window_ID())
			.list();
			for (MTab tab : mtabs) {
				templateFile = new File(m_templateFolder + "/TemplatePageTab.odt");
				pageFile = new File("/tmp/ManualTmpPage.fodt");
				template = new JavaScriptFileTemplate(templateFile);
				template.setField("LabelTabName", Msg.getElement(getCtx(), MTab.COLUMNNAME_AD_Tab_ID));
				template.setField("LabelTabDescription", Msg.getElement(getCtx(), MTab.COLUMNNAME_Description));
				template.setField("LabelTabHelp", Msg.getElement(getCtx(), MTab.COLUMNNAME_Help));
				template.setField("LabelFieldName", Msg.getElement(getCtx(), MField.COLUMNNAME_AD_Field_ID));
				template.setField("LabelFieldDescription", Msg.getElement(getCtx(), MField.COLUMNNAME_Description));
				template.setField("LabelFieldHelp", Msg.getElement(getCtx(), MField.COLUMNNAME_Help));

				template.setField("TabName", tab.get_Translation(MWindow.COLUMNNAME_Name));
				template.setField("TabDescription", tab.get_Translation(MWindow.COLUMNNAME_Description));
				template.setField("TabHelp", tab.get_Translation(MWindow.COLUMNNAME_Help));

				List<MField> mfields = new Query(getCtx(), MField.Table_Name, "IsDisplayed='Y' AND AD_Tab_ID=?", get_TrxName())
				.setOnlyActiveRecords(true)
				.setOrderBy(MTab.COLUMNNAME_SeqNo)
				.setParameters(tab.getAD_Tab_ID())
				.list();
				List<Map<String, String>> fields = new ArrayList<Map<String, String>>();
				for (MField field : mfields) {
					fields.add(createFieldMap(
							field.get_Translation(MField.COLUMNNAME_Name),
							field.get_Translation(MField.COLUMNNAME_Description),
							field.get_Translation(MField.COLUMNNAME_Help)
							));
				}
				template.setField("fields", fields);
				page = template.createDocument();
				page.saveAs(pageFile);
				appendToFullDoc(page);
			}

		} else if (MMenu.ACTION_Form.equals(node.getAction())) {
			MForm form = new MForm(getCtx(), node.getAD_Form_ID(), get_TrxName());
			template.setField("LabelName", Msg.getElement(getCtx(), MForm.COLUMNNAME_AD_Form_ID));
			template.setField("Name", form.get_Translation(MForm.COLUMNNAME_Name));
			template.setField("LabelDescription", Msg.getElement(getCtx(), MForm.COLUMNNAME_Description));
			template.setField("Description", form.get_Translation(MForm.COLUMNNAME_Description));
			template.setField("LabelHelp", Msg.getElement(getCtx(), MForm.COLUMNNAME_Help));
			template.setField("Help", form.get_Translation(MForm.COLUMNNAME_Help));
			ODSingleXMLDocument page = template.createDocument();
			page.saveAs(pageFile);
			appendToFullDoc(page);

		} else if (MMenu.ACTION_Process.equals(node.getAction())) {
			MProcess process = MProcess.get(getCtx(), node.getAD_Process_ID());
			template.setField("LabelName", Msg.getElement(getCtx(), MProcess.COLUMNNAME_AD_Process_ID));
			template.setField("Name", process.get_Translation(MProcess.COLUMNNAME_Name));
			template.setField("LabelDescription", Msg.getElement(getCtx(), MProcess.COLUMNNAME_Description));
			template.setField("Description", process.get_Translation(MProcess.COLUMNNAME_Description));
			template.setField("LabelHelp", Msg.getElement(getCtx(), MProcess.COLUMNNAME_Help));
			template.setField("Help", process.get_Translation(MProcess.COLUMNNAME_Help));

			template.setField("LabelParameterName", Msg.getElement(getCtx(), MProcessPara.COLUMNNAME_AD_Process_Para_ID));
			template.setField("LabelParameterDescription", Msg.getElement(getCtx(), MProcessPara.COLUMNNAME_Description));
			template.setField("LabelParameterHelp", Msg.getElement(getCtx(), MProcessPara.COLUMNNAME_Help));
			List<MProcessPara> mparams = new Query(getCtx(), MProcessPara.Table_Name, "AD_Process_ID=?", get_TrxName())
			.setOnlyActiveRecords(true)
			.setOrderBy(MTab.COLUMNNAME_SeqNo)
			.setParameters(process.getAD_Process_ID())
			.list();
			List<Map<String, String>> parameters = new ArrayList<Map<String, String>>();
			for (MProcessPara procpara : mparams) {
				parameters.add(createParameterMap(
						procpara.get_Translation(MProcessPara.COLUMNNAME_Name),
						procpara.get_Translation(MProcessPara.COLUMNNAME_Description),
						procpara.get_Translation(MProcessPara.COLUMNNAME_Help)
						));
			}
			template.setField("parameters", parameters);
			if (parameters.size() == 0)
				template.hideTable("ParameterTable");

			ODSingleXMLDocument page = template.createDocument();
			page.saveAs(pageFile);
			appendToFullDoc(page);

		} else if (MMenu.ACTION_Report.equals(node.getAction())) {
			MProcess process = MProcess.get(getCtx(), node.getAD_Process_ID());
			template.setField("LabelName", Util.cleanAmp(Msg.getMsg(getCtx(), "Report")));
			template.setField("Name", process.get_Translation(MProcess.COLUMNNAME_Name));
			template.setField("LabelDescription", Msg.getElement(getCtx(), MProcess.COLUMNNAME_Description));
			template.setField("Description", process.get_Translation(MProcess.COLUMNNAME_Description));
			template.setField("LabelHelp", Msg.getElement(getCtx(), MProcess.COLUMNNAME_Help));
			template.setField("Help", process.get_Translation(MProcess.COLUMNNAME_Help));

			template.setField("LabelParameterName", Msg.getElement(getCtx(), MProcessPara.COLUMNNAME_AD_Process_Para_ID));
			template.setField("LabelParameterDescription", Msg.getElement(getCtx(), MProcessPara.COLUMNNAME_Description));
			template.setField("LabelParameterHelp", Msg.getElement(getCtx(), MProcessPara.COLUMNNAME_Help));
			List<MProcessPara> mparams = new Query(getCtx(), MProcessPara.Table_Name, "AD_Process_ID=?", get_TrxName())
			.setOnlyActiveRecords(true)
			.setOrderBy(MTab.COLUMNNAME_SeqNo)
			.setParameters(process.getAD_Process_ID())
			.list();
			List<Map<String, String>> parameters = new ArrayList<Map<String, String>>();
			for (MProcessPara procpara : mparams) {
				parameters.add(createParameterMap(
						procpara.get_Translation(MProcessPara.COLUMNNAME_Name),
						procpara.get_Translation(MProcessPara.COLUMNNAME_Description),
						procpara.get_Translation(MProcessPara.COLUMNNAME_Help)
						));
			}
			template.setField("parameters", parameters);
			if (parameters.size() == 0)
				template.hideTable("ParameterTable");

			ODSingleXMLDocument page = template.createDocument();
			page.saveAs(pageFile);
			appendToFullDoc(page);

		} else if (MMenu.ACTION_Task.equals(node.getAction())) {
			MTask task = new MTask(getCtx(), node.getAD_Task_ID(), get_TrxName());
			template.setField("LabelName", Msg.getElement(getCtx(), MTask.COLUMNNAME_AD_Task_ID));
			template.setField("Name", task.get_Translation(MTask.COLUMNNAME_Name));
			template.setField("LabelDescription", Msg.getElement(getCtx(), MTask.COLUMNNAME_Description));
			template.setField("Description", task.get_Translation(MTask.COLUMNNAME_Description));
			template.setField("LabelHelp", Msg.getElement(getCtx(), MTask.COLUMNNAME_Help));
			template.setField("Help", task.get_Translation(MTask.COLUMNNAME_Help));
			ODSingleXMLDocument page = template.createDocument();
			page.saveAs(pageFile);
			appendToFullDoc(page);

		} else if (MMenu.ACTION_WorkFlow.equals(node.getAction())) {
			MWorkflow workflow = MWorkflow.get(getCtx(), node.getAD_Workflow_ID());
			template.setField("LabelName", Msg.getElement(getCtx(), MWorkflow.COLUMNNAME_AD_Workflow_ID));
			template.setField("Name", workflow.get_Translation(MWorkflow.COLUMNNAME_Name));
			template.setField("LabelDescription", Msg.getElement(getCtx(), MWorkflow.COLUMNNAME_Description));
			template.setField("Description", workflow.get_Translation(MWorkflow.COLUMNNAME_Description));
			template.setField("LabelHelp", Msg.getElement(getCtx(), MWorkflow.COLUMNNAME_Help));
			template.setField("Help", workflow.get_Translation(MWorkflow.COLUMNNAME_Help));
			ODSingleXMLDocument page = template.createDocument();
			page.saveAs(pageFile);
			appendToFullDoc(page);

		} else if (MMenu.ACTION_Info.equals(node.getAction())) {
			MInfoWindow infowindow = new MInfoWindow(getCtx(), node.getAD_InfoWindow_ID(), get_TrxName());
			template.setField("LabelName", Msg.getElement(getCtx(), MInfoWindow.COLUMNNAME_AD_InfoWindow_ID));
			template.setField("Name", infowindow.get_Translation(MInfoWindow.COLUMNNAME_Name));
			template.setField("LabelDescription", Msg.getElement(getCtx(), MInfoWindow.COLUMNNAME_Description));
			template.setField("Description", infowindow.get_Translation(MInfoWindow.COLUMNNAME_Description));
			template.setField("LabelHelp", Msg.getElement(getCtx(), MInfoWindow.COLUMNNAME_Help));
			template.setField("Help", infowindow.get_Translation(MInfoWindow.COLUMNNAME_Help));
			ODSingleXMLDocument page = template.createDocument();
			page.saveAs(pageFile);
			appendToFullDoc(page);

		}

	}

	private Map<String, String> createParameterMap(String ParameterName, String ParameterDescription, String ParameterHelp) {
		Map<String, String> res = new HashMap<String, String>();
		res.put("ParameterName", ParameterName);
		res.put("ParameterDescription", ParameterDescription);
		res.put("ParameterHelp", ParameterHelp);
		return res;
	}

	private static Map<String, String> createFieldMap(String FieldName, String FieldDescription, String FieldHelp) {
		Map<String, String> res = new HashMap<String, String>();
		res.put("FieldName", FieldName);
		res.put("FieldDescription", FieldDescription);
		res.put("FieldHelp", FieldHelp);
		return res;
	}

} // end GenerateManual
