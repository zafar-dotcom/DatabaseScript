select * from entity_system_config order by 1 desc;

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1256, 'KORA_PAY_API_CLIENT_URL', 'http://65.108.141.10:6972', 'KORA Pay api client url');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1253, 'KORA_PAY_API_USERNAME', 'korPy#mMRztzL', 'KORA Pay api microservice credentials');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1254, 'KORA_PAY_API_PASSWORD', '3?@9j#@77F5!9f', 'KORA Pay api microservice credentials');


--Create KORA PAY Entity

select * from entity_system_config order by 1 desc;

select * from entity order by 1 desc;

insert into entity
  (ENTITY_ID,
   ENTITY_CODE,
   ENTITY_TYPE_ID,
   ENTITY_FIRST_NAME,
   ENTITY_MIDDLE_NAME,
   ENTITY_LAST_NAME,
   REGISTRATION_DATE,
   ENTITY_NATURE_ID,
   MALE_OR_FEMALE,
   MOBILE,
   PHONE1,
   PHONE2,
   FAX1,
   FAX2,
   EMAIL,
   POST,
   LOG_ID,
   ADDRESS1,
   ADDRESS2,
   CITY_ID,
   PREFERRED_CLEARING_ENTITY,
   REGION_ID,
   COUNTRY_ID,
   OTHER_MOBILE,
   CITY_NAME,
   POSTAL_CODE,
   IMAGE_NAME,
   BIRTH_DATE,
   AUTO_CREATED,
   IS_SMS_ENABLED,
   IS_EMAIL_ENABLED,
   ACCEPT_MULTIPAYMENTS_VIA_OTC,
   IS_MULTI_CURRENCY_ENABLED,
   ENTITY_CATEGORY_ID,
   IS_GROUP_SMS_ENABLED,
   CONTACT_PERSON_FIRST_NAME,
   CONTACT_PERSON_EMAIL,
   ENTITY_SETUP_DET_ID,
   IS_GROUP_EMAIL_ENABLED,
   IMAGE_NAME_OPENMERCHALL_PAGE,
   CONTACT_PERSON_MIDDLE_NAME,
   CONTACT_PERSON_LAST_NAME,
   HIDE_SURCHARGE_COMMISSION,
   ENTITY_SHORT_NAME,
   IS_INTERPAY_PARTNER,
   IS_SUB_MERCHANT_REQUIRED,
   PARENT_ENTITY_ID,
   MINIMUM_COMMISSION_PERCENT,
   CSS_FILE_NAME,
   IS_UNSECURE_PAYMENT_ENABLED,
   SMALL_IMAGE_NAME,
   IS_PRE_AUTH_ENABLED,
   PARENT_SETTLMNT_BANKACC,
   INITIATOR_IMEI_NO,
   INITIATOR_DEVICE_ID,
   PIN,
   NOTIFICATION_EMAIL,
   INTERPAY_MIN_COMM_VALUE,
   ACCOUNT_MANAGER_ID,
   AGENT_SETUP_DET_ROW_ID,
   PARTNER_MERCHANT_BANK_ID,
   IS_COMMISSION_SPLIT_ENABLED,
   IS_PARTNER_BANK_REQUIRED,
   CLIENT_TIMESTAMP,
   PAYMODE_ENTITY_PROMPT_CODE,
   IS_CUSTOMER_EMAIL_ENABLED,
   IS_INWARD_REMITTANCE_PARTNER)
values
  (149935,
   'KORAPAY',
   2,
   'KORA PAY',
   null,
   null,
   to_date('02-10-2024 12:05:11', 'dd-mm-yyyy hh24:mi:ss'),
   1,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   1,
   0,
   null,
   null,
   null,
   null,
   null,
   134,
   null,
   'Abuja',
   null,
   null,
   null,
   0,
   0,
   0,
   0,
   0,
   3,
   0,
   null,
   null,
   null,
   0,
   null,
   null,
   null,
   0,
   'KORAPAY',
   1,
   0,
   null,
   null,
   null,
   0,
   null,
   0,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   0,
   0,
   null,
   null,
   1,
   0);


insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1255, 'KORAPAY_ENTITY_ID', '149935', 'KORAPAY ENTITY ID');


select * from Bank_account order by 1 desc;
select * from pool_bank_account_config  order by 1 desc;
select * from REMIT_ENTITY_PROCESS_CONFIG order by 1 desc;
select * from mobile_network order by 1 desc;
select * from payment_mode;
select * from REMIT_ENTITY_PROCESS_CONFIG e where e.merchant_entity_id=149935;


-- for currency based on currency_symbol 
Select * from Currency  order by 1 desc;
Select * from Currency where currency_symbol='NGN';
select * from country where country_code='NG';



ALTER TABLE REMIT_ENTITY_PROCESS_CONFIG ADD currency_id NUMBER(12) NULL;


insert into REMIT_ENTITY_PROCESS_CONFIG (MERCHANT_ENTITY_ID, PM_PROVIDER_ENTITY_ID, ISENABLED, POST, LOG_ID, PAYOUT_TYPE_ID, NETWORK_ENTITY, DESCRIPTION,CURRENCY_ID)
values (149803, 149935, 1, 1, 11920834, 3, 43035, 'KORAPAY',107);



