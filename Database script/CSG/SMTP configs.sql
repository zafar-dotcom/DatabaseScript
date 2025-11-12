select * from entity_system_config where config_id=1249 ;
update entity_system_config set config_value='SMTP' where config_id=180 ;

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1249, 'SMTP_API_URL', 'http://65.108.141.10:5353/api/SMTP/sendEmailSMTP', 'smtp client api url');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1250, 'SMTP_CLIENT_USERNAME', 'EmailServiceCspay', 'smtp client username for basic auth');


insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1251, 'SMTP_CLIENT_PASSWORD', '!997000799!', 'smtp client password for basic auth');
