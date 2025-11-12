select * from pre_auth_request;
DIRECT_DEBIT_UTIL.ADD_DIRECT_DEBIT_REQUEST_API
GET_MOBILE_PREAUTH_REQ_STATUS_V2
PRE_AUTH_INSECUR_PYMT_CFG_UTIL.GET_MISCELLANEOUS_INFO

select * from pre_auth_request order by 1 desc;
select * from pre_auth_config order by 1 desc;
select * from direct_debit_request order by 1 desc;
select * from direct_debit_entity_config order by 1 desc;
select * from direct_debit_entity_config_det order by 1 desc;
select * from direct_debit_request;
select * from term_structure_prompt_detail order by 1 desc;
select * from mobile_network order by 1 desc;
get_ready_to_post_installments


select * from mtn_posted_transactions t where t.partyid=:partyid " +
                                     "and t.resp_statuscode =:resp_statuscode " +
                                     "and t.transaction_type=:transaction_type " +
                                     "and t.transaction_date >= SYSDATE - (10 / (24 * 60)) " +
                                     "order by 1 desc




select * from bank_register order by 1 desc;
select * from Remittance_Register order by 1 desc;







--script 
select * from entity e order by 1 desc;
 
select * from PRE_AUTH_REQUEST order by 1 desc;
 
select * from PRE_AUTH_REQUEST;
 
select * from pre_auth_config order by 1 desc;
 
select * from pre_auth_config r where r.mobile in('+233555050988','+233547560721','+233553144664','+233246014301','+233554966125','+233246481150','+233264330988') order by 1 desc;
 
select * from direct_debit_request order by 1 desc;
select * from direct_debit_request ddr where ddr.transaction_id=128 order by 1 desc;
select * from dd_installment_frequency order by 1 desc;
select * from direct_debit_term_structure ;--ds where ds.ddreq_trans_id=42;
select * from direct_debit_term_structure ds where ds.debtor_mobile='+233246014301';
select * from direct_debit_term_structure ds where ds.ddreq_trans_id=128 order by ds.installment_no asc;
 
select * from dd_term_structure_detail d ;
select * from PAYMENT_MODE_ENTITY_OVA_CONFIG order by 1 desc;
 
create table DD_MANDATE_REQUEST
(
  request_id          NUMBER(12) not null,
  merchant_entity_id  NUMBER(12),
  merchant_ref_id     VARCHAR2(50),  
  narration           VARCHAR2(250), 
  platform_scheduling NUMBER(1) DEFAULT 0 NOT NULL, 
  mobile              VARCHAR2(50),
  network_id          NUMBER(3),
  amount              NUMBER(20,2),                
  currency            VARCHAR2(3) 
  frequency_id        VARCHAR2(20),             
  start_date  DATE,                       
  end_date    DATE,  
  day_of_request      NUMBER(2),                                     
  ova_service_id      VARCHAR2(100),
  ova_sp_id           VARCHAR2(100),
  status_code         NUMBER(1), 
  status_message      NUMBER(1),
  gateway_reference_id    VARCHAR2(50),
  gateway_status_message    VARCHAR2(50),
  response_date       DATE,
  post                NUMBER(1),
  log_id              NUMBER(12), 
)
 

create table PRE_AUTH_CONFIG
(
  config_id           NUMBER(12) not null,
  merchant_entity_id  NUMBER(12),
  mobile              VARCHAR2(50),
  mobile_network      VARCHAR2(50),
  is_pre_auth_enabled NUMBER(1),
  platform_scheduling NUMBER(1) DEFAULT 0 NOT NULL, 
  log_id              NUMBER(12),
  ova_service_id      VARCHAR2(100),
  ova_sp_id           VARCHAR2(100)
)
 
 
create table DD_MANDATE_TERM_STRUCTURE
(
  transaction_id     NUMBER(12) not null,
  mandate_req_id     NUMBER(12),  --foriegn key
  frequency_id       VARCHAR2(20),  --foriegn key
  installment_no     NUMBER(5),
  installment_date   DATE,
  insallment_amount  NUMBER(20,2),
  allowed_retries    NUMBER(5),
  used_retries       NUMBER(5),
  status_code        NUMBER(1),
  system_txn_id      NUMBER(12), --foriegn key
  post               NUMBER(1),
  log_id             NUMBER(12),
)
