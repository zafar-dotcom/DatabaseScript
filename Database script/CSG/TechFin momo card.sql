select * from momocard_issuance order by 1 desc;
select * from MOMO_CARD_STATUS order by 1 desc;
select * from ENTITY_API_CREDENTIALS;

SP_GET_EXISTING_TOKEN_BY_MOBILE
SP_GET_MOMO_CARD_ISSUANCE_BY_CARD_ISSUANCE_ID
SP_UPDATE_IS_CARD_ISSUED_BIT
SP_INSERT_MOMOCARD_ISSUANCE

prompt Importing table momocard_issuance...
set feedback off
set define off

insert into momocard_issuance (CARD_ID, CUSTOMER_NAME, MOBILE, NETWORK_ID, EMAIL, EXPIRY_DATE, LAST_UPDATED, STATUS_ID, IS_CARD_ISSUED, CARD_ISSUANCE_DATE, POST, LOG_ID, CARD_ISSUANCE_ID)
values (57, 'John Doe', '9934567826', 2, 'johndoe@example.com', to_date('26-07-2024 07:30:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-06-2024 07:30:40', 'dd-mm-yyyy hh24:mi:ss'), 8, 1, null, 0, 1, 914796433702);



