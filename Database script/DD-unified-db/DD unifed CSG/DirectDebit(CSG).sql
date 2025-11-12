select * from DD_MANDATE_REQUEST order by 1 desc;
select * from dd_mandates order by 1 desc;
select * from dd_mandates where mandate_id=386;


select * from DD_MANDATE_CANCELLATION order by 1 desc;
select * from DD_RECURRING_PAYMENT order by 1 desc;

update dd_mandates set GATEWAY_REFERENCE_ID ='43634535' where mandate_req_id=827;
select * from DD_MANDATE_CANCELLATION order by 1 desc;
select * from fee_type order by 1 desc
select * from entity order by 1 desc;
DD_MANDATE_UTIL.GET_DD_RECURRING_PAYMENT_STATUS_V2

select * from DD_RECURRING_PAYMENT order by 1 desc;

select * from DD_MANDATE_CANCELLATION order by 1 desc;


delete from DD_RECURRING_PAYMENT where system_txn_id =108; --in (354,353,352);

--delete from dd_mandates where mandate_id =356; --in (354,353,352);


update dd_mandates set Mobile='+233344866755' where mobile='+233540122547';

--------------------------Entity System config for DD CSG--------------------------------------------------------

select * from entity_system_config order by 1 desc;

select * from entity_system_config e where e.CONFIG_KEY in ('MADAPI_MICROSERIVCE_VERSION','ClientId_MADApiClient','ClientSecret_MADApiClient','MADApiClientBaseURL');

--http://localhost:9090
update entity_system_config set config_value='https://madapi-dev.cspay.app' where config_id=1091;     --https://madapi-dev.cspay.app
update entity_system_config set config_value='7307943519' where config_id=1089;
update entity_system_config set config_value='9245650837' where config_id=1090;

--csg-microservice   https://madapi-dev.cspay.app/api/v2/madapi



--insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1292, 'MADAPI_MICROSERIVCE_VERSION', 'api/v2/madapi', 'Mad api version configuration');






select * from payment_mode_entity_ova_config order by 1 desc;
--------------------------Tables update query-------------------------------------------------------------------



-- FK to Mandate Config
ALTER TABLE DD_RECURRING_PAYMENT_TXN
  ADD CONSTRAINT FK_TXN_MANDATE_CONFIG
  FOREIGN KEY (mandate_config_id)
  REFERENCES DD_MANDATE_CONFIG (config_id);

-- FK to Currency
ALTER TABLE DD_RECURRING_PAYMENT_TXN
  ADD CONSTRAINT FK_TXN_CURRENCY
  FOREIGN KEY (currency_id)
  REFERENCES CURRENCY (currency_id);

-- FK to Status Definition
ALTER TABLE DD_RECURRING_PAYMENT_TXN
  ADD CONSTRAINT FK_TXN_STATUS_CODE
  FOREIGN KEY (txn_status_code)
  REFERENCES DD_PAYMENT_STATUS_DEF (status_code);



-- Drop primary, unique and foreign key constraints 
alter table DD_MANDATE_REQUEST
  drop constraint FK_DD_MANDATE_CURRENCY_ID;
alter table DD_MANDATE_REQUEST
  drop constraint FK_DD_MANDATE_FREQUENCY_ID;
 
-- Drop primary, unique and foreign key constraints 
alter table DD_MANDATES
  drop constraint SYS_C0092888 cascade;
alter table DD_MANDATES
  drop constraint FK_DD_CONFIG_CURRENCY_ID;




--Add entityid in DD_Recurrng_payment 
-- 1. Add the new column to DD_RECURRING_PAYMENT
ALTER TABLE DD_RECURRING_PAYMENT
  ADD MERCHANT_ENTITY_ID NUMBER;

-- 2. Add the foreign key constraint linking to ENTITY table
ALTER TABLE DD_RECURRING_PAYMENT
  ADD CONSTRAINT fk_ddrecpay_entity
  FOREIGN KEY (MERCHANT_ENTITY_ID)
  REFERENCES ENTITY (ENTITY_ID);







--entity url ------

select u.ota_approval_callback_url,u.ota_cancellation_callback_url,u.returl_onpaym_forinv_merchapi from ENTITY_URL u where u.MAIN_ENTITY_ID=150477;

UPDATE ENTITY_URL u
   SET u.ota_approval_callback_url      = 'https://webhook.site/d40ddb54-9119-4a8a-9499-b7124a8eae0f',
       u.ota_cancellation_callback_url  = 'https://webhook.site/d40ddb54-9119-4a8a-9499-b7124a8eae0f'
 WHERE u.MAIN_ENTITY_ID = 150477;


