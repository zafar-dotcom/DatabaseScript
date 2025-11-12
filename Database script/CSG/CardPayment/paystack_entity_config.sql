
insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1291, 'PAYSTACK_SECRET_KEY', 'u8qUTFU1lv9xw4mKoQm6Red0dJh92i/bc9057kw0', 'PayStack microservice credentials');


insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1288, 'PAYSTACK_REDIRECT_URL', 'https://dev.cspay.app/PayStackCallBack/ConfirmPayment', 'PayStack Redirect url for mojopay after payment completion');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1287, 'PAYSTACK_BASEURL', 'https://paystack-dev.cspay.app', 'PayStack microservice baseurl');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1286, 'PAYSTACK_PASSWORD', '3?79!@%$@9j7f', 'PayStack microservice credentials');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1285, 'PAYSTACK_USERNAME', 'MCFABGAT', 'PayStack microservice credentials');


--update for live 



UPDATE entity_system_config 
SET config_value = 'u8qUTFU1lv9xw4mKoQm6Red0dJh92i/bc9057kw0' 
WHERE config_id = 1291;
 

UPDATE entity_system_config 
SET config_value = 'MCFABGAT' 
WHERE config_id = 1285;

UPDATE entity_system_config 
SET config_value = '3?79!@%$@9j7f' 
WHERE config_id = 1286;

UPDATE entity_system_config 
SET config_value = 'https://paystack-dev.cspay.app' 
WHERE config_id = 1287;

UPDATE entity_system_config 
SET config_value = 'https://dev.cspay.app/PayStackCallBack/ConfirmPayment' 
WHERE config_id = 1288;
