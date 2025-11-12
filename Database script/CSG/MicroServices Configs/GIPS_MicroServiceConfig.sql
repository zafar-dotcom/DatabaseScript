--ticket Task #1803

select * from entity_system_config where config_id in ('1262','1263','1264');


insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1262, 'GIP_MICROSERVICE_URL', 'http://65.108.141.10:6977', 'GIPS and RTP Microservice URL ');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1263, 'GIP_MICROSERVICE_USERNAME', 'rtp2024Inward', 'GIPS and RTP Microservice UserName');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1264, 'GIP_MICROSERVICE_PASSWORD', '99!7000790!', 'GIPS and RTP Microservice Password');



