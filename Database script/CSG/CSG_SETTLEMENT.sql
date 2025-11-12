select * from MERCHANT_SETTLEMNT_INSTRUC order by 1 desc;
select * from bank_register order by 1 desc;select * from MERCHANT_SETTLEMNT_INSTRUC order by 1 desc;

BULK_SETTLEMENT_UTIL_EXT.UPDATE_SETTLEMENT_INSTRUCTION_GIP









select * from remit_entity_process_config order by 1 desc;
select * from entity_system_config where config_id=165;
update entity_system_config set config_value=1 where config_id=165;


SELECT * FROM MERCHANT_SETTLEMNT_INSTRUC ORDER BY 1 DESC;

-- for this table we can check the generated settlement for the date.
select * from bank_register br where br.bank_acct_activity_id=14
and trunc(br.transaction_date)='09-dec-2024'
order by 1 desc;


--------------------- Database changes for settlements 26-march-2025 ------------------------------------------
 need to execute
 1 -BULK_SETTLEMENT_UTIL_EXT.GET_REPUSH_SETTLEMENT_MERCH_LIST    ------ (also placed in attached file )      (GetMerchantRepushSettlementList method name)


 2 - BULK_SETTLEMENT_UTIL_EXT.GET_UPDATED_REPUSH_SETTLEMNT_INTRUC     ------    (also placed in attached file )
		AND IS_PROCESSED IN (1)  --uncomment it if it is comment out 
       		AND STATUS_CODE != 1     --uncomment it if it is comment out 
        	 AND REPUSH_TYPE is not null  --add this condition in where clause


 3 - BULK_SETTLEMENT_UTIL_EXT.ADD_SETTLEMENT_UPDATED_REPUSH_INSTRUC_REC ------- (also placed in attached file )

             P_BATCH_NO     MERCHANT_SETTLEMNT_INSTRUC.BATCH_NO%TYPE,    --this new column is added in parameter and also in 'MERCHANT_SETTLEMNT_INSTRUC' update query 
	     BATCH_NO     = P_BATCH_NO


 4 - BULK_SETTLEMENT_UTIL_EXT.GET_SAVE_INSTRUCTIONS_TO_REPUSH   --- (also placed in attached file )
	     AND REPUSH_TYPE is not null   





Need to create the following SP (as these are not exist on csg side)

1- BULK_SETTLEMENT_UTIL_EXT.DELETE_INSTRUCTION
2- BULK_SETTLEMENT_UTIL_EXT.GET_UPDATED_SETTLEMNT_INTRUC
3- BULK_SETTLEMENT_UTIL_EXT.GET_UPDATED_SETTLEMNT_INTRUC_BY_ID
4- BULK_SETTLEMENT_UTIL_EXT.GET_UPDATED_SETTLEMNT_INTRUC_BY_BATCH
5- BULK_SETTLEMENT_UTIL_EXT.STOP_BATCH_PROCESSING
BULK_SETTLEMENT_UTIL_EXT.GET_UPDATED_SETTLEMNT_INTRUC


Need to update the following SP with mention columns along with each.

  6- BULK_SETTLEMENT_UTIL_EXT.ADD_SETTLEMENT_UPDATED_INSTRUC_REC
  -with following columns
    6.1-"P_BATCH_NO", OracleDbType.Varchar2
                6.2-"P_IS_PROCESSED", OracleDbType.Varchar2

  7- BULK_SETTLEMENT_UTIL_EXT.ADD_SETTLEMENT_UPDATED_INSTRUC_REC
    7.1 -"P_ORIGIN_BANK", OracleDbType.Varchar2

  8- BULK_SETTLEMENT_UTIL_EXT.UPDATE_SETTLEMENT_INSTRUCTION_GIP
     8.1- "P_PUSHED_COUNT", OracleDbType.Int16;




Need to update the follwoing table

 table_name : MERCHANT_SETTLEMNT_INSTRUC

   batch_no             NVARCHAR2(500) default 0 not null,
    is_processed         NUMBER default 0 not null,
    pushed_count         NUMBER



--obsrvtion shared by yasir 
--NORMAL PUSH WITH GHIPSS
select * from bank_register br where br.transaction_id in (2394701,2394702,2394703);
select * from bank_register_batch_detail d where d.bank_register_trans_id in (2394701,2394702,2394703);
select * from merchant_settlemnt_instruc d where d.trans_id in (2394701,2394702,2394703);
Remarks : Fine
 
 
---NORMAL PUSH WITH ACCESS
select * from bank_register br where br.transaction_id in (2378616,2378615,2378614);
select * from bank_register_batch_detail d where d.bank_register_trans_id in (2378616,2378615,2378614);
select * from merchant_settlemnt_instruc d where d.trans_id in (2378616,2378615,2378614);
Remarks: Fine 
 
 
---MANUAL MARK
select * from bank_register br where br.transaction_id in (2213232);
select * from bank_register_batch_detail d where d.bank_register_trans_id in (2213232);
select * from merchant_settlemnt_instruc d where d.trans_id in (2213232);
Remarks: Fine 
 
Just in case of Repush with New reference
---REPUSH WITH NEW REFERENCE
--OLD INSTRUCTIONS ARE MARKED 
select * from bank_register br where br.transaction_id in (2213649,2213652,2213654,2213657,2213658,2213660);
select * from bank_register_batch_detail d where d.bank_register_trans_id in (2213649,2213652,2213654,2213657,2213658,2213660);
select * from merchant_settlemnt_instruc d where d.trans_id in (2213649,2213652,2213654,2213657,2213658,2213660);
 
--ON ABOVE INSTRUCTIONS NEW SETTLEMENT INSTRUCTIONS ARE GENERATED WITH LINKED REFERENCE
SELECT * FROM BANK_REGISTER BR WHERE BR.LINKED_TRANSACTION_ID in (2213649,2213652,2213654,2213657,2213658,2213660);
Remarks: You need to place some restrictions or I think it was under your testing you have created multiple instructions of repush against 1 single instructions 
