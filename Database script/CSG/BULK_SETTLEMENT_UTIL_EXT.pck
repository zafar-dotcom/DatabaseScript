CREATE OR REPLACE PACKAGE BULK_SETTLEMENT_UTIL_EXT IS
  --======================================================================================================
  ----------------PROCEDURES GET_BANK_LISTING-------------------------------------------------------------
  --======================================================================================================
  PROCEDURE GET_SETTLEMENT_BANK_LIST(P_BANK_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- MERCHANT LISTING ---
  --======================================================================================================
  PROCEDURE GET_SETTLEMENT_MERCH_LIST(P_DATE          BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                      P_MERCHANT_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- BANK LISTING BY NAME---
  --======================================================================================================
  PROCEDURE GET_SETTLEMENT_BANK_INFO(P_BANK_NAME SETTLEMENT_BANK_LST.BANK_NAME%TYPE,
                                     P_BANK_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- TEMP DATA INSERTION ---
  --======================================================================================================
  PROCEDURE ADD_SETTLEMENT_UPDATED_INSTRUC_REC( --P_RECORD_ID MERCHANT_SETTLEMNT_INSTRUC.RECORD_ID%TYPE,
                                               P_TRANS_DATE           MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                               P_TRNAS_ID             MERCHANT_SETTLEMNT_INSTRUC.TRANS_ID%TYPE,
                                               P_AMOUNT               MERCHANT_SETTLEMNT_INSTRUC.AMOUNT%TYPE,
                                               P_NARRATION            MERCHANT_SETTLEMNT_INSTRUC.NARRATION%TYPE,
                                               P_OLD_FRM_ACCOUNT      MERCHANT_SETTLEMNT_INSTRUC.OLD_FRM_ACCOUNT%TYPE,
                                               P_OLD_ACC_TITLE        MERCHANT_SETTLEMNT_INSTRUC.OLD_ACC_TITLE%TYPE,
                                               P_TO_ACC_NUMBER        MERCHANT_SETTLEMNT_INSTRUC.TO_ACC_NUMBER%TYPE,
                                               P_BENE_ACC_TITLE       MERCHANT_SETTLEMNT_INSTRUC.BENE_ACC_TITLE%TYPE,
                                               P_BENE_BANK_CODE       MERCHANT_SETTLEMNT_INSTRUC.BENE_BANK_CODE%TYPE,
                                               P_BENE_BANK_SWIFT_CODE MERCHANT_SETTLEMNT_INSTRUC.BENE_BANK_SWIFT_CODE%TYPE,
                                               P_NEW_FRM_ACC          MERCHANT_SETTLEMNT_INSTRUC.NEW_FRM_ACC%TYPE,
                                               P_NEW_BANK_NAME        MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                               P_AVAILABLE_BAL        MERCHANT_SETTLEMNT_INSTRUC.AVAILABLE_BALANCE%TYPE,
                                               P_ENTITY_ID            MERCHANT_SETTLEMNT_INSTRUC.ENTITY_ID%TYPE,
                                               P_REPUSH_TYPE          MERCHANT_SETTLEMNT_INSTRUC.REPUSH_TYPE%TYPE,
                                               P_IS_PUSHED            MERCHANT_SETTLEMNT_INSTRUC.IS_PUSHED%TYPE,
                                               P_IS_REPUSHED          MERCHANT_SETTLEMNT_INSTRUC.IS_REPUSHED%TYPE,
                                               P_ORIGIN_BANK          MERCHANT_SETTLEMNT_INSTRUC.ORIGIN_BANK%TYPE,
                                               P_BATCH_NO             MERCHANT_SETTLEMNT_INSTRUC.BATCH_NO%TYPE,
                                               P_IS_PROCESSED         MERCHANT_SETTLEMNT_INSTRUC.IS_PROCESSED%TYPE,
                                               P_OP_LOG               IN OUT VARCHAR2, --USER_OP_LOG_TYPE,
                                               P_RECORD_ID            OUT NUMBER); --,
  -- P_RECORD_ID OUT SYS_REFCURSOR);

  --======================================================================================================
  --                       PROCEDURES -- GET_SAVE_INSTRUCTIONS_TO_PUSH ---
  --======================================================================================================   
  PROCEDURE GET_SAVE_INSTRUCTIONS_TO_PUSH(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                          P_RECORD_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- GET_SAVE_INSTRUCTIONS_TO_REPUSH ---
  --======================================================================================================   
  PROCEDURE GET_SAVE_INSTRUCTIONS_TO_REPUSH(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                            P_RECORD_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- GET_SETTLEMENT_INSTRUC_REC ---
  --======================================================================================================      

  PROCEDURE GET_SETTLEMENT_INSTRUC_REC(P_TRANS_DATE  IN BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                       P_MERCHANT_ID IN varchar2,
                                       P_INDEXPAGE   IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                       P_PAGESIZE    IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                       P_RECORD_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- POST_UPDATED_SETTLEMNT_INTRUC ---
  --======================================================================================================   
  PROCEDURE POST_UPDATED_SETTLEMNT_INTRUC(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                          P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                          P_RECORD_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- UPDATE_BANK_REGISTER_BANK_ID ---
  --======================================================================================================  
  PROCEDURE UPDATE_SETTLEMENT_SAVED_INSTRUC(P_BANK_ACC_ID BANK_REGISTER.BANK_ACCOUNT_ID%TYPE,
                                            P_TRANS_ID    BANK_REGISTER.TRANSACTION_ID%TYPE,
                                            P_TRANS_DATE  BANK_REGISTER.TRANSACTION_DATE%TYPE);
  --======================================================================================================
  --                       PROCEDURES -- GET_SETTLEMENT_INSTRUCTIONS_FOR-REPUSH ---
  --======================================================================================================      

  PROCEDURE GET_SETTLEMENT_REPUSH_INSTRUCTION(P_TRANS_DATE  IN BANK_REGISTER.POST_XFR_RESPONSE_DATE%TYPE,
                                              P_MERCHANT_ID IN BANK_REGISTER.ENTITY_ID%TYPE,
                                              P_INDEXPAGE   IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                              P_PAGESIZE    IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                              P_RECORD_LIST OUT SYS_REFCURSOR);

  --======================================================================================================
  --                       PROCEDURES -- GET_FAILED_MERCH_LIST ---
  --======================================================================================================
  PROCEDURE GET_FAILED_MERCH_LIST(P_DATE          BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                  P_MERCHANT_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- GET_INSTRUCTIONS_STATUS_LIST ---
  --======================================================================================================
  PROCEDURE GET_INSTRUCTIONS_STATUS_LIST(P_INS_DATE          IN BANK_REGISTER.POST_XFR_RESPONSE_DATE%TYPE,
                                         P_INDEXPAGE         IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                         P_PAGESIZE          IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                         P_STATUS            IN BANK_REGISTER_BATCH_DETAIL.STATUS%TYPE,
                                         P_TYPE              IN BANK_REGISTER.BANK_ACCT_ACTIVITY_ID%TYPE,
                                         P_INSTRUCTIONS_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- ADD_SETTLEMENT_UPDATED_INSTRUC_REC ---
  --======================================================================================================
  PROCEDURE ADD_SETTLEMENT_REPUSH_INSTRUC_REC( --P_RECORD_ID MERCHANT_SETTLEMNT_INSTRUC.RECORD_ID%TYPE,
                                              P_TRANS_DATE           MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                              P_TRNAS_ID             MERCHANT_SETTLEMNT_INSTRUC.TRANS_ID%TYPE,
                                              P_AMOUNT               MERCHANT_SETTLEMNT_INSTRUC.AMOUNT%TYPE,
                                              P_NARRATION            MERCHANT_SETTLEMNT_INSTRUC.NARRATION%TYPE,
                                              P_OLD_FRM_ACCOUNT      MERCHANT_SETTLEMNT_INSTRUC.OLD_FRM_ACCOUNT%TYPE,
                                              P_OLD_ACC_TITLE        MERCHANT_SETTLEMNT_INSTRUC.OLD_ACC_TITLE%TYPE,
                                              P_TO_ACC_NUMBER        MERCHANT_SETTLEMNT_INSTRUC.TO_ACC_NUMBER%TYPE,
                                              P_BENE_ACC_TITLE       MERCHANT_SETTLEMNT_INSTRUC.BENE_ACC_TITLE%TYPE,
                                              P_BENE_BANK_CODE       MERCHANT_SETTLEMNT_INSTRUC.BENE_BANK_CODE%TYPE,
                                              P_BENE_BANK_SWIFT_CODE MERCHANT_SETTLEMNT_INSTRUC.BENE_BANK_SWIFT_CODE%TYPE,
                                              P_NEW_FRM_ACC          MERCHANT_SETTLEMNT_INSTRUC.NEW_FRM_ACC%TYPE,
                                              P_NEW_BANK_NAME        MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                              P_AVAILABLE_BAL        MERCHANT_SETTLEMNT_INSTRUC.AVAILABLE_BALANCE%TYPE,
                                              P_ENTITY_ID            MERCHANT_SETTLEMNT_INSTRUC.ENTITY_ID%TYPE,
                                              P_REPUSH_TYPE          MERCHANT_SETTLEMNT_INSTRUC.REPUSH_TYPE%TYPE,
                                              P_IS_PUSHED            MERCHANT_SETTLEMNT_INSTRUC.IS_PUSHED%TYPE,
                                              P_IS_REPUSHED          MERCHANT_SETTLEMNT_INSTRUC.IS_REPUSHED%TYPE,
                                              P_OP_LOG               IN OUT VARCHAR2, --USER_OP_LOG_TYPE,
                                              P_RECORD_ID            OUT NUMBER);

  --======================================================================================================
  --                       PROCEDURES -- UPDATE_MANUAL_SET_SAVED_INSTRUC ---
  --====================================================================================================== 
  PROCEDURE UPDATE_MANUAL_SET_SAVED_INSTRUC(P_TRANS_ID   BANK_REGISTER.TRANSACTION_ID%TYPE,
                                            P_TRANS_DATE BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                            P_BATCH_NO   MERCHANT_SETTLEMNT_INSTRUC.BATCH_NO%TYPE);
  --======================================================================================================
  --                       PROCEDURES -- POST_UPDATED_SETTLEMNT_INTRUC_REPUSH ---
  --======================================================================================================   
  PROCEDURE POST_UPDATED_SETTLEMNT_INTRUC_REPUSH(P_TRANS_DATE    MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                                 P_BANK_NAME     MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                                 p_Repush_Status MERCHANT_SETTLEMNT_INSTRUC.REPUSH_TYPE%TYPE,
                                                 P_RECORD_LIST   OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- UPDATE_SETTLEMENT_REPUSH_REC ---
  --======================================================================================================   
  PROCEDURE UPDATE_SETTLEMENT_REPUSH_REC(P_TRANS_ID IN VARCHAR2);

  --======================================================================================================
  --                       PROCEDURES -- UPDATE_BANK_REGISTER_BANK_ID ---
  --======================================================================================================
  PROCEDURE UPDATE_SETTLEMENT_SAVED_INSTRUC_GIPS(P_BANK_ACC_ID BANK_REGISTER.BANK_ACCOUNT_ID%TYPE,
                                                 P_TRANS_ID    BANK_REGISTER.TRANSACTION_ID%TYPE,
                                                 P_TRANS_DATE  BANK_REGISTER.TRANSACTION_DATE%TYPE);
  --======================================================================================================
  --                       PROCEDURES -- GET SETTLEMENT INSTRUCTION JOB STATUS
  --======================================================================================================
  PROCEDURE GET_SETTLEMENT_JOB_INFO(P_DATE       IN DATE,
                                    P_STATUS_ID  OUT NUMBER,
                                    P_STATUS_MSG OUT VARCHAR2);
  --======================================================================================================
  --                       PROCEDURES -- UPDATE_BANK_REGISTER_&_MERCHANT_SETTLEMENT ---
  --======================================================================================================
  PROCEDURE UPDATE_SETTLEMENT_INSTRUCTION_GIP(P_BANK_ACC_ID    BANK_REGISTER.BANK_ACCOUNT_ID%TYPE,
                                              P_TRANS_ID       BANK_REGISTER.TRANSACTION_ID%TYPE,
                                              P_TRANS_DATE     BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                              P_STATUS_CODE    MERCHANT_SETTLEMNT_INSTRUC.STATUS_CODE%TYPE,
                                              P_STATUS_MESSAGE MERCHANT_SETTLEMNT_INSTRUC.STATUS_MESSAGE%TYPE,
                                              P_PUSHED_COUNT   MERCHANT_SETTLEMNT_INSTRUC.PUSHED_COUNT%TYPE);

  --======================================================================================================
  --                       PROCEDURES -- STOP_BATCH_PROCESSING ---
  --======================================================================================================   
  PROCEDURE STOP_BATCH_PROCESSING(P_TRANS_DATE MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                  P_BANK_NAME  MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE);

  --======================================================================================================
  --                       PROCEDURES -- VALIDATE_INSTRUCTION ---
  --======================================================================================================
  PROCEDURE VALIDATE_REPUSH_INSTRUCTION(P_TRANS_ID IN VARCHAR2,
                                        P_RESULT   OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- DELETE_INSTRUCTION ---
  --======================================================================================================
  PROCEDURE DELETE_INSTRUCTION(P_TRANSACTION_ID IN MERCHANT_SETTLEMNT_INSTRUC.TRANS_ID%TYPE);
  --======================================================================================================
  --                       PROCEDURES -- GET_PROCESSED_BATCH_INSTRUCTIONS_LIST ---
  --======================================================================================================   
  PROCEDURE GET_PROCESSED_BATCH_INSTRUCTIONS_LIST(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                                  P_BATCH_NO    MERCHANT_SETTLEMNT_INSTRUC.BATCH_NO%TYPE,
                                                  P_RECORD_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- GET_UPDATED_SETTLEMNT_INTRUC_BY_ID ---
  --======================================================================================================   
  PROCEDURE GET_UPDATED_SETTLEMNT_INTRUC_BY_ID(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                               P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                               P_TXN_ID      MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                               P_RECORD_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- GET_UPDATED_SETTLEMNT_INTRUC_BY_BATCH ---
  --======================================================================================================   
  PROCEDURE GET_UPDATED_SETTLEMNT_INTRUC_BY_BATCH(P_TRANS_DATE MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                                  --P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                                  P_BATCH_NO    MERCHANT_SETTLEMNT_INSTRUC.BATCH_NO%TYPE,
                                                  P_RECORD_LIST OUT SYS_REFCURSOR);

  --======================================================================================================
  --                       PROCEDURES -- GET_UPDATED_REPUSH_SETTLEMNT_INTRUC ---
  --======================================================================================================   
  PROCEDURE GET_UPDATED_REPUSH_SETTLEMNT_INTRUC(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                                P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                                P_RECORD_LIST OUT SYS_REFCURSOR);
  --======================================================================================================
  --                       PROCEDURES -- UPDATE_SETTLEMENT_SAVED_INSTRUC_GIPS_REPUSH ---
  --======================================================================================================
  PROCEDURE UPDATE_SETTLEMENT_SAVED_INSTRUC_GIPS_REPUSH(P_BANK_ACC_ID BANK_REGISTER.BANK_ACCOUNT_ID%TYPE,
                                                        P_TRANS_ID    BANK_REGISTER.TRANSACTION_ID%TYPE,
                                                        P_TRANS_DATE  BANK_REGISTER.TRANSACTION_DATE%TYPE);
  --======================================================================================================
  --                       PROCEDURES -- POST_UPDATED_SETTLEMNT_INTRUC ---
  --======================================================================================================   
  PROCEDURE GET_UPDATED_SETTLEMNT_INTRUC(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                         P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                         P_RECORD_LIST OUT SYS_REFCURSOR);

END BULK_SETTLEMENT_UTIL_EXT;
/
CREATE OR REPLACE PACKAGE BODY BULK_SETTLEMENT_UTIL_EXT IS
  --======================================================================================================
  --                       PROCEDURES -- GET_SETTLEMENT_BANK_LIST ---
  --======================================================================================================
  PROCEDURE GET_SETTLEMENT_BANK_LIST(P_BANK_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_BANK_LIST FOR
    
      SELECT * FROM SETTLEMENT_BANK_LST WHERE IS_ENABLED = 1;
  
  END GET_SETTLEMENT_BANK_LIST;
  --======================================================================================================
  --                       PROCEDURES -- GET_SETTLEMENT_MERCH_LIST ---
  --======================================================================================================
  PROCEDURE GET_SETTLEMENT_MERCH_LIST(P_DATE          BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                      P_MERCHANT_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_MERCHANT_LIST FOR
    
      SELECT CBA.ENTITY_ID MERCHANT_ENTITY_ID,
             E.ENTITY_CODE || '-' || E.ENTITY_FIRST_NAME MERCHANT_NAME
        FROM BANK_REGISTER BR,
             BANK_ACCOUNT  BA,
             BANK_ACCOUNT  CBA,
             BANK_BRANCH   CBB,
             ENTITY        E
       WHERE BR.BANK_ACCOUNT_ID = BA.BANK_ACCOUNT_ID
         AND BR.CONTRA_BANK_ACCOUNT_ID = CBA.BANK_ACCOUNT_ID
         AND CBA.BANK_BRANCH_ID = CBB.BANK_BRANCH_ID
         AND CBA.ENTITY_ID = E.ENTITY_ID
         AND BR.BANK_ACCT_ACTIVITY_ID in (14, 13,20)
         AND BR.POST = 0
         AND TRUNC(BR.TRANSACTION_DATE) = TRUNC(P_DATE)
         AND br.narration not like '%ACC1010000209%'
         AND E.ENTITY_ID NOT IN (77357)
      -- and e.entity_id not in (103300,103159,103301)
      --AND TRUNC(BR.TRANSACTION_DATE) = '16-JUL-2021'
       GROUP BY CBA.ENTITY_ID, E.ENTITY_CODE || '-' || E.ENTITY_FIRST_NAME
       ORDER BY 1;
  
  END GET_SETTLEMENT_MERCH_LIST;
  --======================================================================================================
  --                       PROCEDURES -- GET_SETTLEMENT_BANK_INFO---
  --======================================================================================================
  PROCEDURE GET_SETTLEMENT_BANK_INFO(P_BANK_NAME SETTLEMENT_BANK_LST.BANK_NAME%TYPE,
                                     P_BANK_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_BANK_LIST FOR
    
      SELECT BANK_NAME  AS BANK_NAME,
             ACC_NUMBER AS ACC_NUMBER,
             ACC_TITLE  AS ACC_TITLE
        FROM SETTLEMENT_BANK_LST
       WHERE IS_ENABLED = 1
         AND BANK_NAME = P_BANK_NAME;
  
  END GET_SETTLEMENT_BANK_INFO;
  --======================================================================================================
  --                       PROCEDURES -- ADD_SETTLEMENT_UPDATED_INSTRUC_REC ---
  --======================================================================================================
  PROCEDURE ADD_SETTLEMENT_UPDATED_INSTRUC_REC( --P_RECORD_ID MERCHANT_SETTLEMNT_INSTRUC.RECORD_ID%TYPE,
                                               P_TRANS_DATE           MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                               P_TRNAS_ID             MERCHANT_SETTLEMNT_INSTRUC.TRANS_ID%TYPE,
                                               P_AMOUNT               MERCHANT_SETTLEMNT_INSTRUC.AMOUNT%TYPE,
                                               P_NARRATION            MERCHANT_SETTLEMNT_INSTRUC.NARRATION%TYPE,
                                               P_OLD_FRM_ACCOUNT      MERCHANT_SETTLEMNT_INSTRUC.OLD_FRM_ACCOUNT%TYPE,
                                               P_OLD_ACC_TITLE        MERCHANT_SETTLEMNT_INSTRUC.OLD_ACC_TITLE%TYPE,
                                               P_TO_ACC_NUMBER        MERCHANT_SETTLEMNT_INSTRUC.TO_ACC_NUMBER%TYPE,
                                               P_BENE_ACC_TITLE       MERCHANT_SETTLEMNT_INSTRUC.BENE_ACC_TITLE%TYPE,
                                               P_BENE_BANK_CODE       MERCHANT_SETTLEMNT_INSTRUC.BENE_BANK_CODE%TYPE,
                                               P_BENE_BANK_SWIFT_CODE MERCHANT_SETTLEMNT_INSTRUC.BENE_BANK_SWIFT_CODE%TYPE,
                                               P_NEW_FRM_ACC          MERCHANT_SETTLEMNT_INSTRUC.NEW_FRM_ACC%TYPE,
                                               P_NEW_BANK_NAME        MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                               P_AVAILABLE_BAL        MERCHANT_SETTLEMNT_INSTRUC.AVAILABLE_BALANCE%TYPE,
                                               P_ENTITY_ID            MERCHANT_SETTLEMNT_INSTRUC.ENTITY_ID%TYPE,
                                               P_REPUSH_TYPE          MERCHANT_SETTLEMNT_INSTRUC.REPUSH_TYPE%TYPE,
                                               P_IS_PUSHED            MERCHANT_SETTLEMNT_INSTRUC.IS_PUSHED%TYPE,
                                               P_IS_REPUSHED          MERCHANT_SETTLEMNT_INSTRUC.IS_REPUSHED%TYPE,
                                               P_ORIGIN_BANK          MERCHANT_SETTLEMNT_INSTRUC.ORIGIN_BANK%TYPE,
                                               P_BATCH_NO             MERCHANT_SETTLEMNT_INSTRUC.BATCH_NO%TYPE,
                                               P_IS_PROCESSED         MERCHANT_SETTLEMNT_INSTRUC.IS_PROCESSED%TYPE,
                                               P_OP_LOG               IN OUT VARCHAR2, --USER_OP_LOG_TYPE,
                                               P_RECORD_ID            OUT NUMBER) --,
    -- P_RECORD_ID OUT SYS_REFCURSOR)
  
   IS
  
    V_COUNT       NUMBER(3) := 0;
    V_OP_LOG_TYPE USER_OP_LOG_TYPE := USER_OP_LOG_TYPE(NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL);
  BEGIN
    FORMAT_N_GENERATE_LOG(P_OP_LOG, V_OP_LOG_TYPE);
    --   OPEN P_RECORD_ID
    SELECT COUNT(*)
      INTO V_COUNT
      FROM MERCHANT_SETTLEMNT_INSTRUC O
     WHERE O.TRANS_ID = P_TRNAS_ID
       AND IS_REPUSHED = 0;
  
    IF (V_COUNT > 0) THEN
      SELECT COUNT(*)
        INTO V_COUNT
        FROM MERCHANT_SETTLEMNT_INSTRUC O
       WHERE O.TRANS_ID = P_TRNAS_ID
         AND IS_REPUSHED = 0;
    ELSE
    
      INSERT INTO MERCHANT_SETTLEMNT_INSTRUC
        (TRANS_DATE,
         TRANS_ID,
         AMOUNT,
         NARRATION,
         OLD_FRM_ACCOUNT,
         OLD_ACC_TITLE,
         TO_ACC_NUMBER,
         BENE_ACC_TITLE,
         BENE_BANK_CODE,
         BENE_BANK_SWIFT_CODE,
         NEW_FRM_ACC,
         NEW_BANK_NAME,
         IS_PUSHED,
         AVAILABLE_BALANCE,
         ENTITY_ID,
         IS_REPUSHED,
         REPUSH_TYPE,
         ORIGIN_BANK,
         BATCH_NO,
         IS_PROCESSED,
         LOG_ID,
         PUSHED_COUNT)
      VALUES
        (P_TRANS_DATE,
         P_TRNAS_ID,
         P_AMOUNT,
         P_NARRATION,
         P_OLD_FRM_ACCOUNT,
         P_OLD_ACC_TITLE,
         P_TO_ACC_NUMBER,
         P_BENE_ACC_TITLE,
         P_BENE_BANK_CODE,
         P_BENE_BANK_SWIFT_CODE,
         P_NEW_FRM_ACC,
         P_NEW_BANK_NAME,
         P_IS_PUSHED,
         P_AVAILABLE_BAL,
         P_ENTITY_ID,
         0,
         P_REPUSH_TYPE,
         P_ORIGIN_BANK,
         P_BATCH_NO,
         P_IS_PROCESSED,
         V_OP_LOG_TYPE.LOG_ID,
         0);
    END IF;
    SELECT TRANS_ID
      INTO P_RECORD_ID
      FROM MERCHANT_SETTLEMNT_INSTRUC
     ORDER BY 1 DESC OFFSET 0 ROWS
     FETCH NEXT 1 ROWS ONLY;
  END ADD_SETTLEMENT_UPDATED_INSTRUC_REC;

  --======================================================================================================
  --                       PROCEDURES -- GET_SAVE_INSTRUCTIONS_TO_PUSH ---
  --======================================================================================================   
  PROCEDURE GET_SAVE_INSTRUCTIONS_TO_PUSH(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                          P_RECORD_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT TRANS_DATE, SUM(AMOUNT) AS AMOUNT, NEW_BANK_NAME
        FROM MERCHANT_SETTLEMNT_INSTRUC
       WHERE IS_PUSHED = 0
         AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE)
         AND IS_REPUSHED = 0
       GROUP BY TRANS_DATE, NEW_BANK_NAME
       ORDER BY 1 DESC;
  
  END GET_SAVE_INSTRUCTIONS_TO_PUSH;
  --======================================================================================================
  --                       PROCEDURES -- GET_SAVE_INSTRUCTIONS_TO_REPUSH ---
  --======================================================================================================   
  PROCEDURE GET_SAVE_INSTRUCTIONS_TO_REPUSH(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                            P_RECORD_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT TRANS_DATE, SUM(AMOUNT) AS AMOUNT, NEW_BANK_NAME, REPUSH_TYPE
        FROM MERCHANT_SETTLEMNT_INSTRUC
       WHERE IS_PUSHED = 1
            --AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE)
         AND IS_REPUSHED = 0
       GROUP BY TRANS_DATE, NEW_BANK_NAME, REPUSH_TYPE
       ORDER BY 1 DESC;
  
  END GET_SAVE_INSTRUCTIONS_TO_REPUSH;
  --======================================================================================================
  --                       PROCEDURES -- GET_SETTLEMENT_INSTRUC_REC ---
  --======================================================================================================      

  PROCEDURE GET_SETTLEMENT_INSTRUC_REC(P_TRANS_DATE  IN BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                       P_MERCHANT_ID IN VARCHAR2,
                                       P_INDEXPAGE   IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                       P_PAGESIZE    IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                       P_RECORD_LIST OUT SYS_REFCURSOR)
  
   IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT *
        FROM (SELECT A.*, ROWNUM R__
                FROM (SELECT BR.TRANSACTION_DATE,
                             BR.TRANSACTION_ID,
                             BR.AMOUNT,
                             BR.NARRATION,
                             BA.ACCOUNT_NUMBER FROM_ACCOUNT_NUMBER,
                             BA.ACCOUNT_TITLE FROM_ACCOUNT_TITLE,
                             CBA.ACCOUNT_NUMBER BENEFICIARY_ACCOUNT_NUMBER,
                             CBA.ACCOUNT_TITLE BENEFICIARY_ACCOUNT_TITLE,
                             CBB.SORT_CODE BENEFICIARY_BANK_CODE,
                             CBB.BANK_BRANCH_CODE BENEFICIARY_BRANCH_SORT_CODE,
                             GPB.GIP_ROUTING_CODE,
                             COUNT(*) OVER() TOTAL_RECORDS
                        FROM BANK_REGISTER           BR, -- MAIN TABLE
                             BANK_ACCOUNT            BA,
                             BANK_ACCOUNT            CBA,
                             BANK_BRANCH             CBB,
                             GIP_BANKS_ROUTING_CODES GPB
                       WHERE BR.BANK_ACCOUNT_ID = BA.BANK_ACCOUNT_ID
                         AND BR.CONTRA_BANK_ACCOUNT_ID = CBA.BANK_ACCOUNT_ID
                         AND CBA.BANK_BRANCH_ID = CBB.BANK_BRANCH_ID
                         AND CBB.BANK_ID = GPB.BANK_ID(+)
                         AND BR.BANK_ACCT_ACTIVITY_ID IN (14, 13,20)
                         AND BR.POST = 0
                            
                         AND BR.TRANSACTION_ID NOT IN
                             (SELECT MS.TRANS_ID
                                FROM MERCHANT_SETTLEMNT_INSTRUC MS
                               WHERE TRUNC(MS.TRANS_DATE) = P_TRANS_DATE)
                            
                            --AND TRUNC(BR.TRANSACTION_DATE) = '16-JUL-2021'
                         AND TRUNC(BR.TRANSACTION_DATE) = TRUNC(P_TRANS_DATE)
                         and br.narration not like '%ACC1010000209%'
                            --AND (CBA.ENTITY_ID = -1 OR CBA.ENTITY_ID = P_MERCHANT_ID)
                            --  AND DECODE(NVL(P_MERCHANT_ID, -1), -1, 1, CBA.ENTITY_ID) = (DECODE(NVL(P_MERCHANT_ID, -1), -1, 1, P_MERCHANT_ID))
                            --and cba.entity_id not in (103300,103159,103301)
                         and (P_MERCHANT_ID = '-1' OR
                             CBA.ENTITY_ID in
                             (SELECT REGEXP_SUBSTR(P_MERCHANT_ID,
                                                    '[^,]+',
                                                    1,
                                                    LEVEL)
                                 FROM DUAL
                               CONNECT BY REGEXP_SUBSTR(P_MERCHANT_ID,
                                                        '[^,]+',
                                                        1,
                                                        LEVEL) IS NOT NULL))
                      --AND CBA.ENTITY_ID NOT IN (77357)
                       ORDER BY 1 DESC) A
               WHERE ROWNUM < ((P_INDEXPAGE * P_PAGESIZE) + 1))
       WHERE R__ >= (((P_INDEXPAGE - 1) * P_PAGESIZE) + 1);
  
  END GET_SETTLEMENT_INSTRUC_REC;
  --======================================================================================================
  --                       PROCEDURES -- POST_UPDATED_SETTLEMNT_INTRUC ---
  --======================================================================================================   
  PROCEDURE POST_UPDATED_SETTLEMNT_INTRUC(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                          P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                          P_RECORD_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT *
        FROM MERCHANT_SETTLEMNT_INSTRUC
       WHERE IS_PUSHED = 0
         AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE)
         AND NEW_BANK_NAME = P_BANK_NAME
       ORDER BY 1 DESC;
  
  END POST_UPDATED_SETTLEMNT_INTRUC;

  --======================================================================================================
  --                       PROCEDURES -- UPDATE_BANK_REGISTER_BANK_ID ---
  --======================================================================================================  
  PROCEDURE UPDATE_SETTLEMENT_SAVED_INSTRUC(P_BANK_ACC_ID BANK_REGISTER.BANK_ACCOUNT_ID%TYPE,
                                            P_TRANS_ID    BANK_REGISTER.TRANSACTION_ID%TYPE,
                                            P_TRANS_DATE  BANK_REGISTER.TRANSACTION_DATE%TYPE) IS
  BEGIN
    UPDATE BANK_REGISTER BR
       SET --BR.BANK_ACCOUNT_ID      = P_BANK_ACC_ID,
                          BR.POST = 1,
           BR.BANK_ACCT_ACTSTAT_ID = NULL
     WHERE TRANSACTION_ID = P_TRANS_ID
       AND TRUNC(TRANSACTION_DATE) = TRUNC(P_TRANS_DATE)
       AND BANK_ACCT_ACTIVITY_ID IN  (14, 13,20);
  
    UPDATE MERCHANT_SETTLEMNT_INSTRUC
       SET IS_PUSHED = 1
     WHERE TRANS_ID = P_TRANS_ID
       AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE);
    COMMIT;
  END UPDATE_SETTLEMENT_SAVED_INSTRUC;

  --======================================================================================================
  --                       PROCEDURES -- GET_SETTLEMENT_INSTRUCTIONS_FOR-REPUSH ---
  --======================================================================================================      

  PROCEDURE GET_SETTLEMENT_REPUSH_INSTRUCTION(P_TRANS_DATE  IN BANK_REGISTER.POST_XFR_RESPONSE_DATE%TYPE,
                                              P_MERCHANT_ID IN BANK_REGISTER.ENTITY_ID%TYPE,
                                              P_INDEXPAGE   IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                              P_PAGESIZE    IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                              P_RECORD_LIST OUT SYS_REFCURSOR)
  
   IS
  BEGIN
    OPEN P_RECORD_LIST FOR
    --TO SHARE THE DATA OF FAILED INSTRUCTIONS:
      SELECT *
        FROM (SELECT A.*, ROWNUM R__
                FROM (SELECT BR.TRANSACTION_DATE as Trans_date,
                             BR.TRANSACTION_ID as Trans_Id,
                             BR.AMOUNT as Amount,
                             BR.NARRATION as Narration,
                             BA.ACCOUNT_NUMBER Frm_Account,
                             BA.ACCOUNT_TITLE Account_Title,
                             CBA.ACCOUNT_NUMBER To_Account_Number,
                             CBA.ACCOUNT_TITLE Bene_Acc_Title,
                             CBB.SORT_CODE Bene_Bank_Code,
                             CBB.BANK_BRANCH_CODE DEST_SORT_CODE,
                             GPB.GIP_ROUTING_CODE,
                             COUNT(*) OVER() TOTAL_RECORDS
                        FROM BANK_REGISTER BR,
                             BANK_ACCOUNT  BA,
                             BANK_ACCOUNT  CBA,
                             BANK_BRANCH   CBB,
                             MERCHANT_SETTLEMNT_INSTRUC MSL,
                             GIP_BANKS_ROUTING_CODES GPB
                       WHERE BR.BANK_ACCOUNT_ID = BA.BANK_ACCOUNT_ID
                         AND BR.CONTRA_BANK_ACCOUNT_ID = CBA.BANK_ACCOUNT_ID
                         AND CBA.BANK_BRANCH_ID = CBB.BANK_BRANCH_ID
                         AND BR.BANK_ACCT_ACTIVITY_ID IN (14, 13,20)
                         AND BR.POST = 1
                         AND BR.POST_XFR_RESPONSE_STATUS_CODE = 0 -- FAILED CASE
                         AND BR.BANK_ACCT_ACTSTAT_ID <> 3
                         AND CBB.BANK_ID = GPB.BANK_ID(+)
                      --   AND BR.TRANSACTION_ID NOT IN
                      --       (SELECT MS.TRANS_ID
                      --         FROM MERCHANT_SETTLEMNT_INSTRUC MS)
                      --              WHERE TRUNC(MS.TRANS_DATE) = P_TRANS_DATE)
                      -- MANUALLY MARK INSTRUCTIONS
                      
                      --    AND MSL.TRANS_ID <> BR.TRANSACTION_ID
                        --  AND MSL.IS_PUSHED = 0
                     -- AND TRUNC(BR.POST_XFR_RESPONSE_DATE) = '16-JUL-2021'
                      AND TRUNC(BR.POST_XFR_RESPONSE_DATE) = TRUNC(P_TRANS_DATE)
                      --   AND BR.ENTITY_ID = P_MERCHANT_ID
                       ORDER BY 1 DESC) A
               WHERE ROWNUM < ((P_INDEXPAGE * P_PAGESIZE) + 1))
       WHERE R__ >= (((P_INDEXPAGE - 1) * P_PAGESIZE) + 1);
  
  END GET_SETTLEMENT_REPUSH_INSTRUCTION;

  --======================================================================================================
  --                       PROCEDURES -- GET_FAILED_MERCH_LIST ---
  --======================================================================================================
  PROCEDURE GET_FAILED_MERCH_LIST(P_DATE          BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                  P_MERCHANT_LIST OUT SYS_REFCURSOR) IS
  BEGIN
  
    OPEN P_MERCHANT_LIST FOR
    
      SELECT CBA.ENTITY_ID MERCHANT_ENTITY_ID,
             E.ENTITY_CODE || '-' || E.ENTITY_FIRST_NAME MERCHANT_NAME
        FROM BANK_REGISTER BR,
             BANK_ACCOUNT  BA,
             BANK_ACCOUNT  CBA,
             BANK_BRANCH   CBB,
             ENTITY        E
       WHERE BR.BANK_ACCOUNT_ID = BA.BANK_ACCOUNT_ID
         AND BR.CONTRA_BANK_ACCOUNT_ID = CBA.BANK_ACCOUNT_ID
         AND CBA.BANK_BRANCH_ID = CBB.BANK_BRANCH_ID
         AND CBA.ENTITY_ID = E.ENTITY_ID
         AND BR.BANK_ACCT_ACTIVITY_ID IN (14, 13,20)
         AND BR.POST = 1
         AND BR.POST_XFR_RESPONSE_STATUS_CODE = 0 -- FAILED CASE
         AND BR.BANK_ACCT_ACTSTAT_ID <> 3 -- MANUALLY MARK INSTRUCTIONS
            --  AND TRUNC(BR.TRANSACTION_DATE)=TRUNC(P_DATE)
         AND TRUNC(BR.POST_XFR_RESPONSE_DATE) = '16-JUL-2021'
       GROUP BY CBA.ENTITY_ID, E.ENTITY_CODE || '-' || E.ENTITY_FIRST_NAME
       ORDER BY 1;
  
  END GET_FAILED_MERCH_LIST;

  --======================================================================================================
  --                       PROCEDURES -- GET_INSTRUCTIONS_STATUS_LIST ---
  --======================================================================================================
  PROCEDURE GET_INSTRUCTIONS_STATUS_LIST(P_INS_DATE          IN BANK_REGISTER.POST_XFR_RESPONSE_DATE%TYPE,
                                         P_INDEXPAGE         IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                         P_PAGESIZE          IN BANK_REGISTER.TRANSACTION_ID%TYPE,
                                         P_STATUS            IN BANK_REGISTER_BATCH_DETAIL.STATUS%TYPE,
                                         P_TYPE              IN BANK_REGISTER.BANK_ACCT_ACTIVITY_ID%TYPE,
                                         P_INSTRUCTIONS_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    --TO SHARE THE DATA OF FAILED INSTRUCTIONS:
    --  SELECT *
    --  FROM (SELECT A.*, ROWNUM R__
    --           FROM ( 
    IF P_TYPE IN (14, 13) THEN
      OPEN P_INSTRUCTIONS_LIST FOR
        SELECT BR.TRANSACTION_DATE AS TRANS_DATE,
               BR.TRANSACTION_ID AS TRANS_ID,
               BR.AMOUNT,
               BR.NARRATION,
               BA.ACCOUNT_NUMBER FRM_ACCOUNT,
               BA.ACCOUNT_TITLE ACCOUNT_TITLE,
               CBA.ACCOUNT_NUMBER TO_ACCOUNT_NUMBER,
               CBA.ACCOUNT_TITLE BENE_ACC_TITLE,
               CBB.SORT_CODE DEST_SORT_CODE,
               CBB.BANK_BRANCH_CODE DEST_BANK_BRANCH_CODE,
               BR.POST_XFR_RESPONSE_STATUS_DESC,
               COUNT(*) OVER() TOTAL_RECORDS
          FROM BANK_REGISTER BR,
               BANK_ACCOUNT  BA,
               BANK_ACCOUNT  CBA,
               BANK_BRANCH   CBB
         WHERE BR.BANK_ACCOUNT_ID = BA.BANK_ACCOUNT_ID
           AND BR.CONTRA_BANK_ACCOUNT_ID = CBA.BANK_ACCOUNT_ID
           AND CBA.BANK_BRANCH_ID = CBB.BANK_BRANCH_ID
           AND BR.BANK_ACCT_ACTIVITY_ID IN (14, 13,20) --P_TYPE -- TYPE OF ACTIVITY
           AND BR.POST = 1
              /* AND EXISTS
              (SELECT *
               FROM BANK_REGISTER_BATCH_DETAIL BD
               WHERE BD.STATUS = P_STATUS --STATUS OF INTRUCTIONS 0 FOR FAILED
               AND BD.BANK_REGISTER_TRANS_ID = BR.TRANSACTION_ID)*/
           and br.post_xfr_response_status_code = P_STATUS
           AND TRUNC(BR.POST_XFR_RESPONSE_DATE) = TRUNC(P_INS_DATE)
         ORDER BY TRANSACTION_ID DESC; --) A
      /*ELSIF P_TYPE=17 
      THEN
      OPEN P_INSTRUCTIONS_LIST FOR  
      SELECT 
              BR.TRANSACTION_ID TRANS_ID,
              BR.TRANSACTION_DATE TRANS_DATE,
              BR.AMOUNT,
              BR.NARRATION,
              NULL FRM_ACCOUNT,
              NULL ACCOUNT_TITLE,
              NULL TO_ACCOUNT_NUMBER,
              NULL BENE_ACC_TITLE,
              NULL DEST_SORT_CODE,
              NULL DEST_BANK_BRANCH_CODE,
              BR.POST_XFR_RESPONSE_STATUS_DESC,
              COUNT(*) OVER() TOTAL_RECORDS
       FROM BANK_REGISTER BR WHERE BR.BANK_ACCT_ACTIVITY_ID=17 
       and br.post_xfr_response_status_code = P_STATUS
       AND TRUNC(BR.POST_XFR_RESPONSE_DATE)=TRUNC(P_INS_DATE)
       ORDER BY 1 DESC;  */
    ELSE
      IF P_STATUS = 1 THEN
        OPEN P_INSTRUCTIONS_LIST FOR
          SELECT RFG.TRANSACTION_ID TRANS_ID,
                 RFG.TRANSACTION_DATE TRANS_DATE,
                 RFG.AMOUNT_FCY AMOUNT,
                 RFG.REMARKS || ' ' || E.ENTITY_CODE NARRATION,
                 NULL FRM_ACCOUNT,
                 NULL ACCOUNT_TITLE,
                 NULL TO_ACCOUNT_NUMBER,
                 NULL BENE_ACC_TITLE,
                 NULL DEST_SORT_CODE,
                 NULL DEST_BANK_BRANCH_CODE,
                 'SUCCESS' POST_XFR_RESPONSE_STATUS_DESC,
                 COUNT(*) OVER() TOTAL_RECORDS
            FROM REMITT_ENTITY_FUNDS_RECPT_REG RFG, ENTITY E
           WHERE RFG.MAIN_ENTITY_ID = E.ENTITY_ID
             AND TRUNC(RFG.TRANSACTION_DATE) = TRUNC(P_INS_DATE)
             AND RFG.REMARKS LIKE '%SETTLEMENT%'
           ORDER BY 1 DESC;
      END IF;
    END IF;
  
  END GET_INSTRUCTIONS_STATUS_LIST;
  --======================================================================================================
  --                       PROCEDURES -- ADD_SETTLEMENT_UPDATED_INSTRUC_REC ---
  --======================================================================================================
  PROCEDURE ADD_SETTLEMENT_REPUSH_INSTRUC_REC( --P_RECORD_ID MERCHANT_SETTLEMNT_INSTRUC.RECORD_ID%TYPE,
                                              P_TRANS_DATE           MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                              P_TRNAS_ID             MERCHANT_SETTLEMNT_INSTRUC.TRANS_ID%TYPE,
                                              P_AMOUNT               MERCHANT_SETTLEMNT_INSTRUC.AMOUNT%TYPE,
                                              P_NARRATION            MERCHANT_SETTLEMNT_INSTRUC.NARRATION%TYPE,
                                              P_OLD_FRM_ACCOUNT      MERCHANT_SETTLEMNT_INSTRUC.OLD_FRM_ACCOUNT%TYPE,
                                              P_OLD_ACC_TITLE        MERCHANT_SETTLEMNT_INSTRUC.OLD_ACC_TITLE%TYPE,
                                              P_TO_ACC_NUMBER        MERCHANT_SETTLEMNT_INSTRUC.TO_ACC_NUMBER%TYPE,
                                              P_BENE_ACC_TITLE       MERCHANT_SETTLEMNT_INSTRUC.BENE_ACC_TITLE%TYPE,
                                              P_BENE_BANK_CODE       MERCHANT_SETTLEMNT_INSTRUC.BENE_BANK_CODE%TYPE,
                                              P_BENE_BANK_SWIFT_CODE MERCHANT_SETTLEMNT_INSTRUC.BENE_BANK_SWIFT_CODE%TYPE,
                                              P_NEW_FRM_ACC          MERCHANT_SETTLEMNT_INSTRUC.NEW_FRM_ACC%TYPE,
                                              P_NEW_BANK_NAME        MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                              P_AVAILABLE_BAL        MERCHANT_SETTLEMNT_INSTRUC.AVAILABLE_BALANCE%TYPE,
                                              P_ENTITY_ID            MERCHANT_SETTLEMNT_INSTRUC.ENTITY_ID%TYPE,
                                              P_REPUSH_TYPE          MERCHANT_SETTLEMNT_INSTRUC.REPUSH_TYPE%TYPE,
                                              P_IS_PUSHED            MERCHANT_SETTLEMNT_INSTRUC.IS_PUSHED%TYPE,
                                              P_IS_REPUSHED          MERCHANT_SETTLEMNT_INSTRUC.IS_REPUSHED%TYPE,
                                              P_OP_LOG               IN OUT VARCHAR2, --USER_OP_LOG_TYPE,
                                              P_RECORD_ID            OUT NUMBER) --,
    -- P_RECORD_ID OUT SYS_REFCURSOR)
  
   IS
  
    V_COUNT       NUMBER(3) := 0;
    V_OP_LOG_TYPE USER_OP_LOG_TYPE := USER_OP_LOG_TYPE(NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL);
  BEGIN
    FORMAT_N_GENERATE_LOG(P_OP_LOG, V_OP_LOG_TYPE);
    --   OPEN P_RECORD_ID
    SELECT COUNT(*)
      INTO V_COUNT
      FROM MERCHANT_SETTLEMNT_INSTRUC O
     WHERE O.TRANS_ID = P_TRNAS_ID
       AND IS_REPUSHED = 1;
  
    IF (V_COUNT > 0) THEN
      SELECT COUNT(*)
        INTO V_COUNT
        FROM MERCHANT_SETTLEMNT_INSTRUC O
       WHERE O.TRANS_ID = P_TRNAS_ID
         AND IS_REPUSHED = 1;
    ELSE
    
      INSERT INTO MERCHANT_SETTLEMNT_INSTRUC
        (TRANS_DATE,
         TRANS_ID,
         AMOUNT,
         NARRATION,
         OLD_FRM_ACCOUNT,
         OLD_ACC_TITLE,
         TO_ACC_NUMBER,
         BENE_ACC_TITLE,
         BENE_BANK_CODE,
         BENE_BANK_SWIFT_CODE,
         NEW_FRM_ACC,
         NEW_BANK_NAME,
         IS_PUSHED,
         AVAILABLE_BALANCE,
         ENTITY_ID,
         IS_REPUSHED,
         REPUSH_TYPE)
      VALUES
        (P_TRANS_DATE,
         P_TRNAS_ID,
         P_AMOUNT,
         P_NARRATION,
         P_OLD_FRM_ACCOUNT,
         P_OLD_ACC_TITLE,
         P_TO_ACC_NUMBER,
         P_BENE_ACC_TITLE,
         P_BENE_BANK_CODE,
         P_BENE_BANK_SWIFT_CODE,
         P_NEW_FRM_ACC,
         P_NEW_BANK_NAME,
         P_IS_PUSHED,
         P_AVAILABLE_BAL,
         P_ENTITY_ID,
         P_IS_REPUSHED,
         P_REPUSH_TYPE);
    END IF;
    SELECT TRANS_ID
      INTO P_RECORD_ID
      FROM MERCHANT_SETTLEMNT_INSTRUC
     ORDER BY 1 DESC OFFSET 0 ROWS
     FETCH NEXT 1 ROWS ONLY;
  END ADD_SETTLEMENT_REPUSH_INSTRUC_REC;
  --======================================================================================================
  --                       PROCEDURES -- UPDATE_MANUAL_SET_SAVED_INSTRUC ---
  --======================================================================================================  
  PROCEDURE UPDATE_MANUAL_SET_SAVED_INSTRUC(P_TRANS_ID   BANK_REGISTER.TRANSACTION_ID%TYPE,
                                            P_TRANS_DATE BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                            P_BATCH_NO   MERCHANT_SETTLEMNT_INSTRUC.BATCH_NO%TYPE) IS
  BEGIN
  
    UPDATE BANK_REGISTER BR
       SET BR.BANK_ACCT_ACTSTAT_ID          = 3,
           BR.POST                          = 1,
           BR.VALUE_DATE                    = SYSDATE,
           BR.POST_XFR_RESPONSE_DATE        = SYSDATE,
           BR.POST_XFR_RESPONSE_STATUS_CODE = 1,
           BR.POST_XFR_RESPONSE_STATUS_DESC = 'MANUALLY MARKED' || ' ' ||
                                              BR.POST_XFR_RESPONSE_STATUS_DESC
     WHERE BR.TRANSACTION_ID = P_TRANS_ID
       AND BR.BANK_ACCT_ACTIVITY_ID in  (14,20);
  
    UPDATE MERCHANT_SETTLEMNT_INSTRUC
       SET IS_PUSHED      = 1,
           IS_REPUSHED    = 1,
           REPUSH_TYPE    = 'MANUALLY MARKED',
           STATUS_CODE    = 1,
           STATUS_MESSAGE = 'Transaction Successful',
           IS_PROCESSED   = 1,
           BATCH_NO       = P_BATCH_NO,
           PUSHED_COUNT   = NVL(PUSHED_COUNT, 0) + 1
     WHERE TRANS_ID = P_TRANS_ID
       AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE);
       
     UPDATE BANK_REGISTER_BATCH_DETAIL DD
       SET DD.STATUS=1,
           DD.STATUS_DESC='MANUALLY MARKED'||'-'||DD.STATUS_DESC
        WHERE DD.BANK_REGISTER_TRANS_ID = P_TRANS_ID
         AND DD.STATUS=0;  
  
    COMMIT;
  END UPDATE_MANUAL_SET_SAVED_INSTRUC;
  --======================================================================================================
  --                       PROCEDURES -- POST_UPDATED_SETTLEMNT_INTRUC_REPUSH ---
  --======================================================================================================   
  PROCEDURE POST_UPDATED_SETTLEMNT_INTRUC_REPUSH(P_TRANS_DATE    MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                                 P_BANK_NAME     MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                                 p_Repush_Status MERCHANT_SETTLEMNT_INSTRUC.REPUSH_TYPE%TYPE,
                                                 P_RECORD_LIST   OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT *
        FROM MERCHANT_SETTLEMNT_INSTRUC
       WHERE REPUSH_TYPE = p_Repush_Status
         AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE)
         AND NEW_BANK_NAME = P_BANK_NAME
       ORDER BY 1 DESC;
  
  END POST_UPDATED_SETTLEMNT_INTRUC_REPUSH;
  --======================================================================================================
  --                       PROCEDURES -- POST_UPDATED_SETTLEMNT_INTRUC_REPUSH ---
  --======================================================================================================   
  PROCEDURE UPDATE_SETTLEMENT_REPUSH_REC(P_TRANS_ID IN VARCHAR2) IS
  BEGIN
    --UPDATE NEW IDS AND PUSH AGAIN  
    delete from bank_register_batch_detail d
     where d.status in (0, 3)
       and d.bank_register_trans_id IN
          --d.bank_register_trans_id in
           (SELECT REGEXP_SUBSTR(P_TRANS_ID, '[^,]+', 1, LEVEL)
              FROM DUAL
            CONNECT BY REGEXP_SUBSTR(P_TRANS_ID, '[^,]+', 1, LEVEL) IS NOT NULL);
    /*(
    SELECT br.transaction_id FROM BANK_REGISTER BR
                                                   WHERE BR.POST_XFR_RESPONSE_STATUS_CODE = 0
                                                     AND BR.BANK_ACCT_ACTIVITY_ID = 14
                                                    -- AND TRUNC(BR.POST_XFR_RESPONSE_DATE) = '13-mar-2022'
                                                     AND BR.BANK_ACCT_ACTSTAT_ID != 3
                                                     AND TRANSACTION_ID = 2179624
    );*/
  
    DECLARE
      V_BANK_REG_TRANS_ID  BANK_REGISTER.TRANSACTION_ID%TYPE := NULL;
      V_MERCH_TRANS_REG_ID MERCHANT_TRANSACTION_REG.TRANSACTION_ID%TYPE := NULL;
    BEGIN
    
      FOR I_INDEX IN (SELECT *
                        FROM BANK_REGISTER BR
                       WHERE BR.TRANSACTION_ID IN
                             (SELECT REGEXP_SUBSTR(P_TRANS_ID,
                                                   '[^,]+',
                                                   1,
                                                   LEVEL)
                                FROM DUAL
                              CONNECT BY REGEXP_SUBSTR(P_TRANS_ID,
                                                       '[^,]+',
                                                       1,
                                                       LEVEL) IS NOT NULL) /*(SELECT br.transaction_id
                                                                      FROM BANK_REGISTER BR
                                                                     WHERE BR.POST_XFR_RESPONSE_STATUS_CODE = 0
                                                                       AND BR.BANK_ACCT_ACTIVITY_ID = 14
                                                                      -- AND TRUNC(BR.POST_XFR_RESPONSE_DATE) = '13-mar-2022'
                                                                       AND BR.BANK_ACCT_ACTSTAT_ID != 3
                                                                       AND TRANSACTION_ID = 2179624)*/
                      ) LOOP
      
        V_BANK_REG_TRANS_ID := BANK_REGISTER_SEQ.NEXTVAL;
        DBMS_OUTPUT.PUT_LINE('OldID =' || I_INDEX.TRANSACTION_ID ||
                             ', NewID = ' || V_BANK_REG_TRANS_ID);
        BEGIN
          SELECT R.TRANSACTION_ID
            INTO V_MERCH_TRANS_REG_ID
            FROM MERCHANT_TRANSACTION_REG R
           WHERE R.BANK_REG_TRANS_ID = I_INDEX.TRANSACTION_ID;
        
          UPDATE MERCHANT_TRANSACTION_REG R
             SET R.BANK_REG_TRANS_ID = NULL
           WHERE R.BANK_REG_TRANS_ID = I_INDEX.TRANSACTION_ID;
        
          UPDATE BANK_REGISTER BR
             SET BR.TRANSACTION_ID       = V_BANK_REG_TRANS_ID,
                 BR.BANK_ACCT_ACTSTAT_ID = NULL,
                 BR.VALUE_DATE           = NULL,
                 BR.BATCH_NO             = NULL
           WHERE BR.TRANSACTION_ID = I_INDEX.TRANSACTION_ID;
          UPDATE MERCHANT_TRANSACTION_REG R
             SET R.BANK_REG_TRANS_ID = V_BANK_REG_TRANS_ID
           WHERE R.TRANSACTION_ID = V_MERCH_TRANS_REG_ID;
        
          update MERCHANT_SETTLEMNT_INSTRUC MSI
             SET MSI.TRANS_ID_NEW = V_BANK_REG_TRANS_ID
           WHERE MSI.TRANS_ID = I_INDEX.TRANSACTION_ID;
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
          
            UPDATE BANK_REGISTER BR
               SET BR.TRANSACTION_ID       = V_BANK_REG_TRANS_ID,
                   BR.BANK_ACCT_ACTSTAT_ID = NULL,
                   BR.VALUE_DATE           = NULL,
                   BR.BATCH_NO             = NULL
             WHERE BR.TRANSACTION_ID = I_INDEX.TRANSACTION_ID;
          
        END;
      END LOOP;
    END;
  END UPDATE_SETTLEMENT_REPUSH_REC;

  --======================================================================================================
  --                       PROCEDURES -- UPDATE_BANK_REGISTER_BANK_ID ---
  --======================================================================================================
  PROCEDURE UPDATE_SETTLEMENT_SAVED_INSTRUC_GIPS(P_BANK_ACC_ID BANK_REGISTER.BANK_ACCOUNT_ID%TYPE,
                                                 P_TRANS_ID    BANK_REGISTER.TRANSACTION_ID%TYPE,
                                                 P_TRANS_DATE  BANK_REGISTER.TRANSACTION_DATE%TYPE) IS
  BEGIN
    UPDATE BANK_REGISTER BR
       SET BR.BANK_ACCOUNT_ID       = P_BANK_ACC_ID,
           BR.POST                  = 1,
           BR.BANK_ACCT_ACTSTAT_ID  = NULL,
           BR.BANK_ACCT_ACTIVITY_ID = 20
     WHERE BR.TRANSACTION_ID = P_TRANS_ID
       AND TRUNC(BR.TRANSACTION_DATE) = TRUNC(P_TRANS_DATE)
       AND BR.BANK_ACCT_ACTIVITY_ID IN (14, 13,20);
    UPDATE MERCHANT_SETTLEMNT_INSTRUC
       SET IS_PROCESSED = 1
     WHERE TRANS_ID = P_TRANS_ID
       AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE);
    /*    UPDATE MERCHANT_SETTLEMNT_INSTRUC
           SET IS_PUSHED = 1
         WHERE TRANS_ID = P_TRANS_ID 
         AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE);
    */
    COMMIT;
  END UPDATE_SETTLEMENT_SAVED_INSTRUC_GIPS;
  --======================================================================================================
  --                       PROCEDURES -- GET SETTLEMENT INSTRUCTION JOB STATUS
  --======================================================================================================
  PROCEDURE GET_SETTLEMENT_JOB_INFO(P_DATE       IN DATE,
                                    P_STATUS_ID  OUT NUMBER,
                                    P_STATUS_MSG OUT VARCHAR2) IS
    V_SETTLEMENT_DATE DATE := NULL;
    V_LAST_DATE       DATE := NULL;
  BEGIN
    SELECT T.SETTLEMENT_DATE, T.LAST_SETTLEMENT_DATE
      INTO V_SETTLEMENT_DATE, V_LAST_DATE
      FROM SETTLEMENT_TYPE T
     WHERE T.SETTLEMENT_TYPE_ID IN (1)
       AND T.SETTLEMENT_DATE = TRUNC(P_DATE);
  
    IF V_SETTLEMENT_DATE = V_LAST_DATE AND
       TRUNC(P_DATE) = V_SETTLEMENT_DATE THEN
      P_STATUS_ID  := 1;
      P_STATUS_MSG := 'All Instructions Completed';
    ELSIF V_LAST_DATE < V_SETTLEMENT_DATE THEN
      P_STATUS_ID  := 2;
      P_STATUS_MSG := 'Instructions creation Inprogress';
    ELSE
      P_STATUS_ID  := 0;
      P_STATUS_MSG := 'Instructions Process not executed';
    END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      P_STATUS_ID  := 0;
      P_STATUS_MSG := 'Instructions Process not executed';
  END GET_SETTLEMENT_JOB_INFO;
  --======================================================================================================
  --                       PROCEDURES -- UPDATE_BANK_REGISTER_&_MERCHANT_SETTLEMENT ---
  --======================================================================================================
  PROCEDURE UPDATE_SETTLEMENT_INSTRUCTION_GIP(P_BANK_ACC_ID    BANK_REGISTER.BANK_ACCOUNT_ID%TYPE,
                                              P_TRANS_ID       BANK_REGISTER.TRANSACTION_ID%TYPE,
                                              P_TRANS_DATE     BANK_REGISTER.TRANSACTION_DATE%TYPE,
                                              P_STATUS_CODE    MERCHANT_SETTLEMNT_INSTRUC.STATUS_CODE%TYPE,
                                              P_STATUS_MESSAGE MERCHANT_SETTLEMNT_INSTRUC.STATUS_MESSAGE%TYPE,
                                              P_PUSHED_COUNT   MERCHANT_SETTLEMNT_INSTRUC.PUSHED_COUNT%TYPE) IS
  BEGIN
  
    UPDATE MERCHANT_SETTLEMNT_INSTRUC
       SET IS_PUSHED      = 1,
           STATUS_CODE    = p_STATUS_CODE,
           STATUS_MESSAGE = p_STATUS_MESSAGE,
           PUSHED_COUNT   = NVL(PUSHED_COUNT, 0) + P_PUSHED_COUNT
     WHERE TRANS_ID = P_TRANS_ID
       AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE);
  
    COMMIT;
  END UPDATE_SETTLEMENT_INSTRUCTION_GIP;
  --======================================================================================================
  --                       PROCEDURES -- STOP_BATCH_PROCESSING ---
  --======================================================================================================   
  PROCEDURE STOP_BATCH_PROCESSING(P_TRANS_DATE MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                  P_BANK_NAME  MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE) IS
  BEGIN
  
    UPDATE MERCHANT_SETTLEMNT_INSTRUC
       SET IS_PROCESSED = 2
     WHERE IS_PROCESSED = 1
       AND STATUS_CODE IS NULL
       AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE)
       AND NEW_BANK_NAME = P_BANK_NAME;
  
  END STOP_BATCH_PROCESSING;
  --======================================================================================================
  --                       PROCEDURES -- VALIDATE_INSTRUCTION ---
  --======================================================================================================
  PROCEDURE VALIDATE_REPUSH_INSTRUCTION(P_TRANS_ID IN VARCHAR2,
                                        P_RESULT   OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RESULT FOR
      SELECT B.POST_XFR_RESPONSE_STATUS_CODE,
             B.POST_XFR_RESPONSE_STATUS_DESC,
             B.TRANSACTION_ID
        FROM BANK_REGISTER B
       WHERE (B.TRANSACTION_ID IN
             (SELECT TO_NUMBER(REGEXP_SUBSTR(P_TRANS_ID, '[^,]+', 1, LEVEL))
                 FROM DUAL
               CONNECT BY REGEXP_SUBSTR(P_TRANS_ID, '[^,]+', 1, LEVEL) IS NOT NULL))
            -- B.TRANSACTION_ID IN (2318545,2363794)
         AND B.POST_XFR_RESPONSE_STATUS_CODE = 0
         AND B.POST_XFR_RESPONSE_STATUS_DESC IS NOT NULL
         AND B.BANK_ACCT_ACTIVITY_ID IN (14, 13,20)
       ORDER BY B.TRANSACTION_ID DESC;
  END;

  --======================================================================================================
  --                       PROCEDURES -- DELETE_INSTRUCTION ---
  --======================================================================================================
  PROCEDURE DELETE_INSTRUCTION(P_TRANSACTION_ID IN MERCHANT_SETTLEMNT_INSTRUC.TRANS_ID%TYPE) IS
  BEGIN
    DELETE FROM MERCHANT_SETTLEMNT_INSTRUC
     WHERE TRANS_ID = P_TRANSACTION_ID;
  END;
  --======================================================================================================
  --                       PROCEDURES -- GET_PROCESSED_BATCH_INSTRUCTIONS_LIST ---
  --======================================================================================================   
  PROCEDURE GET_PROCESSED_BATCH_INSTRUCTIONS_LIST(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                                  P_BATCH_NO    MERCHANT_SETTLEMNT_INSTRUC.BATCH_NO%TYPE,
                                                  P_RECORD_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT *
        FROM MERCHANT_SETTLEMNT_INSTRUC
       WHERE --TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE) AND 
       BATCH_NO = P_BATCH_NO
       ORDER BY 1 DESC;
  
  END GET_PROCESSED_BATCH_INSTRUCTIONS_LIST;
  --======================================================================================================
  --                       PROCEDURES -- GET_UPDATED_SETTLEMNT_INTRUC_BY_ID ---
  --======================================================================================================   
  PROCEDURE GET_UPDATED_SETTLEMNT_INTRUC_BY_ID(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                               P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                               P_TXN_ID      MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                               P_RECORD_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT *
        FROM MERCHANT_SETTLEMNT_INSTRUC
       WHERE IS_PUSHED IN (0, 1)
         AND IS_PROCESSED = 1
            --AND STATUS_CODE IS NOT NULL
         AND TRANS_ID = P_TXN_ID
         AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE)
         AND NEW_BANK_NAME = P_BANK_NAME
       ORDER BY 1 DESC;
  
  END GET_UPDATED_SETTLEMNT_INTRUC_BY_ID;
  --======================================================================================================
  --                       PROCEDURES -- GET_UPDATED_SETTLEMNT_INTRUC_BY_BATCH ---
  --======================================================================================================   
  PROCEDURE GET_UPDATED_SETTLEMNT_INTRUC_BY_BATCH(P_TRANS_DATE MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                                  --P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                                  P_BATCH_NO    MERCHANT_SETTLEMNT_INSTRUC.BATCH_NO%TYPE,
                                                  P_RECORD_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT *
        FROM MERCHANT_SETTLEMNT_INSTRUC
       WHERE IS_PUSHED IN (0, 1)
         AND IS_PROCESSED = 1
         AND NVL(STATUS_CODE, 0) != 1
            --AND TRANS_ID = P_TXN_ID
            --AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE)
            --AND NEW_BANK_NAME = P_BANK_NAME
         AND BATCH_NO = P_BATCH_NO
       ORDER BY 1 DESC;
  
  END GET_UPDATED_SETTLEMNT_INTRUC_BY_BATCH;
  --======================================================================================================
  --                       PROCEDURES -- GET_UPDATED_REPUSH_SETTLEMNT_INTRUC ---
  --======================================================================================================   
  PROCEDURE GET_UPDATED_REPUSH_SETTLEMNT_INTRUC(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                                P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                                P_RECORD_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT *
        FROM MERCHANT_SETTLEMNT_INSTRUC
       WHERE IS_PUSHED IN (1)
            --AND IS_PROCESSED IN (1)
            --AND STATUS_CODE != 1
         AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE)
         AND NEW_BANK_NAME = P_BANK_NAME -- 'Gips Bank'
       ORDER BY 1 DESC;
  
  END GET_UPDATED_REPUSH_SETTLEMNT_INTRUC;
  --======================================================================================================
  --                       PROCEDURES -- UPDATE_SETTLEMENT_SAVED_INSTRUC_GIPS_REPUSH ---
  --======================================================================================================
  PROCEDURE UPDATE_SETTLEMENT_SAVED_INSTRUC_GIPS_REPUSH(P_BANK_ACC_ID BANK_REGISTER.BANK_ACCOUNT_ID%TYPE,
                                                        P_TRANS_ID    BANK_REGISTER.TRANSACTION_ID%TYPE,
                                                        P_TRANS_DATE  BANK_REGISTER.TRANSACTION_DATE%TYPE) IS
  BEGIN
    --20, 'BULK PAYMENT TO MERCHANT-GHIPSS'
    UPDATE BANK_REGISTER BR
       SET BR.BANK_ACCOUNT_ID       = P_BANK_ACC_ID,
           BR.POST                  = 1,
           BR.BANK_ACCT_ACTSTAT_ID  = NULL,
           BR.BANK_ACCT_ACTIVITY_ID = 20
     WHERE BR.TRANSACTION_ID = P_TRANS_ID
       AND TRUNC(BR.TRANSACTION_DATE) = TRUNC(P_TRANS_DATE)
       AND BR.BANK_ACCT_ACTIVITY_ID IN (14, 13,20);
  
    UPDATE MERCHANT_SETTLEMNT_INSTRUC
       SET IS_PROCESSED = 1,
           REPUSH_TYPE  = 'Re-Push Instruction',
           IS_REPUSHED  = 1,
           PUSHED_COUNT = NVL(PUSHED_COUNT, 0) + 1
     WHERE TRANS_ID = P_TRANS_ID
       AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE);
  
    --COMMIT;
  END UPDATE_SETTLEMENT_SAVED_INSTRUC_GIPS_REPUSH;
  --======================================================================================================
  --                       PROCEDURES -- POST_UPDATED_SETTLEMNT_INTRUC ---
  --======================================================================================================   
  PROCEDURE GET_UPDATED_SETTLEMNT_INTRUC(P_TRANS_DATE  MERCHANT_SETTLEMNT_INSTRUC.TRANS_DATE%TYPE,
                                         P_BANK_NAME   MERCHANT_SETTLEMNT_INSTRUC.NEW_BANK_NAME%TYPE,
                                         P_RECORD_LIST OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN P_RECORD_LIST FOR
      SELECT *
        FROM MERCHANT_SETTLEMNT_INSTRUC
       WHERE IS_PUSHED IN (0)
            -- AND IS_PROCESSED IN (1)
            -- AND STATUS_CODE is null
         AND TRUNC(TRANS_DATE) = TRUNC(P_TRANS_DATE)
         AND NEW_BANK_NAME = P_BANK_NAME
       ORDER BY 1 DESC;
  
  END GET_UPDATED_SETTLEMNT_INTRUC;

END BULK_SETTLEMENT_UTIL_EXT;
/
