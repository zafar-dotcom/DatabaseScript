select * from entity_system_config order by 1 desc;


update entity_system_config set config_value='https://madapi-dev.cspay.app' where config_id=1091;
update entity_system_config set config_value='7307943519' where config_id=1089;
update entity_system_config set config_value='9245650837' where config_id=1090;

--csg-microservice   https://madapi-dev.cspay.app/api/v2/madapi



insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1292, 'MADAPI_MICROSERIVCE_VERSION', 'api/v2/madapi', 'Mad api version configuration');

