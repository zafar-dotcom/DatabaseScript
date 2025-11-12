select * from general_payment_request_pos order by 1 desc;    --1st step of csg collection is db marking in this table by method -CreatePOSRequest
select * from V_GENERAL_PAYMENT_REQUEST_POS gp where gp.TRANSACTION_ID= 55175775;   --2nd step get details of above mark trnsaction by GetPOSRequest method

select * from entity_feepayment_via_3rdparty order by 1 desc;  --3nd time marking in db before going to processor (for zenith also)
select * from entity_wallet_topup_request order by 1 desc;      --final status of transaction
--check system_trans_id base on merchant reference /orderid to get system_trans_id for  change payment status from screen 


---------------------------------Callback confirmation -------------------------------------------------------
--if callback sent to merchant we can confirm by follwoing field in table : ENTITY_FEEPAYMENT_VIA_3RDPARTY
     --POSTED_TO_MAIN_ENTITY =1
     --MERCHANT_RESPONSE_TEXT has text in it which is response from merchant callback endpoint
     --where TRANSACTION_ID =56316162
--------------------------------------------------------------------------------------------------------------
select efp3p.system_trans_id ,efp3p.amount_fcy ,efp3p.x_trans_ref_code ,efp3p.transaction_date,efp3p.x_trans_ref_code ,efp3p.merchant_transaction_date from entity_feepayment_via_3rdparty efp3p order by 1 desc;  --3nd time marking in db before going to processor (for zenith also)
select efp3p.entity_first_name,efp3p.MERCHANT_ENTITY_ID, efp3p.system_trans_id,efp3p.amount_fcy ,efp3p.x_trans_ref_code ,efp3p.transaction_date,efp3p.merchant_transaction_date from entity_feepayment_via_3rdparty efp3p where efp3p.x_trans_ref_code in
 ( 
'cspcomt12221261',
'cspcomt12221262',
'cspcomt12221263',
'CSPAYTESTt12221264',
'CSPAYTESTt12221265',
'CSPAYTESTt12221266',
'CSCOMt12221267',
'CSCOMt12221268',
'CSCOMt12221269',
'CSCOMt12221270',
'BARAQA122212771',
'BARAQA12221272',
'BARAQA12221273',
'BARAQA12221274',
'CSPAYTESTMER00112221275',
'CSPAYTESTMER00112221276',
'CSPAYTESTMER00112221277',
'CSGTEST20000112221278',
'CSGTEST20000112221279',
'CSGTEST20000112221280'
 );

select * from ENTITY_SYSTEM_CONFIG where config_id=1013;
select * from V_ENTITY where ENTITY_ID=149818;
Select * from MERCHANT_UAT_CONFIGURATION_WHITELISTED_NUMBERS order by 1 desc;
Select * from Currency where CURRENCY_SYMBOL='GHS';
SELECT * FROM V_FEE_TYPE WHERE ENTITY_ID=149818 AND POST=1 AND FEE_TYPE_CODE='GENERALPAYMENT';




--testing of csg collection main tables
select * from MTN_POSTED_TRANSACTIONS order by  1 desc;
select * from MTN_POSTED_TRANSACTIONS mt where mt.CSG_SYSTEM_ID =102954369;09123456
select * from MTN_POSTED_TRANSACTIONS mt where mt.transaction_id =09123456


select  * from processor_callbacks order by  1 desc;
select * from ENTITY_WALLET_TOPUP_REQUEST order by 1 desc;    --where SYSTEM_TRANS_ID=:SystemTransactionID

--follow up tables 
select * from V_ENTITY where ENTITY_ID=149810 --entity detail
SELECT * from V_PAYMENT_MODE_ENTITY_CONFIG c where c.MERCHANT_ENTITY_ID=149810 and c.COUNTRY_ID=1 and c.PAYMENT_MODE_ID=4;

ENTITY_UTIL.GET_ENTITY_RECORD
SYSTEM_PROCESS_UTIL.CREATE_ENTITY_WALLET_TOPUP_REQ 
web_pos_util.get_trans_status_code_telco_details


-- pkgs of screeen where we are changing mtn collection transaction status manualy
SYSTEM_PROCESS_UTIL.GET_THIRD_PARTY_PAYMENTS_EXT_TIME




SELECT EFV.MOBILE,
       EFV.SYSTEM_TRANS_ID,
       VEWTR.TRANSACTION_DATE,
       VEWTR.BANK_ENTITY_ID,
       VEWTR.ENTITY_ID,
       EFV.MERCHANT_ENTITY_ID,
       VEWTR.STATUS_CODE,
       VEWTR.OVA_SERVICEID,
       VEWTR.BANK_RESPONSE_TEXT,
       EFV.POSTED_TO_MAIN_ENTITY,
       EFV.MERCHANT_RESPONSE_TEXT,
       EFV.MERCHANT_TRANSACTION_DATE,
       GPRP.*
  FROM ENTITY_WALLET_TOPUP_REQUEST VEWTR
INNER JOIN ENTITY_FEEPAYMENT_VIA_3RDPARTY EFV
    ON VEWTR.FEEPAYMENT_VIA3RDPARTY_TRANSID = EFV.TRANSACTION_ID
INNER JOIN GENERAL_PAYMENT_REQUEST_POS GPRP
    ON EFV.GENERAL_PAYREQ_POS_TRANSID = GPRP.TRANSACTION_ID
----inner join entity e on e.entity_id = efv.merchant_entity_id
--inner join direct_debit_term_structure ddts on ddts.transaction_id = efv.dd_termstruct_trans_id
--inner join direct_debit_request ddr on ddr.transaction_id = ddts.ddreq_trans_id
WHERE VEWTR.TRANSACTION_DATE >=
       TO_DATE('28/09/2024',
               'dd/mm/yyyy')
   AND VEWTR.TRANSACTION_DATE <
       TO_DATE('02/10/2024',
               'dd/mm/yyyy')
      --and vewtr.status_code in (2)
      --and vewtr.bank_entity_id  = 43035 -- airtel 37135, 43035 MTN, vodafone 55851
      --and vewtr.ova_serviceid = 'EPSaham.sp'
      --and efv.system_trans_id in (393528,372958)
      --and efv.posted_to_main_entity = 1
  AND EFV.MERCHANT_ENTITY_ID IN (149927)
--and gprp.txn_monitoring_status = 1
--and efv.fee_type_id = 1659
--and efv.dd_termstruct_trans_id is not null
--and vewtr.system_trans_id  in (106100140,106100142,106100139)  
--and efv.mobile = '+233205489580'
--and gprp.transaction_id = 50361663
-- and gprp.txn_monitoring_status is not null
-- and vewtr.bank_response_text like '%;;MTN Status Check%'
--and vewtr.bank_response_text like '%;;MTN Failesafe%'
--and gprp.merchant_trans_ref_code = 'RockzWaakye'
-- and vewtr.transaction_id in (54420365, 54421962, 54423592 ) 
ORDER BY VEWTR.TRANSACTION_ID DESC; --9212518 296269

--Note for above callback query: we will send callback from Admin>Misc>Send call back screen 
--and get systemid from change payment status screen under Admin>Transaction>Change Payment status screen
 1- if posted_to_main_entity =1 and MERCHANT_RESPONSE_TEXT have text then its mean callback has been delivered to them
 2- you can query on the basis of datetime and systemid as well
 3- MERCHANT_RESPONSE_TEXT this column basically will contain response message which we will recieve from them 
 
