

  select * from payment_mode_entity_ova_config order by 1 desc;
select * from payment_mode_entity_ova_config pm where pm.merchant_enttity_id=149807 ;
select * from mobile_network order by 1 desc;

 select * from PAYMENT_MODE order by 1 desc;
select * from entity e where e.entity_id=44101 ;
150477
update payment_mode_entity_ova_config set MERCHANT_ENTTITY_ID = 150477 where RULE_ID=9;
update payment_mode_entity_ova_config set IS_OTA_ENABLED = 1 where RULE_ID=9;


insert into payment_mode_entity_ova_config (RULE_ID, PAYMENT_MODE_ID, PM_PROVIDER_ENTITY_ID, MERCHANT_ENTTITY_ID, OVA_SERVICEID, OVA_SPID, POST, LOG_ID, IS_OTA_ENABLED)
values (9, 4, 43035, 149807, 'mojotest', '233535188679', 1, 0, 1 );










