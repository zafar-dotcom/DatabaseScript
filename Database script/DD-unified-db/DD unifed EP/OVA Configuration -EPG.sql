

  select * from payment_mode_entity_ova_config order by 1 desc;
select * from payment_mode_entity_ova_config pm where pm.merchant_enttity_id=101891 ;
select * from mobile_network order by 1 desc;  --payment_mode from here

 select * from PAYMENT_MODE order by 1 desc;
select * from entity e where e.entity_id=44101 ;
150477
update payment_mode_entity_ova_config set FEE_TYPE_ID = 2815 where RULE_ID=12945;
update payment_mode_entity_ova_config set IS_OTA_ENABLED = 0 where RULE_ID=12960;
update payment_mode_entity_ova_config set FEE_TYPE_ID = 2871 where RULE_ID=12946;



insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED)
values (9, 4, 43035, 149807, 'mojotest', '233535188679', 1, 0, 1 );




--ova binding with feetypecode for merchant TESTMERCHANT 

select * from   payment_mode_entity_ova_config where MERCHANT_ENTTITY_ID =106000;
--insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12945, 4, 43035, 106000, 'mojotest', '233535188679', 1, 0, 0, 2815, null); --GENERALPAYMENT

insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12946, 4, 43035, 106000, 'mojotest', '233535188679', 1, 0, 1, 2871, null);   --feetype POS

insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12947, 4, 43035, 106000, 'mojotest', '233535188679', 1, 0, 1, 2870, null); --Feetypecode SSS

insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12948, 4, 43035, 106000, 'mojotest', '233535188679', 1, 0, 1, 2872, null); --Feetypecode TFDD

--ova for TESTMERCHANT
insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12949, 4, 43035, 105997, 'mojotest', '233535188679', 1, 0, 1, 2873, null); --Feetypecode TFDD
insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12950, 4, 43035, 106000, 'mojotest', '233535188679', 1, 0, 1, 2874, null); --Feetypecode SOS

 -----------------------// TISSOT WATCH   appid: 7095548480  appkey 00163605  entuityid :104818
insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12957, 4, 43035, 104818, 'mojotest', '233535188679', 1, 0, 1, 2881, null); --Feetypecode SOS

insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12958, 4, 43035, 104818, 'mojotest', '233535188679', 1, 0, 1, 2882, null); --Feetypecode SOS

insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12959, 4, 43035, 104818, 'mojotest', '233535188679', 1, 0, 1, 2883, null); --Feetypecode SOS



insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED, FEE_TYPE_ID, CONFIG_DATE)
values (12960, 4, 43035, 106001, 'mojotest', '233535188679', 1, 0, 1, 2884, null); --Feetypecode posts

--FeeTypeCode Binding for merchant
select * from fee_type where entity_id =44101;
select * from fee_type order by 1 desc; 


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
      (2870,
       'SSS',
       'SSS',
       'SSS',
       232,
       106000,
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
       
 --for  FEETYPE POS     
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
       'POS',
       'POINT OD SALE',
       'SALE',
       232,
       106000,
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
       
        --for  FEETYPE POS     
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
      (2872,
       'TFDD',
       'SUBSCRIPTION',
       'SUBSCRIPTION',
       232,
       106000,
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



--feetype for test merchant

        --for  FEETYPE POS     
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
      (2873,
       'TFDD',
       'SUBSCRIPTION',
       'SUBSCRIPTION',
       232,
       105997,
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
       
       --SOS
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
      (2874,
       'SOS',
       'SOS SUBSCRIPTION',
       'SOS SUBSCRIPTION',
       232,
       105997,
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
       
       
        
       -----------------------// TISSOT WATCH   appid: 7095548480  appkey 00163605  entuityid :104818

        --MMM
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
      (2881,
       'MMM',
       'MMM SUBSCRIPTION',
       'MMM SUBSCRIPTION',
       232,
       104818,
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
      (2882,
       'POST',
       'POST SUBSCRIPTION',
       'POST SUBSCRIPTION',
       232,
       104818,
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
      (2883,
       'POSTS',
       'POSTS SUBSCRIPTION',
       'POSTS SUBSCRIPTION',
       232,
       104818,
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
      (2884,
       'POSTS',
       'POSTS SUBSCRIPTION',
       'POSTS SUBSCRIPTION',
       232,
       106001,
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
