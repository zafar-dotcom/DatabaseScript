-- create Payment Processor 
select * from payment_mode order by 1 desc;
select * from entity_type order by 1 asc;
select * from entity e where e.entity_id = 150358; --149810 --150358
select * from payment_mode_entity_matrix order by 1 desc;
select * from PAYMENT_MODE_ENTITY_CONFIG order by rule_id desc;
select *
  from PAYMENT_MODE_ENTITY_CONFIG con
 where con.pm_provider_entity_id = 150358
 order by rule_id desc;
-- 1- Create entity in entity table
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
   IS_INWARD_REMITTANCE_PARTNER,
   FACEBOOK_LINK,
   INSTAGRAM_LINK,
   TWITTER_LINK)

values
  (150358,
   'FAB',
   2,
   'First Atlantic Bank',
   null,
   null,
   to_date('29-04-2025 13:55:20', 'dd-mm-yyyy hh24:mi:ss'),
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
   1,
   null,
   'ACCRA',
   null,
   null,
   null,
   0,
   0,
   0,
   0,
   0,
   null,
   0,
   null,
   null,
   null,
   0,
   null,
   null,
   null,
   0,
   null,
   0,
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
   null,
   0,
   null,
   null,
   0,
   0,
   null,
   null,
   null);

-- 2 create payment mode matrix

--for PAYMENT_MODE_ID=2

insert into payment_mode_entity_matrix
  (RULE_ID,
   ENTITY_ID,
   PAYMENT_MODE_ID,
   REMARKS,
   POST,
   LOG_ID,
   SETTLEMENT_DAYS_COUNT,
   IS_MULTI_CURRENCY_ENABLED,
   DOES_SUPPORT_UNSECURED_CARD,
   IS_UNSECURE_PAYMENT_ENABLED,
   IS_REVERSAL_ENABLED,
   PM_TRANSACTION_AMOUNT_CAP,
   PM_COMMISSION_AMOUNT_CAP,
   IS_AUTO_SETTLEMENT_ENABLED,
   IS_PREPARE_SETLMNT_INSTRUCTION,
   PM_BANK_COMMISSION_PERCENT,
   PM_BANK_COMM_CARDINT_PERCENT)
values
  (48,
   150358,
   2,
   'FAB, MASTER',
   1,
   0,
   3,
   0,
   0,
   0,
   0,
   null,
   null,
   0,
   0,
   1.0000,
   1.0000);

--for PAYMENT_MODE_ID=1
insert into payment_mode_entity_matrix (RULE_ID, ENTITY_ID, PAYMENT_MODE_ID, REMARKS, POST, LOG_ID, SETTLEMENT_DAYS_COUNT, IS_MULTI_CURRENCY_ENABLED, DOES_SUPPORT_UNSECURED_CARD, IS_UNSECURE_PAYMENT_ENABLED, IS_REVERSAL_ENABLED, PM_TRANSACTION_AMOUNT_CAP, PM_COMMISSION_AMOUNT_CAP, IS_AUTO_SETTLEMENT_ENABLED, IS_PREPARE_SETLMNT_INSTRUCTION, PM_BANK_COMMISSION_PERCENT, PM_BANK_COMM_CARDINT_PERCENT)
values (49, 150358, 1, 'FAB, MASTER', 1, 0, 3, 0, 0, 0, 0, null, null, 0, 0, 1.0000, 1.0000);

--3 Also Add Entries in payment_mode_currency_config against the same entries in point 2
insert into payment_mode_currency_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, COUNTRY_ID, CURRENCY_ID, IS_ENABLED, POST, LOG_ID)
values (51, 1, 150358, 1, 1, 1, 1, 0);
 
insert into payment_mode_currency_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, COUNTRY_ID, CURRENCY_ID, IS_ENABLED, POST, LOG_ID)
values (52, 2, 150358, 1, 1, 1, 1, 0);

--4 Update config from merchant serach screen
-- Confirm from payment_mode_entity_config

select *
  from PAYMENT_MODE_ENTITY_CONFIG con
 where con.pm_provider_entity_id = 150358
 order by rule_id desc;
