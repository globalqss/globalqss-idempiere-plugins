-- Dec 11, 2010 8:32:09 PM COT
-- TOC Replenisment History
INSERT INTO AD_EntityType (AD_Client_ID,AD_EntityType_ID,AD_Org_ID,Created,CreatedBy,EntityType,IsActive,ModelPackage,Name,Processing,Updated,UpdatedBy) VALUES (0,50011,0,TO_DATE('2010-12-11 20:32:08','YYYY-MM-DD HH24:MI:SS'),100,'TOC','Y','org.globalqss.model','Theory of Constraints','N',TO_DATE('2010-12-11 20:32:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:17:28 PM COT
INSERT INTO AD_Table (AccessLevel,AD_Client_ID,AD_Org_ID,AD_Table_ID,AD_Window_ID,CopyColumnsFromTable,Created,CreatedBy,EntityType,ImportTable,IsActive,IsChangeLog,IsDeleteable,IsHighVolume,IsSecurityEnabled,IsView,LoadSeq,Name,ReplicationType,TableName,Updated,UpdatedBy) VALUES ('3',0,0,53301,139,'N',TO_DATE('2010-12-11 21:17:27','YYYY-MM-DD HH24:MI:SS'),100,'TOC','N','Y','N','Y','N','N','N',0,'Replenishment History','L','TOC_Replenish_History',TO_DATE('2010-12-11 21:17:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:17:28 PM COT
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=53301 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- Dec 11, 2010 9:17:29 PM COT
INSERT INTO AD_Sequence (AD_Client_ID,AD_Org_ID,AD_Sequence_ID,Created,CreatedBy,CurrentNext,CurrentNextSys,Description,IncrementNo,IsActive,IsAudited,IsAutoSequence,IsTableID,Name,StartNewYear,StartNo,Updated,UpdatedBy) VALUES (0,0,53414,TO_DATE('2010-12-11 21:17:28','YYYY-MM-DD HH24:MI:SS'),100,1000000,50000,'Table TOC_Replenish_History',1,'Y','N','Y','Y','TOC_Replenish_History','N',1000000,TO_DATE('2010-12-11 21:17:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:18:01 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60266,102,0,19,53301,'AD_Client_ID',TO_DATE('2010-12-11 21:18:00','YYYY-MM-DD HH24:MI:SS'),100,'@AD_Client_ID@','Client/Tenant for this installation.','TOC',22,'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','Y','N','N','N','N','Y','N','N','Y','N','N','Client',0,TO_DATE('2010-12-11 21:18:00','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:01 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60266 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:02 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,AD_Val_Rule_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60267,113,0,19,53301,104,'AD_Org_ID',TO_DATE('2010-12-11 21:18:01','YYYY-MM-DD HH24:MI:SS'),100,'@AD_Org_ID@','Organizational entity within client','TOC',22,'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','Y','N','N','N','N','Y','N','N','Y','N','N','Organization',0,TO_DATE('2010-12-11 21:18:01','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:02 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60267 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:02 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60268,245,0,16,53301,'Created',TO_DATE('2010-12-11 21:18:02','YYYY-MM-DD HH24:MI:SS'),100,'Date this record was created','TOC',7,'The Created field indicates the date that this record was created.','Y','N','N','N','N','Y','N','N','Y','N','N','Created',0,TO_DATE('2010-12-11 21:18:02','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:02 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60268 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:03 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60269,246,0,18,110,53301,'CreatedBy',TO_DATE('2010-12-11 21:18:02','YYYY-MM-DD HH24:MI:SS'),100,'User who created this records','TOC',22,'The Created By field indicates the user who created this record.','Y','N','N','N','N','Y','N','N','Y','N','N','Created By',0,TO_DATE('2010-12-11 21:18:02','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:03 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60269 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:04 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60270,348,0,20,53301,'IsActive',TO_DATE('2010-12-11 21:18:03','YYYY-MM-DD HH24:MI:SS'),100,'Y','The record is active in the system','TOC',1,'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','Y','N','N','N','N','Y','N','N','Y','N','Y','Active',0,TO_DATE('2010-12-11 21:18:03','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:04 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60270 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:04 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60271,434,0,12,53301,'Level_Max',TO_DATE('2010-12-11 21:18:04','YYYY-MM-DD HH24:MI:SS'),100,'Maximum Inventory level for this product','TOC',22,'Indicates the maximum quantity of this product to be stocked in inventory.','Y','N','N','N','N','Y','N','N','Y','N','Y','Maximum Level',0,TO_DATE('2010-12-11 21:18:04','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:04 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60271 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:05 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60272,435,0,12,53301,'Level_Min',TO_DATE('2010-12-11 21:18:04','YYYY-MM-DD HH24:MI:SS'),100,'Minimum Inventory level for this product','TOC',22,'Indicates the minimum quantity of this product to be stocked in inventory.
','Y','N','N','N','N','Y','N','N','Y','N','Y','Minimum Level',0,TO_DATE('2010-12-11 21:18:04','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:05 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60272 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:06 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,AD_Val_Rule_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60273,448,0,19,53301,127,'M_Locator_ID',TO_DATE('2010-12-11 21:18:05','YYYY-MM-DD HH24:MI:SS'),100,'Warehouse Locator','TOC',1,'The Locator indicates where in a Warehouse a product is located.','Y','N','N','N','N','N','N','N','N','N','Y','Locator',0,TO_DATE('2010-12-11 21:18:05','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:06 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60273 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:06 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,AD_Val_Rule_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60274,454,0,30,53301,231,'M_Product_ID',TO_DATE('2010-12-11 21:18:06','YYYY-MM-DD HH24:MI:SS'),100,'Product, Service, Item','TOC',22,'Identifies an item which is either purchased or sold in this organization.','Y','N','N','N','N','Y','Y','N','Y','N','N','Product',0,TO_DATE('2010-12-11 21:18:06','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:06 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60274 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:07 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60275,459,0,19,53301,'M_Warehouse_ID',TO_DATE('2010-12-11 21:18:06','YYYY-MM-DD HH24:MI:SS'),100,'Storage Warehouse and Service Point','TOC',22,'The Warehouse identifies a unique Warehouse where products are stored or Services are provided.','Y','N','N','N','N','Y','Y','N','Y','N','N','Warehouse',0,TO_DATE('2010-12-11 21:18:06','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:07 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60275 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:08 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60276,2814,0,18,197,53301,'M_WarehouseSource_ID',TO_DATE('2010-12-11 21:18:07','YYYY-MM-DD HH24:MI:SS'),100,'Optional Warehouse to replenish from','TOC',10,'If defined, the warehouse selected is used to replenish the product(s)','Y','N','N','N','N','N','N','N','Y','N','Y','Source Warehouse',0,TO_DATE('2010-12-11 21:18:07','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:08 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60276 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:09 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60277,545,0,17,164,53301,'ReplenishType',TO_DATE('2010-12-11 21:18:08','YYYY-MM-DD HH24:MI:SS'),100,'Method for re-ordering a product','TOC',1,'The Replenish Type indicates if this product will be manually re-ordered, ordered when the quantity is below the minimum quantity or ordered when it is below the maximum quantity. If you select a custom replenishment type, you need to create a class implementing org.compiere.util.ReplenishInterface and set that on warehouse level.','Y','N','N','N','N','Y','N','N','Y','N','Y','Replenish Type',0,TO_DATE('2010-12-11 21:18:08','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:09 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60277 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:10 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60278,607,0,16,53301,'Updated',TO_DATE('2010-12-11 21:18:09','YYYY-MM-DD HH24:MI:SS'),100,'Date this record was updated','TOC',7,'The Updated field indicates the date that this record was updated.','Y','N','N','N','N','Y','N','N','Y','N','N','Updated',0,TO_DATE('2010-12-11 21:18:09','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:10 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60278 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:10 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60279,608,0,18,110,53301,'UpdatedBy',TO_DATE('2010-12-11 21:18:10','YYYY-MM-DD HH24:MI:SS'),100,'User who updated this records','TOC',22,'The Updated By field indicates the user who updated this record.','Y','N','N','N','N','Y','N','N','Y','N','N','Updated By',0,TO_DATE('2010-12-11 21:18:10','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:18:10 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60279 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:18:48 PM COT
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54417,0,'TOC_Replenish_History',TO_DATE('2010-12-11 21:18:47','YYYY-MM-DD HH24:MI:SS'),100,'TOC','Y','Replenishment History','Replenishment History',TO_DATE('2010-12-11 21:18:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:18:48 PM COT
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54417 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Dec 11, 2010 9:18:51 PM COT
UPDATE AD_Element SET ColumnName='TOC_Replenish_History_ID',Updated=TO_DATE('2010-12-11 21:18:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54417
;

-- Dec 11, 2010 9:18:51 PM COT
UPDATE AD_Column SET ColumnName='TOC_Replenish_History_ID', Name='Replenishment History', Description=NULL, Help=NULL WHERE AD_Element_ID=54417
;

-- Dec 11, 2010 9:18:51 PM COT
UPDATE AD_Process_Para SET ColumnName='TOC_Replenish_History_ID', Name='Replenishment History', Description=NULL, Help=NULL, AD_Element_ID=54417 WHERE UPPER(ColumnName)='TOC_REPLENISH_HISTORY_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Dec 11, 2010 9:18:51 PM COT
UPDATE AD_Process_Para SET ColumnName='TOC_Replenish_History_ID', Name='Replenishment History', Description=NULL, Help=NULL WHERE AD_Element_ID=54417 AND IsCentrallyMaintained='Y'
;

-- Dec 11, 2010 9:19:22 PM COT
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,60280,54417,0,13,53301,'TOC_Replenish_History_ID',TO_DATE('2010-12-11 21:19:21','YYYY-MM-DD HH24:MI:SS'),100,'TOC',10,'Y','N','N','N','Y','Y','N','N','N','N','N','Replenishment History',0,TO_DATE('2010-12-11 21:19:21','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Dec 11, 2010 9:19:22 PM COT
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=60280 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Dec 11, 2010 9:20:09 PM COT
UPDATE AD_Column SET AD_Element_ID=530, AD_Reference_ID=29, ColumnName='QtyOnHand', Description='On Hand Quantity', Help='The On Hand Quantity indicates the quantity of a product that is on hand in a warehouse.', Name='On Hand Quantity',Updated=TO_DATE('2010-12-11 21:20:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=60272
;

-- Dec 11, 2010 9:20:09 PM COT
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=60272
;

-- Dec 11, 2010 9:20:09 PM COT
UPDATE AD_Field SET Name='On Hand Quantity', Description='On Hand Quantity', Help='The On Hand Quantity indicates the quantity of a product that is on hand in a warehouse.' WHERE AD_Column_ID=60272 AND IsCentrallyMaintained='Y'
;

-- Dec 11, 2010 9:21:25 PM COT
UPDATE AD_Column SET AD_Element_ID=532, AD_Reference_ID=29, ColumnName='QtyReserved', Description='Reserved Quantity', FieldLength=22, Help='The Reserved Quantity indicates the quantity of a product that is currently reserved.', Name='Reserved Quantity',Updated=TO_DATE('2010-12-11 21:21:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=60273
;

-- Dec 11, 2010 9:21:25 PM COT
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=60273
;

-- Dec 11, 2010 9:21:25 PM COT
UPDATE AD_Field SET Name='Reserved Quantity', Description='Reserved Quantity', Help='The Reserved Quantity indicates the quantity of a product that is currently reserved.' WHERE AD_Column_ID=60273 AND IsCentrallyMaintained='Y'
;

-- Dec 11, 2010 9:23:03 PM COT
UPDATE AD_Column SET AD_Element_ID=1297, AD_Reference_ID=15, AD_Reference_Value_ID=NULL, ColumnName='DateTrx', Description='Transaction Date', Help='The Transaction Date indicates the date of the transaction.', Name='Transaction Date',Updated=TO_DATE('2010-12-11 21:23:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=60276
;

-- Dec 11, 2010 9:23:03 PM COT
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=60276
;

-- Dec 11, 2010 9:23:03 PM COT
UPDATE AD_Field SET Name='Transaction Date', Description='Transaction Date', Help='The Transaction Date indicates the date of the transaction.' WHERE AD_Column_ID=60276 AND IsCentrallyMaintained='Y'
;

-- Dec 11, 2010 9:25:05 PM COT
INSERT INTO AD_Reference (AD_Client_ID,AD_Org_ID,AD_Reference_ID,Created,CreatedBy,Description,EntityType,IsActive,IsOrderByValue,Name,Updated,UpdatedBy,ValidationType) VALUES (0,0,53388,TO_DATE('2010-12-11 21:25:05','YYYY-MM-DD HH24:MI:SS'),100,'List of Print Colors - just White, Green, Yellow, Red, Black','TOC','Y','N','TOC - AD_PrintColor - WGYRB',TO_DATE('2010-12-11 21:25:05','YYYY-MM-DD HH24:MI:SS'),100,'T')
;

-- Dec 11, 2010 9:25:05 PM COT
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=53388 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Dec 11, 2010 9:28:22 PM COT
INSERT INTO AD_Ref_Table (AD_Client_ID,AD_Display,AD_Key,AD_Org_ID,AD_Reference_ID,AD_Table_ID,Created,CreatedBy,EntityType,IsActive,IsValueDisplayed,Updated,UpdatedBy,WhereClause) VALUES (0,6979,6975,0,53388,490,TO_DATE('2010-12-11 21:28:22','YYYY-MM-DD HH24:MI:SS'),100,'TOC','Y','N',TO_DATE('2010-12-11 21:28:22','YYYY-MM-DD HH24:MI:SS'),100,'AD_PrintColor.AD_PrintColor_id in (100,102,103,108,113)')
;

-- Dec 11, 2010 9:28:37 PM COT
UPDATE AD_Column SET AD_Element_ID=1788, AD_Reference_ID=18, AD_Reference_Value_ID=53388, ColumnName='AD_PrintColor_ID', Description='Color used for printing and display', FieldLength=10, Help='Colors used for printing and display', Name='Print Color',Updated=TO_DATE('2010-12-11 21:28:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=60277
;

-- Dec 11, 2010 9:28:37 PM COT
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=60277
;

-- Dec 11, 2010 9:28:37 PM COT
UPDATE AD_Field SET Name='Print Color', Description='Color used for printing and display', Help='Colors used for printing and display' WHERE AD_Column_ID=60277 AND IsCentrallyMaintained='Y'
;

-- Dec 11, 2010 9:28:52 PM COT
CREATE TABLE TOC_Replenish_History (AD_Client_ID NUMBER(10) NOT NULL, AD_Org_ID NUMBER(10) NOT NULL, AD_PrintColor_ID NUMBER(10) NOT NULL, Created DATE NOT NULL, CreatedBy NUMBER(10) NOT NULL, DateTrx DATE DEFAULT NULL , IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL, Level_Max NUMBER NOT NULL, M_Product_ID NUMBER(10) NOT NULL, M_Warehouse_ID NUMBER(10) NOT NULL, QtyOnHand NUMBER NOT NULL, QtyReserved NUMBER DEFAULT NULL , TOC_Replenish_History_ID NUMBER(10) NOT NULL, Updated DATE NOT NULL, UpdatedBy NUMBER(10) NOT NULL, CONSTRAINT TOC_Replenish_History_Key PRIMARY KEY (TOC_Replenish_History_ID))
;

-- Dec 11, 2010 9:30:02 PM COT
INSERT INTO AD_Tab (AD_Client_ID,AD_Column_ID,AD_Org_ID,AD_Tab_ID,AD_Table_ID,AD_Window_ID,Created,CreatedBy,EntityType,HasTree,ImportFields,IsActive,IsAdvancedTab,IsInfoTab,IsInsertRecord,IsReadOnly,IsSingleRow,IsSortTab,IsTranslationTab,Name,Processing,SeqNo,TabLevel,Updated,UpdatedBy) VALUES (0,60275,0,53378,53301,139,TO_DATE('2010-12-11 21:30:02','YYYY-MM-DD HH24:MI:SS'),100,'TOC','N','N','Y','N','N','Y','N','N','N','N','Replenishment History','N',75,1,TO_DATE('2010-12-11 21:30:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:02 PM COT
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, CommitWarning,Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.CommitWarning,t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=53378 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- Dec 11, 2010 9:30:06 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60270,60993,0,53378,TO_DATE('2010-12-11 21:30:05','YYYY-MM-DD HH24:MI:SS'),100,'The record is active in the system',1,'TOC','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','Y','Y','Y','N','N','N','N','N','Active',TO_DATE('2010-12-11 21:30:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:06 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=60993 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:06 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60266,60994,0,53378,TO_DATE('2010-12-11 21:30:06','YYYY-MM-DD HH24:MI:SS'),100,'Client/Tenant for this installation.',22,'TOC','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','Y','Y','Y','N','N','N','N','N','Client',TO_DATE('2010-12-11 21:30:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:06 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=60994 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:07 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60271,60995,0,53378,TO_DATE('2010-12-11 21:30:06','YYYY-MM-DD HH24:MI:SS'),100,'Maximum Inventory level for this product',22,'TOC','Indicates the maximum quantity of this product to be stocked in inventory.','Y','Y','Y','N','N','N','N','N','Maximum Level',TO_DATE('2010-12-11 21:30:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:07 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=60995 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:07 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60272,60996,0,53378,TO_DATE('2010-12-11 21:30:07','YYYY-MM-DD HH24:MI:SS'),100,'On Hand Quantity',22,'TOC','The On Hand Quantity indicates the quantity of a product that is on hand in a warehouse.','Y','Y','Y','N','N','N','N','N','On Hand Quantity',TO_DATE('2010-12-11 21:30:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:07 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=60996 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:08 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60267,60997,0,53378,TO_DATE('2010-12-11 21:30:07','YYYY-MM-DD HH24:MI:SS'),100,'Organizational entity within client',22,'TOC','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','Y','Y','Y','N','N','N','N','N','Organization',TO_DATE('2010-12-11 21:30:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:08 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=60997 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:08 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60277,60998,0,53378,TO_DATE('2010-12-11 21:30:08','YYYY-MM-DD HH24:MI:SS'),100,'Color used for printing and display',10,'TOC','Colors used for printing and display','Y','Y','Y','N','N','N','N','N','Print Color',TO_DATE('2010-12-11 21:30:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:08 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=60998 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:09 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60274,60999,0,53378,TO_DATE('2010-12-11 21:30:08','YYYY-MM-DD HH24:MI:SS'),100,'Product, Service, Item',22,'TOC','Identifies an item which is either purchased or sold in this organization.','Y','Y','Y','N','N','N','N','N','Product',TO_DATE('2010-12-11 21:30:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:09 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=60999 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:10 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60280,61000,0,53378,TO_DATE('2010-12-11 21:30:09','YYYY-MM-DD HH24:MI:SS'),100,10,'TOC','Y','Y','N','N','N','N','N','N','Replenishment History',TO_DATE('2010-12-11 21:30:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:10 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61000 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:10 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60273,61001,0,53378,TO_DATE('2010-12-11 21:30:10','YYYY-MM-DD HH24:MI:SS'),100,'Reserved Quantity',22,'TOC','The Reserved Quantity indicates the quantity of a product that is currently reserved.','Y','Y','Y','N','N','N','N','N','Reserved Quantity',TO_DATE('2010-12-11 21:30:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:10 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61001 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:11 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60276,61002,0,53378,TO_DATE('2010-12-11 21:30:10','YYYY-MM-DD HH24:MI:SS'),100,'Transaction Date',10,'TOC','The Transaction Date indicates the date of the transaction.','Y','Y','Y','N','N','N','N','N','Transaction Date',TO_DATE('2010-12-11 21:30:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:11 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61002 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:11 PM COT
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,60275,61003,0,53378,TO_DATE('2010-12-11 21:30:11','YYYY-MM-DD HH24:MI:SS'),100,'Storage Warehouse and Service Point',22,'TOC','The Warehouse identifies a unique Warehouse where products are stored or Services are provided.','Y','Y','Y','N','N','N','N','N','Warehouse',TO_DATE('2010-12-11 21:30:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Dec 11, 2010 9:30:11 PM COT
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=61003 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=60994
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=60997
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=61003
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=60999
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=61002
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=60996
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=61001
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=60995
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=60998
;

-- Dec 11, 2010 9:30:45 PM COT
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=60993
;

-- Dec 11, 2010 9:30:51 PM COT
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2010-12-11 21:30:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=60997
;

-- Dec 11, 2010 9:31:03 PM COT
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2010-12-11 21:31:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=61001
;

-- Dec 11, 2010 9:31:16 PM COT
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2010-12-11 21:31:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=60998
;

-- Dec 11, 2010 9:31:52 PM COT
UPDATE AD_Column SET MandatoryLogic=NULL,Updated=TO_DATE('2010-12-11 21:31:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=6979
;

-- Dec 11, 2010 9:32:09 PM COT
UPDATE AD_Column SET IsIdentifier='Y', IsUpdateable='N', SeqNo=1,Updated=TO_DATE('2010-12-11 21:32:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=60275
;

-- Dec 11, 2010 9:32:13 PM COT
UPDATE AD_Column SET IsIdentifier='Y', IsUpdateable='N', SeqNo=2,Updated=TO_DATE('2010-12-11 21:32:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=60274
;

-- Dec 11, 2010 9:32:37 PM COT
UPDATE AD_Column SET IsIdentifier='Y', SeqNo=3,Updated=TO_DATE('2010-12-11 21:32:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=60276
;

-- Dec 11, 2010 9:36:25 PM COT
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_DATE('2010-12-11 21:36:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=60273
;

-- Dec 11, 2010 9:36:26 PM COT
ALTER TABLE TOC_Replenish_History MODIFY QtyReserved NUMBER
;

-- Dec 11, 2010 9:36:26 PM COT
ALTER TABLE TOC_Replenish_History MODIFY QtyReserved NOT NULL
;

-- Dec 11, 2010 9:36:31 PM COT
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_DATE('2010-12-11 21:36:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=60276
;

-- Dec 11, 2010 9:36:32 PM COT
ALTER TABLE TOC_Replenish_History MODIFY DateTrx DATE
;

-- Dec 11, 2010 9:36:32 PM COT
ALTER TABLE TOC_Replenish_History MODIFY DateTrx NOT NULL
;

