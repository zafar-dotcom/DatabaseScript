select * from entity_api_credentials  c where c.app_id ='9053874068';
select * from entity where entity_id=149807 ;
select e.CASHOUT_DR_PUSH_NOTIF_URL from entity_url e where e.main_entity_id=149807;
select * from entity_url e where e.rule_id=1;

select * from bank_register order by 1 desc;
select * from remittance_register order by 1 desc; --this payload would be sent to merchant after cashout by initalglobal endpoint
