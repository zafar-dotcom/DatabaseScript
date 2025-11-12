
DD_MANDATE_UTIL.CANCEL_DD_MANDATE
select * from DD_MANDATE_REQUEST order by 1 desc;
select * from dd_mandates order by 1 desc;
select * from DD_MANDATE_CANCELLATION order by 1 desc;



--------------------------Entity System config for DD CSG--------------------------------------------------------

select * from entity_system_config order by 1 desc;

select * from entity_system_config e where e.CONFIG_KEY in ('MADAPI_MICROSERIVCE_VERSION','ClientId_MADApiClient','ClientSecret_MADApiClient','MADApiClientBaseURL');


--update entity_system_config set config_value='https://madapi-dev.cspay.app' where config_id=1091;
--update entity_system_config set config_value='7307943519' where config_id=1089;
--update entity_system_config set config_value='9245650837' where config_id=1090;

--csg-microservice   https://madapi-dev.cspay.app/api/v2/madapi



insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1292, 'MADAPI_MICROSERIVCE_VERSION', 'api/v2/madapi', 'Mad api version configuration');



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






UPDATE ENTITY_URL u
   SET u.ota_approval_callback_url      = 'd40ddb54-9119-4a8a-9499-b7124a8eae0f@emailhook.site',
       u.ota_cancellation_callback_url  = 'd40ddb54-9119-4a8a-9499-b7124a8eae0f@emailhook.site'
 WHERE u.MAIN_ENTITY_ID = 105997;










