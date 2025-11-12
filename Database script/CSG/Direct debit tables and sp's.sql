select * from direct_debit_term_structure ds where ds.ddreq_trans_id=130;--Main Request table for createddmandate endpoint ds ddreq_trans_id is transaction_id of Direct_Debit_Request tbl ;
select * from DD_DEBIT_SOURCE; --
select * from PRE_AUTH_REQUEST par where par.merchant_entity_id=149810; --check status on the basis of STATUS_CODE by GetDDMandateStatus endpoint and GetOTAStatus
select * from PRE_AUTH_REQUEST par where par.mobile=+233264391256 and par.merchant_entity_id=149810; --check status on the basis of STATUS_CODE by GetDDMandateStatus endpoint and GetOTAStatus
select * from Direct_Debit_Request order by 1 desc; --check wehter dd created or not on the  basis of dd_trans_status_id 1,2
select * from PRE_AUTH_CONFIG   ;  -- dd enable/disable check
select * from mtn_posted_transactions mtn where mtn.referenceid='5aae8621-2058-4264-8c6b-b8966db8862f';
select * from mtn_posted_transactions order by 1 desc;
select * from Direct_Debit_Request ddr
 where ddr.debtor_mobile='+233260251361' AND 
 ddr.merchant_entity_id=149810 and 
 ddr.dd_trans_status_id=2 AND
 ddr.SOURCE=4;  --check wehter dd created or not on the  basis of dd_trans_status_id 1,2
 
select * from Direct_Debit_Request dd where dd.merchant_entity_id=149810 and dd.debtor_mobile='+233261254516';

--additional tbl 

select * from V_ENTITY where ENTITY_ID=:ENTITY_ID 
-- sp function queries

DIRECT_DEBIT_UTIL.ADD_DIRECT_DEBIT_REQUEST_API
DIRECT_DEBIT_UTIL.SET_DIRECT_DEBIT_STATUS
PRE_AUTH_INSECUR_PYMT_CFG_UTIL.GET_MISCELLANEOUS_INFO  --check is dd enable or not
PRE_AUTH_INSECUR_PYMT_CFG_UTIL.GET_MOBILE_PREAUTH_REQ_STATUS  --api/DirectDebit/GetDDMandateStatus
DIRECT_DEBIT_UTIL.GET_ACTIVE_DD_TRANS_ID   --sp to ddcancel endpoint
DIRECT_DEBIT_UTIL.UPDATE_DDR_TERM_STRUCTURE_REQ  --update amount api/DirectDebit/updatedd 
PRE_AUTH_INSECUR_PYMT_CFG_UTIL.GET_MOBILE_PREAUTH_REQ_STATUS_V2

SYSTEM_PROCESS_UTIL.CREATE_ENTITY_WALLET_TOPUP_REQ     --ova fetch




PRE_AUTH_INSECUR_PYMT_CFG_UTIL.GET_MOBILE_PREAUTH_REQ_STATUS_V2
