select * from pre_auth_config order by 1 desc; 
select * from DIRECT_DEBIT_REQUEST order by 1 desc; 
select * from PRE_AUTH_REQUEST order by 1 desc; 

select * from PRE_AUTH_REQUEST pr where pr.mobile='+233552813681' and pr.merchant_entity_id= 105974;
select * from pre_auth_config pr where pr.mobile='+233552813681' and pr.merchant_entity_id= 105974 ;   
select * from DIRECT_DEBIT_REQUEST dd where dd.debtor_mobile='+233552813681' and dd.merchant_entity_id=105974;





update DIRECT_DEBIT_REQUEST dd set dd.debtor_mobile='+233552813681' ,dd.dd_trans_status_id =1 where dd.transaction_id=15749;

update PRE_AUTH_REQUEST p set p.status_code=0 where p.pre_auth_request_id in (2592355,2592357);
