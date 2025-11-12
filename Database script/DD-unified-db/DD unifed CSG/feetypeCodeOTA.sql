select * from dd_mandates order by 1 desc;
select * from dd_mandate_request order by 1 desc;

update dd_mandates set FEE_TYPE_NAME = 'GENERALPAYMENT' ,FEE_TYPE_ID =196 where merchant_ref_id='4534534mmm';
select * from  payment_mode_entity_ova_config where  MERCHANT_ENTTITY_ID = 44101;

2869
select * from fee_type where entity_id =44101;
 
select * from fee_type order by 1 desc
SYSTEM_PROCESS_UTIL.GET_FEE_TYPE_ID
INSERT INTO FEE_TYPE
      (FEE_TYPE_ID,
       FEE_TYPE_CODE,
       FEE_TYPE_NAME,
       FEE_TYPE_SHORT_NAME,
       FEE_CATEGORY_ID,
       ENTITY_ID,
       BANK_ACCOUNT_ID,
       POST,
       LOG_ID,
       ARREAR_FEE,
       PRIMARY_FEE,
       PENALTY_FEE,
       AUTO_PAYMENT_SORT_ORDER,
       FEE_NATURE_ID,
       DEFAULT_FEE,
       IS_QTY_ENABLED)
    VALUES
      (2871,
       'GENERALPAYMENT',
       'GENERAL PAYMENT',
       'GENERAL PAYMENT',
       1894,
       44101,
       21623,--V_FEE_TYPE_ROW.BANK_ACCOUNT_ID,
       1,
       0,
       0,
       0,
       0,
       1,
       NULL,
       0,
       0);
       
       
select * from entity where entity_id=44101;





