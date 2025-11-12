select * from entity_api_credentials c where c.app_id= '3314934024'; --3314934024  3314934024 zeeshan=2367618162   to get entity_id  which will be used in remit_entity_process_config table to get configuration 
select * from entity_api_credentials  c where c.entity_id=149810; --149887 sufyan  "5981776536"  apkey 25502077
select * from entity e where e.entity_id= 149910;  --149910 moovetog  --Vodafone=55851 MTN=43035, AIRTEL=37135 -GATEWAY -> EP=149813, CSP=149809, ghipss=149873,   it aslo contain network_entity with name entity_id of mobile network
select e.entity_id,e.entity_code from entity e where  e.entity_code in ('GHIPSS','CSP','EP','MTN');
select * from remit_entity_process_config c where c.merchant_entity_id= 149810;


 select * from mobile_network where entity_id=43035;   ;--43035;  --55851 37135;
 select * from remit_entity_process_config c where c.post=1;
 select * from remit_entity_process_config c where c.post is null; 
 
UPDATE remit_entity_process_config
SET post = 1
WHERE post IS NULL;

 select * from mobile_network where entity_id=37135;   --Vodafone=55851, MTN=43035, AIRTEL=37135 ,149873 entity_id also present in entity table
 Select * from remittance_register order by 1 desc; --status can also check in this table along with bank_register
 select * from bank_register order by 1 desc;   --requtes mark in this table for cashout ,Trnsaction_ID is foregn key here of remittance_register, and status of transaction would be check in this table 1 for success 0 failed and 2 pending
  select * from remittance_register rr where rr.MAIN_ENTITY_ID=149803 and rr.X_TRANS_REFERENCE_NO='test12342344523245667856';
select * from remittance_register order by 1 desc;   --status of transaction would be check in this table 1 for success 0 failed and 2 pending

 select * from remit_entity_process_config order by 1 desc; --149810
  select * from bank_register br where br.REMITTANCE_REG_TRANSID=9177710;   --requtes mark in this table for cashout ,Trnsaction_ID is foregn key here of remittance_register, and status of transaction would be check in this table 1 for success 0 failed and 2 pending

 REMITTANCE_UTIL.GENERATE_REMITTANCE_TRANS_REQ_SRVC
 REMITTANCE_UTIL.CHECK_REMITTANCE_TRANS_STATUS
 REMITTANCE_UTIL.GENERATE_REMITTANCE_TRANS_REQ

 REMITTANCE_UTIL.GENERATE_REMITTANCE_TRANS_REQ_SRVC_GIP
 REMITTANCE_UTIL.GENERATE_REMITTANCE_TRANS_REQ_SRVC_GIP
 GRA_INTEGRATION_UTIL.ADD_GRA_REMTTIANCE_REQ
 -- extract these query from above table  REMITTANCE_UTIL.CHECK_REMITTANCE_TRANS_STATUS

SELECT * 
FROM REMITTANCE_REGISTER order by 1 desc;

SELECT * FROM MTN_POSTED_TRANSACTIONS order  by 1 desc;


select c.rule_id,
       c.description,
       m.mobile_network_code,
       e.entity_code,
       c.pm_provider_entity_id,
       c.network_entity
  from REMIT_ENTITY_PROCESS_CONFIG c, mobile_network m, entity e
 where  m.entity_id= c.network_entity
   and e.entity_id = c.pm_provider_entity_id
   and c.merchant_entity_id = 149818;   --149818 zeeshan
