--get systemids by giving orderids
select efp3p.entity_first_name,efp3p.MERCHANT_ENTITY_ID, efp3p.system_trans_id,efp3p.amount_fcy ,efp3p.x_trans_ref_code ,efp3p.transaction_date,efp3p.merchant_transaction_date from entity_feepayment_via_3rdparty efp3p where efp3p.x_trans_ref_code in
( 
'sett34567250',
'sett34567251',
'sett34567252',
'sett34567253',
'sett34567254',
'sett34567255',
'sett34567256',
'sett34567257',
'sett34567258',
'sett34567259',
'sett34567260',
'sett34567261',
'sett34567262',
'sett34567263',
'sett34567264',
'sett34567265',
'sett34567266'
);
   
     
--Step 1
UPDATE ENTITY_WALLET_TOPUP_REQUEST R SET R.STATUS_CODE=1 WHERE R.SYSTEM_TRANS_ID IN (
'102956547',
'102956548',
'102956555',
'102956558',
'102956549',
'102956552',
'102956545',
'102956550',
'102956553',
'102956556',
'102956544',
'102956546',
'102956551',
'102956554',
'102956557');
 
 
SELECT * FROM BANK_REGISTER BR WHERE BR.SYSTEM_TRANS_ID IN
(
'102956547',
'102956548',
'102956555',
'102956558',
'102956549',
'102956552',
'102956545',
'102956550',
'102956553',
'102956556',
'102956544',
'102956546',
'102956551',
'102956554',
'102956557');
 
--Step 2
UPDATE BANK_REGISTER BR SET BR.POST_TO_BANK_DATE='14-MAR-2025' WHERE BR.SYSTEM_TRANS_ID IN
(
'102956547',
'102956548',
'102956555',
'102956558',
'102956549',
'102956552',
'102956545',
'102956550',
'102956553',
'102956556',
'102956544',
'102956546',
'102956551',
'102956554',
'102956557');
 
SELECT get_system_date FROM DUAL;
 
--Step 3
begin
  -- Call the procedure
  BULK_SETTLEMENT_UTIL.GEN_N_PROCESS_BULK_SETTLEMENT(trunc(sysdate));
end;
 
--Step 4
select * from bank_register br where br.bank_acct_activity_id=14
and trunc(br.transaction_date)='14-mar-2025'
order by 1 desc;
 
--Step 5
UPDATE SETTLEMENT_TYPE
     SET LAST_SETTLEMENT_DATE = SETTLEMENT_DATE
   WHERE SETTLEMENT_DATE > LAST_SETTLEMENT_DATE; 
   
   --for example
      ]
 UPDATE SETTLEMENT_TYPE
     SET LAST_SETTLEMENT_DATE = '18-mar-2025'
   WHERE SETTLEMENT_DATE > ='21-mar-2025';
   
