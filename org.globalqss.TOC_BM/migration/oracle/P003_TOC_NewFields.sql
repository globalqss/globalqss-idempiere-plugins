-- Jun 2, 2011 11:37:43 AM ECT
-- Light Manufacturing - Preparing idempiere/adempiere for TOC
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,Help,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,55175,0,'TOC_PurchaseAdjustDays',TO_DATE('2011-06-02 11:35:59','YYYY-MM-DD HH24:MI:SS'),100,'Number of days where buffer management process suggest a purchase','TOC',NULL,'Y','Purchase Adjustment','Purchase Adjustment',TO_DATE('2011-06-02 11:35:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 11:37:43 AM ECT
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=55175 AND EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Element_ID!=t.AD_Element_ID)
;

-- Jun 2, 2011 11:39:07 AM ECT
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Ajuste Compras',PrintName='Ajuste Compras',Description='Número de días para que el proceso de Buffer Management sugiera una compra',Updated=TO_DATE('2011-06-02 11:39:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=55175 AND AD_Language LIKE 'es_%'
;

-- Jun 2, 2011 11:48:52 AM ECT
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,55176,0,'TOC_FreqAdjustDays',TO_DATE('2011-06-02 11:48:04','YYYY-MM-DD HH24:MI:SS'),100,'Number of days where buffer management adjust the stock maximum','TOC','Y','Frequency Adjustment','Frequency Adjustment',TO_DATE('2011-06-02 11:48:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 11:48:52 AM ECT
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=55176 AND EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Element_ID!=t.AD_Element_ID)
;

-- Jun 2, 2011 11:49:56 AM ECT
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Frecuencia Ajuste',PrintName='Frecuencia Ajuste',Description='Número de días en que el proceso Buffer Management ajusta el stock máximo',Updated=TO_DATE('2011-06-02 11:49:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=55176 AND AD_Language LIKE 'es_%'
;

-- Jun 2, 2011 11:53:14 AM ECT
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,55177,0,'TOC_PctRedDaysToIncrease',TO_DATE('2011-06-02 11:53:11','YYYY-MM-DD HH24:MI:SS'),100,'Percent of days that must be in red in order Buffer Management increase the stock maximum','TOC','Y','Percent Red Days to Increase','Percent Red Days to Increase',TO_DATE('2011-06-02 11:53:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 11:53:14 AM ECT
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=55177 AND EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Element_ID!=t.AD_Element_ID)
;

-- Jun 2, 2011 11:54:05 AM ECT
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='% Días en Rojo para Incremento',PrintName='% Días en Rojo para Incremento',Description='Porcentaje de días que deben estar en rojo para que el proceso Buffer Management incremente el stock máximo',Updated=TO_DATE('2011-06-02 11:54:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=55177 AND AD_Language LIKE 'es_%'
;

-- Jun 2, 2011 11:54:13 AM ECT
UPDATE AD_Element SET Name='% Red Days to Increase', PrintName='% Red Days to Increase',Updated=TO_DATE('2011-06-02 11:54:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=55177
;

-- Jun 2, 2011 11:54:13 AM ECT
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=55177
;

-- Jun 2, 2011 11:54:13 AM ECT
UPDATE AD_Column SET ColumnName='TOC_PctRedDaysToIncrease', Name='% Red Days to Increase', Description='Percent of days that must be in red in order Buffer Management increase the stock maximum', Help=NULL WHERE AD_Element_ID=55177
;

-- Jun 2, 2011 11:54:13 AM ECT
UPDATE AD_Field SET Name='% Red Days to Increase', Description='Percent of days that must be in red in order Buffer Management increase the stock maximum', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=55177) AND IsCentrallyMaintained='Y'
;

-- Jun 2, 2011 11:54:13 AM ECT
UPDATE AD_Process_Para SET ColumnName='TOC_PctRedDaysToIncrease', Name='% Red Days to Increase', Description='Percent of days that must be in red in order Buffer Management increase the stock maximum', Help=NULL, AD_Element_ID=55177 WHERE UPPER(ColumnName)='TOC_PCTREDDAYSTOINCREASE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 2, 2011 11:54:13 AM ECT
UPDATE AD_Process_Para SET ColumnName='TOC_PctRedDaysToIncrease', Name='% Red Days to Increase', Description='Percent of days that must be in red in order Buffer Management increase the stock maximum', Help=NULL WHERE AD_Element_ID=55177 AND IsCentrallyMaintained='Y'
;

-- Jun 2, 2011 11:54:13 AM ECT
UPDATE AD_PrintFormatItem pi SET PrintName='% Red Days to Increase', Name='% Red Days to Increase' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=55177)
;

-- Jun 2, 2011 11:54:13 AM ECT
UPDATE AD_PrintFormatItem pi SET PrintName='% Red Days to Increase', Name='% Red Days to Increase' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=55177)
;

