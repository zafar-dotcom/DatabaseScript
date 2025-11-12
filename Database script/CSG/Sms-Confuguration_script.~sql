--gateway config
INSERT INTO SMS_GATEWAY (
    sms_gateway_id,
    sms_gateway_code,
    sms_gateway_desc,
    entity_id,
    sms_gateway_url,
    sms_gateway_userid,
    sms_gateway_pwd,
    post,
    log_id,
    rate_per_sms
) VALUES (
    4,
    'coliba-deywuro',
    'coliba-deywuro',
    1,
    'https://devsrv.cspay.app/dwurosmsapi/api/Deywuro/send-sms',
    'Coliba',
    '934e83',
    1,
    0,
    0.0200
);

UPDATE SMS_GATEWAY
SET 
    sms_gateway_code = 'zeshan-deywuro',
    sms_gateway_desc = 'zehsan-deywuro',
    sms_gateway_userid = 'zeshantest',
    sms_gateway_pwd = 'zeshantest'
WHERE sms_gateway_id = 4;


INSERT INTO ENTITY_SMS_CONFIG (
    rule_id,
    entity_id,
    gateway_service_provider,
    rate_per_sms,
    post,
    log_id,
    sms_gateway_id,
    sms_sender_name
    
) VALUES (
    4,
    149818,
    'I',
    0.0000,
    1,
    0,
    4,
    'CSG'
);


INSERT INTO SMS_TEXT_TEMPLATE_EXTENSION (
    rule_id,
    merchant_entity_id,
    sms_text_template_id,
    post,
    log_id
) VALUES (
    2,
    149818,
    2,
    1,
    0
);
