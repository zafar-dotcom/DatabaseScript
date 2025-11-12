select * from entity_system_config order by 1 desc;

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1243, 'VODAFONE_OPEN_API_CLIENT_BASEURL', 'https://localhost:7061', 'Vodafone open api microservice credentials');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1244, 'VODAFONE_OPEN_API_CLIENT_USERNAME', 'VodafoneAPI', 'Vodafone open api microservice credentials');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1245, 'VODAFONE_OPEN_API_CLIENT_PASSWORD', '987656799', 'Vodafone open api microservice credentials');


insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1246, 'VODAFONE_OPEN_API_CLIENT_INPUT_SERVICEPROVIDERCODE', '000000', 'Vodafone open api microservice credentials');


select * from entity_system_config where CONFIG_ID=271;