-- Jun 2, 2011 11:54:59 AM ECT
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,55178,0,'TOC_PctGreenDaysToDecrease',TO_DATE('2011-06-02 11:54:57','YYYY-MM-DD HH24:MI:SS'),100,'Percent of days that must be in green in order Buffer Management decrease the stock maximum','TOC','Y','% Green Days to Decrease','% Green Days to Decrease',TO_DATE('2011-06-02 11:54:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 11:54:59 AM ECT
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=55178 AND EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Element_ID!=t.AD_Element_ID)
;

-- Jun 2, 2011 11:55:38 AM ECT
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='% Días en Verde para Decremento',PrintName='% Días en Verde para Decremento',Description='Porcentaje de días que deben estar en verde para que el proceso Buffer Management decremente el stock máximo',Updated=TO_DATE('2011-06-02 11:55:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=55178 AND AD_Language LIKE 'es_%'
;

-- Jun 2, 2011 11:58:42 AM ECT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,61510,55176,0,11,209,'TOC_FreqAdjustDays',TO_DATE('2011-06-02 11:58:40','YYYY-MM-DD HH24:MI:SS'),100,'Number of days where buffer management adjust the stock maximum','TOC',10,'Y','N','N','N','N','N','N','N','N','N','Y','Frequency Adjustment',0,TO_DATE('2011-06-02 11:58:40','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 2, 2011 11:58:42 AM ECT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=61510 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jun 2, 2011 11:59:03 AM ECT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,61511,55175,0,11,209,'TOC_PurchaseAdjustDays',TO_DATE('2011-06-02 11:59:01','YYYY-MM-DD HH24:MI:SS'),100,'Number of days where buffer management process suggest a purchase','TOC',10,'Y','N','N','N','N','N','N','N','N','N','Y','Purchase Adjustment',0,TO_DATE('2011-06-02 11:59:01','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 2, 2011 11:59:03 AM ECT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=61511 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jun 2, 2011 12:00:55 PM ECT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,61512,55177,0,22,209,'TOC_PctRedDaysToIncrease',TO_DATE('2011-06-02 12:00:54','YYYY-MM-DD HH24:MI:SS'),100,'Percent of days that must be in red in order Buffer Management increase the stock maximum','TOC',10,'Y','N','N','N','N','N','N','N','N','N','Y','% Red Days to Increase',0,TO_DATE('2011-06-02 12:00:54','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 2, 2011 12:00:55 PM ECT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=61512 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jun 2, 2011 12:01:18 PM ECT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,61513,55178,0,22,209,'TOC_PctGreenDaysToDecrease',TO_DATE('2011-06-02 12:01:17','YYYY-MM-DD HH24:MI:SS'),100,'Percent of days that must be in green in order Buffer Management decrease the stock maximum','TOC',10,'Y','N','N','N','N','N','N','N','N','N','Y','% Green Days to Decrease',0,TO_DATE('2011-06-02 12:01:17','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 2, 2011 12:01:18 PM ECT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=61513 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jun 2, 2011 12:06:42 PM ECT
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,55179,0,'TOC_PctToDecrease',TO_DATE('2011-06-02 12:06:40','YYYY-MM-DD HH24:MI:SS'),100,'Percent to decrease the stock maximum by Buffer Management','TOC','Y','% to Decrease','% to Decrease',TO_DATE('2011-06-02 12:06:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 12:06:42 PM ECT
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=55179 AND EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Element_ID!=t.AD_Element_ID)
;

-- Jun 2, 2011 12:07:28 PM ECT
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,55180,0,'TOC_PctToIncrease',TO_DATE('2011-06-02 12:07:26','YYYY-MM-DD HH24:MI:SS'),100,'Percent to increase the stock maximum by Buffer Management','TOC','Y','% to Increase','% to Increase',TO_DATE('2011-06-02 12:07:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 12:07:28 PM ECT
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=55180 AND EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Element_ID!=t.AD_Element_ID)
;

-- Jun 2, 2011 12:07:56 PM ECT
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='% Incremento',PrintName='% Incremento',Description='Porcentaje a incrementar el stock máximo por el proceso Buffer Management',Updated=TO_DATE('2011-06-02 12:07:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=55180 AND AD_Language LIKE 'es_%'
;

-- Jun 2, 2011 12:08:22 PM ECT
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='% Decremento',PrintName='% Decremento',Description='Porcentaje a decrementar el stock máximo por el proceso de Buffer Management',Updated=TO_DATE('2011-06-02 12:08:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=55179 AND AD_Language LIKE 'es_%'
;

-- Jun 2, 2011 12:08:45 PM ECT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,61514,55179,0,22,209,'TOC_PctToDecrease',TO_DATE('2011-06-02 12:08:43','YYYY-MM-DD HH24:MI:SS'),100,'Percent to decrease the stock maximum by Buffer Management','TOC',10,'Y','N','N','N','N','N','N','N','N','N','Y','% to Decrease',0,TO_DATE('2011-06-02 12:08:43','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 2, 2011 12:08:45 PM ECT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=61514 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jun 2, 2011 12:08:57 PM ECT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,61515,55180,0,22,209,'TOC_PctToIncrease',TO_DATE('2011-06-02 12:08:54','YYYY-MM-DD HH24:MI:SS'),100,'Percent to increase the stock maximum by Buffer Management','U',10,'Y','N','N','N','N','N','N','N','N','N','Y','% to Increase',0,TO_DATE('2011-06-02 12:08:54','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 2, 2011 12:08:57 PM ECT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=61515 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jun 2, 2011 12:09:02 PM ECT
UPDATE AD_Column SET EntityType='TOC',Updated=TO_DATE('2011-06-02 12:09:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=61515
;

-- Jun 2, 2011 12:09:39 PM ECT
ALTER TABLE M_Product_Category ADD TOC_FreqAdjustDays NUMBER(10)
;

-- Jun 2, 2011 12:09:46 PM ECT
ALTER TABLE M_Product_Category ADD TOC_PurchaseAdjustDays NUMBER(10)
;

-- Jun 2, 2011 12:09:51 PM ECT
ALTER TABLE M_Product_Category ADD TOC_PctRedDaysToIncrease NUMBER
;

-- Jun 2, 2011 12:09:57 PM ECT
ALTER TABLE M_Product_Category ADD TOC_PctGreenDaysToDecrease NUMBER
;

-- Jun 2, 2011 12:10:02 PM ECT
ALTER TABLE M_Product_Category ADD TOC_PctToDecrease NUMBER
;

-- Jun 2, 2011 12:10:10 PM ECT
ALTER TABLE M_Product_Category ADD TOC_PctToIncrease NUMBER
;

-- Jun 2, 2011 12:17:44 PM ECT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,61510,61704,0,189,TO_DATE('2011-06-02 12:17:43','YYYY-MM-DD HH24:MI:SS'),100,'Number of days where buffer management adjust the stock maximum',10,'TOC','Y','Y','Y','N','N','N','N','N','Frequency Adjustment',140,0,TO_DATE('2011-06-02 12:17:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 12:17:44 PM ECT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61704 AND EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Field_ID!=t.AD_Field_ID)
;

-- Jun 2, 2011 12:18:03 PM ECT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,61511,61705,0,189,TO_DATE('2011-06-02 12:18:03','YYYY-MM-DD HH24:MI:SS'),100,'Number of days where buffer management process suggest a purchase',10,'TOC','Y','Y','Y','N','N','N','N','Y','Purchase Adjustment',150,0,TO_DATE('2011-06-02 12:18:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 12:18:03 PM ECT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61705 AND EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Field_ID!=t.AD_Field_ID)
;

-- Jun 2, 2011 12:18:40 PM ECT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,61512,61706,0,189,TO_DATE('2011-06-02 12:18:39','YYYY-MM-DD HH24:MI:SS'),100,'Percent of days that must be in red in order Buffer Management increase the stock maximum',10,'TOC','Y','Y','Y','N','N','N','N','N','% Red Days to Increase',160,0,TO_DATE('2011-06-02 12:18:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 12:18:40 PM ECT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61706 AND EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Field_ID!=t.AD_Field_ID)
;

-- Jun 2, 2011 12:19:07 PM ECT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,61515,61707,0,189,TO_DATE('2011-06-02 12:19:06','YYYY-MM-DD HH24:MI:SS'),100,'Percent to increase the stock maximum by Buffer Management',10,'TOC','Y','Y','Y','N','N','N','N','Y','% to Increase',170,0,TO_DATE('2011-06-02 12:19:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 12:19:07 PM ECT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61707 AND EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Field_ID!=t.AD_Field_ID)
;

-- Jun 2, 2011 12:19:25 PM ECT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,61513,61708,0,189,TO_DATE('2011-06-02 12:19:24','YYYY-MM-DD HH24:MI:SS'),100,'Percent of days that must be in green in order Buffer Management decrease the stock maximum',10,'TOC','Y','Y','Y','N','N','N','N','N','% Green Days to Decrease',180,0,TO_DATE('2011-06-02 12:19:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 12:19:25 PM ECT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61708 AND EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Field_ID!=t.AD_Field_ID)
;

-- Jun 2, 2011 12:19:43 PM ECT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,61514,61709,0,189,TO_DATE('2011-06-02 12:19:43','YYYY-MM-DD HH24:MI:SS'),100,'Percent to decrease the stock maximum by Buffer Management',10,'TOC','Y','Y','Y','N','N','N','N','Y','% to Decrease',190,0,TO_DATE('2011-06-02 12:19:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 2, 2011 12:19:43 PM ECT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61709 AND EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Field_ID!=t.AD_Field_ID)
;

