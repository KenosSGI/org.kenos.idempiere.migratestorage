SET SQLBLANKLINES ON
SET DEFINE OFF

-- Migration Storage Provider Tool
-- 06/12/2018 11h23min36s BRST
INSERT INTO AD_Process (AD_Process_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Name,Description,Help,IsReport,Value,IsDirectPrint,Classname,AccessLevel,EntityType,Statistic_Count,Statistic_Seconds,IsBetaFunctionality,IsServerProcess,ShowHelp,CopyFromProcess,AD_Process_UU) VALUES (200106,0,0,'Y',TO_DATE('2018-12-06 11:23:36','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2018-12-06 11:23:36','YYYY-MM-DD HH24:MI:SS'),100,'Migrate Storage Provider','This tool will help the migration of storage provider','You can migrate from attachments and archives from Database to File System and vice-versa. 
** This process will change sensitive data, always make sure you have a backup before start this process **','N','MigrateStorageProvider','N','org.kenos.idempiere.migratestorage.process.MigrateStorageProvider','6','U',0,0,'N','N','Y','N','53889806-6e00-48ae-a200-4d8dafd21603')
;

-- 06/12/2018 11h23min51s BRST
UPDATE AD_Process SET EntityType='A',Updated=TO_DATE('2018-12-06 11:23:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=200106
;

-- 06/12/2018 11h24min56s BRST
INSERT INTO AD_Process_Para (AD_Process_Para_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Name,AD_Process_ID,SeqNo,AD_Reference_ID,IsRange,FieldLength,IsMandatory,ColumnName,IsCentrallyMaintained,EntityType,AD_Element_ID,AD_Process_Para_UU,IsEncrypted) VALUES (200251,0,0,'Y',TO_DATE('2018-12-06 11:24:56','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2018-12-06 11:24:56','YYYY-MM-DD HH24:MI:SS'),100,'File_Directory',200106,10,38,'N',0,'Y','File_Directory','Y','A',50022,'f742e54e-cb04-4a8f-b5ae-dc5f1277b4d9','N')
;

-- 06/12/2018 11h26min32s BRST
INSERT INTO AD_Process_Para (AD_Process_Para_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Name,AD_Process_ID,SeqNo,AD_Reference_ID,AD_Reference_Value_ID,IsRange,FieldLength,IsMandatory,DefaultValue,ColumnName,DefaultValue2,IsCentrallyMaintained,EntityType,AD_Element_ID,AD_Process_Para_UU,IsEncrypted) VALUES (200252,0,0,'Y',TO_DATE('2018-12-06 11:26:31','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2018-12-06 11:26:31','YYYY-MM-DD HH24:MI:SS'),100,'Method',200106,20,17,200019,'Y',0,'Y','DB','Method','FileSystem','Y','A',200239,'b530db9c-47c5-4322-9653-27d9c1987093','N')
;

-- 06/12/2018 11h27min34s BRST
INSERT INTO AD_Menu (AD_Menu_ID,Name,Action,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,IsSummary,AD_Process_ID,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,AD_Menu_UU) VALUES (200164,'Migrate Storage Provider','P',0,0,'Y',TO_DATE('2018-12-06 11:27:34','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2018-12-06 11:27:34','YYYY-MM-DD HH24:MI:SS'),100,'N',200106,'Y','N','A','Y','c3c3ae6c-6d4e-45a3-8a68-9f3f33b2db8d')
;

-- 06/12/2018 11h27min34s BRST
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo, AD_TreeNodeMM_UU) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 200164, 0, 999, Generate_UUID() FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=200164)
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=218
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=153
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=263
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=166
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=203
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53242
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=236
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=183
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=160
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=278
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=345
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53296
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53014
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53108
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000000
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000005
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000003
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1120016
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000006
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000009
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000012
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000010
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000015
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000013
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000011
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000014
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=2000016
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=261
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53202
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=225
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=200026
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=200009
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=148
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=529
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=397
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=532
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53084
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=514
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=200069
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=200070
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=200067
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=200068
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=200027
;

-- 06/12/2018 11h28min55s BRST
UPDATE AD_TreeNodeMM SET Parent_ID=156, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=200164
;

SELECT Register_Migration_Script ('201812061207_MigrateStorage.sql') FROM DUAL
;

