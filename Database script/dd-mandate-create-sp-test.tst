PL/SQL Developer Test script 3.0
32
begin
  -- Call the procedure
  DD_MANDATE_UTIL.CREATE_DD_MANDATE_WITH_PREAPPROVAL(P_REQUEST_DATE => :P_REQUEST_DATE,
                                                     P_PREAPPROVAL_ID => :P_PREAPPROVAL_ID,
                                                     P_MERCHANT_ENTITY_ID => :P_MERCHANT_ENTITY_ID,
                                                     P_MERCHANT_REF_ID => :P_MERCHANT_REF_ID,
                                                     P_NARRATION => :P_NARRATION,
                                                     P_PLATFORM_SCHEDULING => :P_PLATFORM_SCHEDULING,
                                                     P_MOBILE => :P_MOBILE,
                                                     P_NETWORK_ID => :P_NETWORK_ID,
                                                     P_AMOUNT => :P_AMOUNT,
                                                     P_CURRENCY_ID => :P_CURRENCY_ID,
                                                     P_FREQUENCY_ID => :P_FREQUENCY_ID,
                                                     P_START_DATE => :P_START_DATE,
                                                     P_END_DATE => :P_END_DATE,
                                                     P_DAY_OF_DEBIT => :P_DAY_OF_DEBIT,
                                                     P_OVA_SERVICE_ID => :P_OVA_SERVICE_ID,
                                                     P_OVA_SP_ID => :P_OVA_SP_ID,
                                                     P_STATUS_CODE => :P_STATUS_CODE,
                                                     P_STATUS_MESSAGE => :P_STATUS_MESSAGE,
                                                     P_SYSTEM_REFERENCE_ID => :P_SYSTEM_REFERENCE_ID,
                                                     P_GATEWAY_REFERENCE_ID => :P_GATEWAY_REFERENCE_ID,
                                                     P_GATEWAY_STATUS_MESSAGE => :P_GATEWAY_STATUS_MESSAGE,
                                                     P_RESPONSE_DATE => :P_RESPONSE_DATE,
                                                     P_POST => :P_POST,
                                                     P_OP_LOG => :P_OP_LOG,
                                                     P_EXISTING_REQUEST_ID => :P_EXISTING_REQUEST_ID,
                                                     P_RESPONSE_CODE => :P_RESPONSE_CODE,
                                                     P_RESPONSE_DESC => :P_RESPONSE_DESC,
                                                     P_RET_OVA_SERVCEID => :P_RET_OVA_SERVCEID,
                                                     P_RET_OVA_SPID => :P_RET_OVA_SPID);
end;
29
P_REQUEST_DATE
1
9/3/2025
12
P_PREAPPROVAL_ID
1
123456789d
5
P_MERCHANT_ENTITY_ID
1
149810
4
P_MERCHANT_REF_ID
1
73728404930438035
5
P_NARRATION
1
sp test for preaproval 
5
P_PLATFORM_SCHEDULING
1
1
4
P_MOBILE
1
+233444899798
5
P_NETWORK_ID
1
1
4
P_AMOUNT
1
121
4
P_CURRENCY_ID
1
1
4
P_FREQUENCY_ID
1
2
4
P_START_DATE
1
9/3/2025
12
P_END_DATE
1
9/4/2025
12
P_DAY_OF_DEBIT
1
5
4
P_OVA_SERVICE_ID
0
5
P_OVA_SP_ID
0
5
P_STATUS_CODE
1
1
4
P_STATUS_MESSAGE
1
ACTIVE
5
P_SYSTEM_REFERENCE_ID
1
39d1dcff378b1222y
5
P_GATEWAY_REFERENCE_ID
1
123455454
5
P_GATEWAY_STATUS_MESSAGE
1
test sp 
5
P_RESPONSE_DATE
1
9/3/2025
12
P_POST
1
0
4
P_OP_LOG
1
"11937789"|"11937788"|
5
P_EXISTING_REQUEST_ID
1
0
4
P_RESPONSE_CODE
1
-99
4
P_RESPONSE_DESC
1
PreApproval ID does not exist: 123456789d
5
P_RET_OVA_SERVCEID
0
5
P_RET_OVA_SPID
0
5
0
