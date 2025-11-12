select * from mobile_network_ova order by 1 desc;
select * from entity_system_config order by 1 desc;
select * from entity_system_config c where c.config_id=1241;

select * from mobile_network_ova ova where ova.ova_mobile_number=+233598350750 ;

UPDATE mobile_network_ova
SET IS_FROM_OVA_ENABLED = 1
WHERE OVA_MOBILE_NUMBER = '+233598350750';


insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1241, 'MTN_RECURRING_OVA', '233598350750', 'Recurring OVA for MTN');
select * from OVA2OVA_FUND_TRANSFER_REGISTER order by 1 desc;



OVA_UTIL.GET_OVA2OVA_FUND_XFR_LIST
