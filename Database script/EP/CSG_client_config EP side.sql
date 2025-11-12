select * from entity_system_config order by 1 desc;


insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1285, 'CSG_BATCASHOUT_URL', '', 'UAT MERCHANTS FOR CSG');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1284, 'CSG_CASHOUT_UAT_MERCHANTS', '44101;105991', 'UAT MERCHANTS FOR CSG');
 
insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1283, 'CSG_CASHOUT_UAT_ENABLE', '1', 'UAT ENABLEMENT FOR CSG');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1282, 'PROCESS_CASHOUTS_THROUGH_CSG', '1', 'CSG PROCESS_CASHOUTS_THROUGH_CSG');
insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1281, 'CSG_APP_KEY', '44475272', 'CSG APP_KEY');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1280, 'CSG_APP_ID', '6765146852', 'CSG APP_ID');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1279, 'CSG_BANK_TRANSFER_URL', '/v2/api/Cashout/BankTransfer', 'CSG BANK transfer_URL ');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1278, 'CSG_INVOICE_STATUS_URL', '/v1/Interapi.svc/GetInvoiceStatus', 'CSG INVOICE STATUS URL');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1277, 'CSG_GETACCOUNTPROFILE_URL', '/v2/api/Cashout/GetAccountProfile', 'CSG GetAccountProfile_URL for cashout');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1276, 'CSG_CASHOUT_STATUS_URL', '/v2/api/Cashout/GetTxnStatus', 'CSG Check TRANSACTION STATUS URL');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1275, 'CSG_MMCASHOUT_URL', '/v2/api/Cashout/InitiateGlobalCashout', 'CSG CASHOUT URL for MM');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1274, 'CSG_GET_BALANCE_URL', '/v2/api/Cashout/CheckAvailableBalance', 'CheckAvailableBalance url');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1273, 'CSG_MMPAYMENT_URL', '/v1/Interapi.svc/CreateMMPayment', 'CSG Create MMPAYMENT URL');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1272, 'CSG_BASE_URL', 'https://devsrv.cspay.app', 'CSG services BASE_URL');

insert into entity_system_config (CONFIG_ID, CONFIG_KEY, CONFIG_VALUE, CONFIG_STATUS)
values (1271, 'CROSS_SWITCH_EID', '105993', 'CrossSwitchGhana_EID');




