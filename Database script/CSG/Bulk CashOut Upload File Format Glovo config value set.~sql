--Bulk CashOut Upload File Format
select * from entity_system_config order by 1 desc;
select * from entity_system_config where CONFIG_ID=1036 ;
select * from entity_system_config where CONFIG_ID=1228 ;
insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1226, 'Custom_cashout_file_upload_merchants', '149833;149818', 'This is created to enable multiple merchants for glovo cashout file upload formate');


UPDATE entity_system_config
SET CONFIG_VALUE = '149833;149818;1'
WHERE CONFIG_KEY = 'Custom_cashout_file_upload_merchants';

UPDATE entity_system_config
SET CONFIG_VALUE = '149833;149818;1'
WHERE CONFIG_KEY = 'EID_PPT';

--follwoing update query add the new config_value without affectting the existing config_value 
UPDATE entity_system_config
SET CONFIG_VALUE = CONCAT(CONFIG_VALUE, ';149867')
WHERE CONFIG_KEY = 'EID_PPT';

-- PROCESS_CASHOUT_FILE_UPLOAD_THROUGH_GHIPSS 

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1228, 'PROCESS_CASHOUT_FILE_THROUGH_GHIPSS', '1', 'In case of 1 cashout file upload would process through ghipss in case of BAT');


--MTN_INSTORE_OVA in mtnopenapiclient

delete from entity_system_config c where c.config_id 
insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1229, 'MTN_INSTORE_OVA', '233598402474', 'MTN_INSTORE_OVA');


-- SMTP email server and port 
select * from entity_system_config where config_id=1249 ;
update entity_system_config set config_value='SMTP' where config_id=180 ;

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1249, 'smtpServerAndPort', 'smtp.cs-pay.app:25', 'Smtp server and port');
update entity_system_config set config_value='https://api.cs-pay.app/cspayghtest/api/SMTP/sendEmailSMTP' where config_id=1249 ;

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1250, 'SMTP_CLIENT_USERNAME', 'EmailServiceCspay', 'smtp client username for basic auth');


insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1251, 'SMTP_CLIENT_PASSWORD', '!997000799!', 'smtp client password for basic auth');



select * from entity_system_config where config_id=1226 ;
update entity_system_config set config_value='149833;149888' where config_id=1226 ;

