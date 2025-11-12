select * from entity order by 1 desc;
select * from payment_mode_entity_ova_config order by 1 desc;
select * from pre_auth_request order by 1 desc;     --sentota response after accounderholder verfication 
select * from pre_auth_config order by 1 desc;

--details

select * from entity where entity_id=149803;
select * from pre_auth_config where merchant_entity_id=149803;
select * from pre_auth_request where merchant_entity_id=149803;
select * from payment_mode_entity_ova_config where merchant_enttity_id=149803;
update pre_auth_config p set p.is_pre_auth_enabled=0 where mobile='+233241800400' and merchant_entity_id=149803;
select * from pre_auth_config;
"56975c75-7eed-4e3b-9743-a25e8a68b936"

select * from entity_api_credentials where app_id='2673488631';

