SET CLIENT_ENCODING TO 'UTF8';

-- 11-dic-2010 22:32:05 COT
UPDATE AD_Process_Para SET AD_Element_ID=196, AD_Reference_ID=19, AD_Val_Rule_ID=229, ColumnName='C_DocType_ID', Description='Document type or rules', Help='The Document Type determines document sequence and processing rules', Name='Document Type',Updated=TO_TIMESTAMP('2010-12-11 22:32:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=649
;

-- 11-dic-2010 22:32:05 COT
UPDATE AD_Process_Para_Trl SET IsTranslated='N' WHERE AD_Process_Para_ID=649
;

-- 11-dic-2010 22:33:34 COT
UPDATE AD_Process_Para_Trl SET Name='Tipo de Documento',Description='Tipo de documento ó reglas',Help='El tipo de documento determina la secuencia del documento y las reglas de proceso',Updated=TO_TIMESTAMP('2010-12-11 22:33:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=649 AND AD_Language='es_EC'
;

