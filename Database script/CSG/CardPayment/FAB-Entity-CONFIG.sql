select * from entity_system_config order by 1 desc;

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1280, 'FAB_CLIENT_BASEURL', 'test/url', 'FAB BASE URL');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1281, 'FAB_CLIENT_USERNAME', 'MCFABGAT', 'FAB BASIC AUTH USERNAME');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1282, 'FAB_CLIENT_PASSWORD', '3?79!@%$@9j7f', 'FAB BASIC AUTH PASSWORD');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1283, 'FAB_ENTITY_ID', '150358', 'FAB Entity ');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1284, 'FAB_REDIRECT_URL', 'https://dev.cspay.app/Fab/ConfirmPayment', 'FAB Redirect url for mojopay after payment completion');


insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1290, 'FAB_SECRET_KEY', 'pzEk70@pNQjVnAFM@u4pAbujaoXizk$4HrtSV?bjX>#jURdK.x4LtA.4T', 'Hmac secret key for fab');



--update each for live

UPDATE entity_system_config 
SET config_value = 'https://localhost:7167' 
WHERE config_id = 1280;

UPDATE entity_system_config 
SET config_value = 'MCFABGAT' 
WHERE config_id = 1281;

UPDATE entity_system_config 
SET config_value = '3?79!@%$@9j7f' 
WHERE config_id = 1282;

UPDATE entity_system_config 
SET config_value = '150358' 
WHERE config_id = 1283;

UPDATE entity_system_config 
SET config_value = 'https://dev.cspay.app/Fab/ConfirmPayment' 
WHERE config_id = 1284;

UPDATE entity_system_config 
SET config_value = 'pzEk70@pNQjVnAFM@u4pAbujaoXizk$4HrtSV?bjX>#jURdK.x4LtA.4T' 
WHERE config_id = 1290;

-- entity creation


select * from entity order by 1 desc;

insert into entity (ENTITY_ID,ENTITY_CODE, ENTITY_TYPE_ID, ENTITY_FIRST_NAME, ENTITY_MIDDLE_NAME, ENTITY_LAST_NAME, REGISTRATION_DATE, ENTITY_NATURE_ID, MALE_OR_FEMALE, MOBILE, PHONE1, PHONE2, FAX1, FAX2, EMAIL, POST, LOG_ID, ADDRESS1, ADDRESS2, CITY_ID, PREFERRED_CLEARING_ENTITY, REGION_ID, COUNTRY_ID, OTHER_MOBILE, CITY_NAME, POSTAL_CODE, IMAGE_NAME, BIRTH_DATE, AUTO_CREATED, IS_SMS_ENABLED, IS_EMAIL_ENABLED, ACCEPT_MULTIPAYMENTS_VIA_OTC, IS_MULTI_CURRENCY_ENABLED, ENTITY_CATEGORY_ID, IS_GROUP_SMS_ENABLED, CONTACT_PERSON_FIRST_NAME, CONTACT_PERSON_EMAIL, ENTITY_SETUP_DET_ID, IS_GROUP_EMAIL_ENABLED, IMAGE_NAME_OPENMERCHALL_PAGE, CONTACT_PERSON_MIDDLE_NAME, CONTACT_PERSON_LAST_NAME, HIDE_SURCHARGE_COMMISSION, ENTITY_SHORT_NAME, IS_INTERPAY_PARTNER, IS_SUB_MERCHANT_REQUIRED, PARENT_ENTITY_ID, MINIMUM_COMMISSION_PERCENT, CSS_FILE_NAME, IS_UNSECURE_PAYMENT_ENABLED, SMALL_IMAGE_NAME, IS_PRE_AUTH_ENABLED, PARENT_SETTLMNT_BANKACC, INITIATOR_IMEI_NO, INITIATOR_DEVICE_ID, PIN, NOTIFICATION_EMAIL, INTERPAY_MIN_COMM_VALUE, ACCOUNT_MANAGER_ID, AGENT_SETUP_DET_ROW_ID, PARTNER_MERCHANT_BANK_ID, IS_COMMISSION_SPLIT_ENABLED, IS_PARTNER_BANK_REQUIRED, CLIENT_TIMESTAMP, PAYMODE_ENTITY_PROMPT_CODE, IS_CUSTOMER_EMAIL_ENABLED, IS_INWARD_REMITTANCE_PARTNER, FACEBOOK_LINK, INSTAGRAM_LINK, TWITTER_LINK)
values (150358,'FAB', 2, 'First Atlantic Bank', null, null, to_date('29-04-2025 13:55:20', 'dd-mm-yyyy hh24:mi:ss'), 1, null, null, null, null, null, null, null, 1, 0, null, null, null, null, null, 1, null, 'ACCRA', null, null, null, 0, 0, 0, 0, 0, null, 0, null, null, null, 0, null, null, null, 0, null, 0, 0, null, null, null, 0, null, 0, null, null, null, null, null, null, null, null, null, null, 0, null, null, 0, 0, null, null, null);










