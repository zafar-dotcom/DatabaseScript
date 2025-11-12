CREATE OR REPLACE PACKAGE DD_MANDATE_UTIL AS

  -- PROCEDURE DECLARATIONS
  PROCEDURE CREATE_DD_MANDATE_REQUEST(P_REQUEST_DATE           IN DATE,
                                      P_MERCHANT_ENTITY_ID     IN NUMBER,
                                      P_MERCHANT_REF_ID        IN VARCHAR2,
                                      P_NARRATION              IN VARCHAR2,
                                      P_PLATFORM_SCHEDULING    IN NUMBER,
                                      P_MOBILE                 IN VARCHAR2,
                                      P_NETWORK_ID             IN NUMBER,
                                      P_AMOUNT                 IN NUMBER,
                                      P_CURRENCY_ID            IN NUMBER,
                                      P_FREQUENCY_ID           IN NUMBER,
                                      P_START_DATE             IN DATE,
                                      P_END_DATE               IN DATE,
                                      P_DAY_OF_DEBIT           IN NUMBER,
                                      P_OVA_SERVICE_ID         IN VARCHAR2,
                                      P_OVA_SP_ID              IN VARCHAR2,
                                      P_STATUS_CODE            IN NUMBER,
                                      P_STATUS_MESSAGE         IN VARCHAR2,
                                      P_SYSTEM_REFERENCE_ID    IN VARCHAR2,
                                      P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                      P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                      P_RESPONSE_DATE          IN DATE,
                                      P_POST                   IN NUMBER,
                                      P_OP_LOG                 IN OUT VARCHAR2,
                                      P_EXISTING_REQUEST_ID    OUT NUMBER,
                                      P_RESPONSE_CODE          OUT NUMBER,
                                      P_RESPONSE_DESC          OUT VARCHAR,
                                      P_RET_OVA_SERVCEID       OUT VARCHAR2,
                                      P_RET_OVA_SPID           OUT VARCHAR2);

  PROCEDURE UPDATE_DD_MANDATE_STATUS(P_SYSTEM_REFERENCE_ID    IN VARCHAR2,
                                     P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                     P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                     P_STATUS_CODE            IN NUMBER,
                                     P_STATUS_MESSAGE         IN VARCHAR2,
                                     P_RESPONSE_DATE          IN DATE,
                                     P_OP_LOG                 IN OUT VARCHAR2,
                                     P_DD_MANDATE_CONF_ID     OUT NUMBER);

  PROCEDURE MARK_MADAPI_PREAPPROVAL_CALLBACK(P_TELCO_ENTITY_ID        IN ENTITY.ENTITY_ID%TYPE,
                                             P_SYSTEM_REFERENCE_ID    IN VARCHAR2,
                                             P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                             P_DD_RESP_JSON           IN VARCHAR2,
                                             P_STATUS_CODE            IN NUMBER,
                                             P_STATUS_MESSAGE         IN VARCHAR2,
                                             P_RESPONSE_DATE          IN DATE,
                                             P_OP_LOG                 IN OUT VARCHAR2,
                                             P_DD_MANDATE_CONF_ID     OUT NUMBER,
                                             P_DD_MANDATE_LST         OUT Sys_Refcursor
                                             );

  PROCEDURE DD_MANDATE_CANCEL_REQ(P_MANDATE_REQ_ID         IN NUMBER,
                                  P_CONFIG_ID              IN NUMBER,
                                  P_CANCELLATION_DATE      IN DATE,
                                  P_CANCELLATION_REASON    IN VARCHAR2,
                                  P_CANCELLATION_SOURCE    IN VARCHAR2,
                                  P_STATUS_CODE            IN NUMBER,
                                  P_STATUS_MESSAGE         IN VARCHAR2,
                                  P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                  P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                  P_OP_LOG                 IN OUT VARCHAR2,
                                  O_CANCELLATION_ID        OUT NUMBER,
                                  O_STATUS_MESSAGE         OUT VARCHAR2);

  PROCEDURE CANCEL_DD_MANDATE(P_MANDATE_REQ_ID          IN NUMBER,
                              P_CANCELLATION_REASON     IN VARCHAR2,
                              P_CANCELLATION_SOURCE     IN VARCHAR2,
                              P_GATEWAY_REFRENCE_ID     IN VARCHAR2,
                              P_GATEWAY_STATUS_MESSGAGE IN VARCHAR2,
                              P_OP_LOG                  IN OUT VARCHAR2,
                              P_STATUS_CODE             OUT NUMBER,
                              P_STATUS_MESSAGE          OUT VARCHAR2);

  PROCEDURE DD_MANDATE_CANCEL_UPDATE(P_CANCEL_REQ_ID          IN NUMBER,
                                     P_CONFIG_ID              IN NUMBER,
                                     P_CANCELLATION_DATE      IN DATE,
                                     P_CANCELLATION_REASON    IN VARCHAR2,
                                     P_CANCELLATION_SOURCE    IN VARCHAR2,
                                     P_STATUS_CODE            IN NUMBER,
                                     P_STATUS_MESSAGE         IN VARCHAR2,
                                     P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                     P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                     P_OP_LOG                 IN OUT VARCHAR2,
                                     O_CANCELLATION_ID        OUT NUMBER,
                                     O_STATUS_MESSAGE         OUT VARCHAR2);

  PROCEDURE GET_DD_MANDATE_DET(P_MANDATE_REQ_ID IN NUMBER,
                               P_MANDATE_DET_C  OUT SYS_REFCURSOR);

  PROCEDURE INSERT_DD_MANDATE_PAYMENT_REQ(P_MERCHANT_ENTITY IN NUMBER,
                                          P_MANDATE_REQ     IN NUMBER,
                                          P_SYSTEM_TXN      IN NUMBER,
                                          P_STATUS_CODE     OUT NUMBER,
                                          P_STATUS_MESSAGE  OUT VARCHAR2);

  PROCEDURE GET_PENDING_DD_MANDATE_REQ(P_MANDATE_DET_C OUT SYS_REFCURSOR);

  PROCEDURE GET_DD_PENDING_PAYMENTS(P_DD_PENDING_PAY_DET_C OUT SYS_REFCURSOR);

  PROCEDURE UPDATE_RECURRING_PAYMENT_AMOUNT(P_REQUEST_ID    IN DD_MANDATE_REQUEST.REQUEST_ID%TYPE,
                                            P_AMOUNT        IN DD_MANDATE_REQUEST.AMOUNT%TYPE,
                                            P_MOBILE        IN DD_MANDATE_REQUEST.MOBILE%TYPE,
                                            P_STATUS        OUT NUMBER,
                                            P_ERROR_MESSAGE OUT VARCHAR2);

  PROCEDURE FETCH_MANDATE_HISTORY(P_MERCHANT_ENTITY_ID IN NUMBER,
                                  P_MANDATE_HISTORY_C  OUT SYS_REFCURSOR);

  PROCEDURE DD_MANDATE_STATUS(P_MOBILE             IN VARCHAR2,
                              P_MANDATE_REQUEST_ID IN NUMBER,
                              P_MANDATE_ID         OUT NUMBER,
                              P_STATUS_CODE        OUT NUMBER,
                              P_STATUS_MESSAGE     OUT VARCHAR2,
                              P_DATE_GIVEN         OUT DATE,
                              P_LAST_UPDATED       OUT DATE);

  PROCEDURE CREATE_DD_RECURRING_PAYMENT( -- INPUT PARAMETERS
                                 P_MERCHANT_ENTITY_ID IN NUMBER,
                                 P_MANDATE_ID         IN NUMBER,
                                 P_AMOUNT             IN NUMBER,
                                 P_PAYMENT_MODE_ID    IN NUMBER,
                                 P_TRANSACTION_REF_ID IN VARCHAR2,
                                 P_STATUS_CODE        IN VARCHAR2,
                                 P_STATUS_MESSAGE     IN VARCHAR2,
                                 -- OUTPUT PARAMETERS
                                 O_STATUS_CODE    OUT VARCHAR2,
                                 O_STATUS_MESSAGE OUT VARCHAR2,
                                 O_CURSOR         OUT SYS_REFCURSOR);

  PROCEDURE UPDATE_DD_RECURRING_PAYMENT_STATUS(P_SYSTEM_ID                IN NUMBER,
                                               P_GATEWAY_REFERENCE_ID     IN VARCHAR2,
                                               P_STATUS_CODE              IN VARCHAR2,
                                               P_STATUS_MESSAGE           IN VARCHAR2,
                                               P_GATEWAY_STATUS_CODE      IN VARCHAR2,
                                               P_GATEWAY_STATUS_MESSAGE   IN VARCHAR2,
                                               O_PROCEDURE_STATUS_CODE    OUT VARCHAR2,
                                               O_PROCEDURE_STATUS_MESSAGE OUT VARCHAR2);

  PROCEDURE GET_DD_RECURRING_PAYMENT_STATUS(P_MANDATE_ID        IN DD_RECURRING_PAYMENT.MANDATE_ID%TYPE,
                                            P_X_TRANSACTION_REF IN DD_RECURRING_PAYMENT.X_TRANSACTION_REF%TYPE,
                                            P_SYSTEM_TXN_ID     OUT DD_RECURRING_PAYMENT.SYSTEM_TXN_ID%TYPE,
                                            P_STATUS_CODE       OUT DD_RECURRING_PAYMENT.STATUS_CODE%TYPE,
                                            P_STATUS_MESSAGE    OUT DD_RECURRING_PAYMENT.STATUS_MESSAGE%TYPE);






  PROCEDURE DD_MANDATE_STATUS_VIA_REF(
                    P_TRANSACTION_REF_ID IN  VARCHAR2,
                     P_MERCHANT_ENTITY_ID IN NUMBER,
                    P_MANDATE_ID         OUT NUMBER,
                    P_STATUS_CODE        OUT NUMBER,
                    P_STATUS_MESSAGE     OUT VARCHAR2,
                    P_DATE_GIVEN         OUT DATE,
                    P_LAST_UPDATED       OUT DATE,
                    P_MANDATE_DETAILS    OUT SYS_REFCURSOR   -- NEW OUT PARAM
                ) ;



  --------------------------------------------------------------------------
  ------------------CREATE_DD_MANDATE_WITH_PREAPPROVAL----------------------
  --------------------------------------------------------------------------
PROCEDURE CREATE_DD_MANDATE_WITH_PREAPPROVAL(
                                      P_REQUEST_DATE           IN DATE,
                                      P_PREAPPROVAL_ID IN VARCHAR2, -- NEW PARAM
                                      P_MERCHANT_ENTITY_ID     IN NUMBER,
                                      P_MERCHANT_REF_ID        IN VARCHAR2,
                                      P_NARRATION              IN VARCHAR2,
                                      P_PLATFORM_SCHEDULING    IN NUMBER,
                                      P_MOBILE                 IN VARCHAR2,
                                      P_NETWORK_ID             IN NUMBER,
                                      P_AMOUNT                 IN NUMBER,
                                      P_CURRENCY_ID            IN NUMBER,
                                      P_FREQUENCY_ID           IN NUMBER,
                                      P_START_DATE             IN DATE,
                                      P_END_DATE               IN DATE,
                                      P_DAY_OF_DEBIT           IN NUMBER,
                                      P_OVA_SERVICE_ID         IN VARCHAR2,
                                      P_OVA_SP_ID              IN VARCHAR2,
                                      P_STATUS_CODE            IN NUMBER,
                                      P_STATUS_MESSAGE         IN VARCHAR2,
                                      P_SYSTEM_REFERENCE_ID    IN VARCHAR2,
                                      P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                      P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                      P_RESPONSE_DATE          IN DATE,
                                      P_POST                   IN NUMBER,
                                      P_OP_LOG                 IN OUT VARCHAR2,
                                      P_EXISTING_REQUEST_ID    OUT NUMBER,
                                      P_RESPONSE_CODE          OUT NUMBER,
                                      P_RESPONSE_DESC          OUT VARCHAR,
                                      P_RET_OVA_SERVCEID       OUT VARCHAR2,
                                      P_RET_OVA_SPID           OUT VARCHAR2);

END DD_MANDATE_UTIL;
/
CREATE OR REPLACE PACKAGE BODY DD_MANDATE_UTIL AS

  ------------------------------------------------------------
  ----------------CREATE_DD_MANDATE_REQUEST-------------------
  ------------------------------------------------------------

  PROCEDURE CREATE_DD_MANDATE_REQUEST(P_REQUEST_DATE           IN DATE,
                                      P_MERCHANT_ENTITY_ID     IN NUMBER,
                                      P_MERCHANT_REF_ID        IN VARCHAR2,
                                      P_NARRATION              IN VARCHAR2,
                                      P_PLATFORM_SCHEDULING    IN NUMBER,
                                      P_MOBILE                 IN VARCHAR2,
                                      P_NETWORK_ID             IN NUMBER,
                                      P_AMOUNT                 IN NUMBER,
                                      P_CURRENCY_ID            IN NUMBER,
                                      P_FREQUENCY_ID           IN NUMBER,
                                      P_START_DATE             IN DATE,
                                      P_END_DATE               IN DATE,
                                      P_DAY_OF_DEBIT           IN NUMBER,
                                      P_OVA_SERVICE_ID         IN VARCHAR2,
                                      P_OVA_SP_ID              IN VARCHAR2,
                                      P_STATUS_CODE            IN NUMBER,
                                      P_STATUS_MESSAGE         IN VARCHAR2,
                                      P_SYSTEM_REFERENCE_ID    IN VARCHAR2,
                                      P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                      P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                      P_RESPONSE_DATE          IN DATE,
                                      P_POST                   IN NUMBER,
                                      P_OP_LOG                 IN OUT VARCHAR2,
                                      P_EXISTING_REQUEST_ID    OUT NUMBER,
                                      P_RESPONSE_CODE          OUT NUMBER,
                                      P_RESPONSE_DESC          OUT VARCHAR,
                                      P_RET_OVA_SERVCEID       OUT VARCHAR2,
                                      P_RET_OVA_SPID           OUT VARCHAR2) IS
    V_OP_LOG_TYPE USER_OP_LOG_TYPE := USER_OP_LOG_TYPE(NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL);

    V_MNGATEWAY_ENTITY_ID ENTITY.ENTITY_ID%TYPE := NULL;
    V_OVA_SERVICE_ID      VARCHAR2(50) := NULL;
    V_OVA_SP_ID           VARCHAR2(50) := NULL;
  BEGIN
    -- GENERATE LOG
    FORMAT_N_GENERATE_LOG(P_OP_LOG, V_OP_LOG_TYPE);

     BEGIN
      SELECT REQUEST_ID
        INTO P_EXISTING_REQUEST_ID
        FROM DD_MANDATE_REQUEST
        WHERE MERCHANT_REF_ID = P_MERCHANT_REF_ID AND MERCHANT_ENTITY_ID = P_MERCHANT_ENTITY_ID
       FETCH FIRST 1 ROWS ONLY;

      -- IF FOUND, SET THE RESPONSE AND RETURN
      P_RESPONSE_CODE := 0;
      P_RESPONSE_DESC := 'Merchant ref already exists: ' ||
                         P_MERCHANT_REF_ID;
      RETURN;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        -- NO EXISTING MANDATE FOUND, PROCEED WITH INSERTION
        P_EXISTING_REQUEST_ID := NULL;
    END;

    -- CHECK IF A MANDATE ALREADY EXISTS WITH THE SAME MERCHANT, MOBILE, AND STATUS_CODE = 1
    BEGIN
      SELECT MANDATE_ID
        INTO P_EXISTING_REQUEST_ID
        FROM DD_MANDATES
       WHERE MERCHANT_ENTITY_ID = P_MERCHANT_ENTITY_ID
         AND MOBILE = P_MOBILE
         AND STATUS_CODE = 1
       FETCH FIRST 1 ROWS ONLY;

      -- IF FOUND, SET THE RESPONSE AND RETURN
      P_RESPONSE_CODE := 2;
      P_RESPONSE_DESC := 'Already mandate exists active with Request ID: ' ||
                         P_EXISTING_REQUEST_ID;
      RETURN;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        -- NO EXISTING MANDATE FOUND, PROCEED WITH INSERTION
        P_EXISTING_REQUEST_ID := NULL;
    END;

    IF P_OVA_SERVICE_ID IS NULL THEN
      SELECT MN.ENTITY_ID
        INTO V_MNGATEWAY_ENTITY_ID
        FROM MOBILE_NETWORK MN
       WHERE MN.MOBILE_NETWORK_ID = P_NETWORK_ID;

      --GET PAYMENT MODE OVA SPID AND SERVICE ID
      SYSTEM_PROCESS_UTIL.GET_PAYMODE_ENTITY_OVA_CONFIG(P_PM_PROVIDER_ENTITY_ID => V_MNGATEWAY_ENTITY_ID,
                                                        P_MERCHANT_ENTITY_ID    => P_MERCHANT_ENTITY_ID,
                                                        P_FEE_TYPE_ID           => NULL,
                                                        P_IS_PRE_AUTH_ENABLED   => 1, --NVL(P_ISPREAUTH_ENABLED_DDRTXN,0),
                                                        P_OVA_SERVICEID         => V_OVA_SERVICE_ID,
                                                        P_OVA_SPID              => V_OVA_SP_ID);
    ELSE
      V_OVA_SERVICE_ID := P_OVA_SERVICE_ID;
      V_OVA_SP_ID      := P_OVA_SP_ID;
    END IF;

    P_RET_OVA_SERVCEID := V_OVA_SERVICE_ID;
    P_RET_OVA_SPID     := V_OVA_SP_ID;

    -- INSERT THE NEW MANDATE AND RETURN THE REQUEST_ID
    INSERT INTO DD_MANDATE_REQUEST
      (REQUEST_ID,
       REQUEST_DATE,
       MERCHANT_ENTITY_ID,
       MERCHANT_REF_ID,
       NARRATION,
       PLATFORM_SCHEDULING,
       MOBILE,
       NETWORK_ID,
       AMOUNT,
       CURRENCY_ID,
       FREQUENCY_ID,
       START_DATE,
       END_DATE,
       DAY_OF_DEBIT,
       OVA_SERVICE_ID,
       OVA_SP_ID,
       STATUS_CODE,
       STATUS_MESSAGE,
       SYSTEM_REFERENCE_ID,
       GATEWAY_REFERENCE_ID,
       GATEWAY_STATUS_MESSAGE,
       RESPONSE_DATE,
       POST,
       LOG_ID)
    VALUES
      (SEQ_DD_MANDATE_REQUEST.NEXTVAL,
       P_REQUEST_DATE,
       P_MERCHANT_ENTITY_ID,
       P_MERCHANT_REF_ID,
       P_NARRATION,
       P_PLATFORM_SCHEDULING,
       P_MOBILE,
       P_NETWORK_ID,
       P_AMOUNT,
       P_CURRENCY_ID,
       P_FREQUENCY_ID,
       P_START_DATE,
       P_END_DATE,
       P_DAY_OF_DEBIT,
       /*P_OVA_SERVICE_ID*/
       V_OVA_SERVICE_ID,
       /*P_OVA_SP_ID*/
       V_OVA_SP_ID,
       P_STATUS_CODE,
       P_STATUS_MESSAGE,
       P_SYSTEM_REFERENCE_ID,
       P_GATEWAY_REFERENCE_ID,
       P_GATEWAY_STATUS_MESSAGE,
       P_RESPONSE_DATE,
       P_POST,
       V_OP_LOG_TYPE.LOG_ID)
    RETURNING REQUEST_ID INTO P_EXISTING_REQUEST_ID;

    -- SET THE RESPONSE
    P_RESPONSE_CODE := 1;
    P_RESPONSE_DESC := 'Mandate request successfully created with Request ID: ' ||
                       P_EXISTING_REQUEST_ID;
  EXCEPTION
    WHEN OTHERS THEN
      P_RESPONSE_CODE := -1;
      P_RESPONSE_DESC := 'An error occurred: ' || SQLERRM;
  END CREATE_DD_MANDATE_REQUEST;

  ------------------------------------------------------------
  ----------------UPDATE_DD_MANDATE_STATUS--------------------
  ------------------------------------------------------------
  PROCEDURE UPDATE_DD_MANDATE_STATUS(P_SYSTEM_REFERENCE_ID    IN VARCHAR2,
                                     P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                     P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                     P_STATUS_CODE            IN NUMBER,
                                     P_STATUS_MESSAGE         IN VARCHAR2,
                                     P_RESPONSE_DATE          IN DATE,
                                     P_OP_LOG                 IN OUT VARCHAR2,
                                     P_DD_MANDATE_CONF_ID     OUT NUMBER) AS
    V_OP_LOG_TYPE USER_OP_LOG_TYPE := USER_OP_LOG_TYPE(NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL);
  BEGIN
    -- GENERATE LOG
    FORMAT_N_GENERATE_LOG(P_OP_LOG, V_OP_LOG_TYPE);

    IF P_STATUS_CODE = 1 THEN
      -- ? UPDATE DD_MANDATE_REQUEST BEFORE INSERTING INTO DD_MANDATE_CONFIG
      UPDATE DD_MANDATE_REQUEST
         SET STATUS_CODE            = P_STATUS_CODE,
             STATUS_MESSAGE         = P_STATUS_MESSAGE,
             GATEWAY_STATUS_MESSAGE = P_GATEWAY_STATUS_MESSAGE,
             GATEWAY_REFERENCE_ID   = P_GATEWAY_REFERENCE_ID,
             RESPONSE_DATE          = P_RESPONSE_DATE,
             LOG_ID                 = V_OP_LOG_TYPE.LOG_ID
       WHERE SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;

      -- ? INSERT INTO DD_MANDATE_CONFIG AFTER UPDATING DD_MANDATE_REQUEST
      P_DD_MANDATE_CONF_ID := SEQ_DD_MANDATE_CONFIG.NEXTVAL;

      INSERT INTO DD_MANDATES
        (MANDATE_ID,
         DD_CONFIG_DATE,
         MANDATE_REQ_ID,
         MERCHANT_ENTITY_ID,
         MERCHANT_REF_ID,
         MOBILE,
         NETWORK_ID,
         NARRATION,
         CURRENCY_ID,
         FREQUENCY_ID,
         NO_OF_INSTALLMENTS,
         START_DATE,
         END_DATE,
         DAY_OF_DEBIT,
         IS_PRE_AUTH_ENABLED,
         PLATFORM_SCHEDULING,
         OVA_SERVICE_ID,
         OVA_SP_ID,
         STATUS_CODE,
         STATUS_MESSAGE,
         SYSTEM_REFERENCE_ID,
         GATEWAY_REFERENCE_ID,
         GATEWAY_STATUS_MESSAGE,
         RESPONSE_DATE,
         LAST_UPDATE,
         POST,
         LOG_ID)
        SELECT P_DD_MANDATE_CONF_ID,
               SYSDATE,
               REQUEST_ID,
               MERCHANT_ENTITY_ID,
               MERCHANT_REF_ID,
               MOBILE,
               NETWORK_ID,
               NARRATION,
               CURRENCY_ID,
               FREQUENCY_ID,
               NULL,
               START_DATE,
               END_DATE,
               DAY_OF_DEBIT,
               1,
               PLATFORM_SCHEDULING,
               OVA_SERVICE_ID,
               OVA_SP_ID,
               STATUS_CODE,
               STATUS_MESSAGE,
               SYSTEM_REFERENCE_ID,
               GATEWAY_REFERENCE_ID,
               GATEWAY_STATUS_MESSAGE,
               RESPONSE_DATE,
               SYSDATE, -- LAST_UPDATE
               1,
               V_OP_LOG_TYPE.LOG_ID
          FROM DD_MANDATE_REQUEST
         WHERE SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;

    ELSE
      -- ? NO CHANGES FOR STATUS_CODE ? 1, JUST UPDATE DD_MANDATE_REQUEST
      UPDATE DD_MANDATE_REQUEST
         SET STATUS_CODE            = P_STATUS_CODE,
             STATUS_MESSAGE         = P_STATUS_MESSAGE,
             GATEWAY_STATUS_MESSAGE = P_GATEWAY_STATUS_MESSAGE,
             GATEWAY_REFERENCE_ID   = P_GATEWAY_REFERENCE_ID,
             RESPONSE_DATE          = P_RESPONSE_DATE,
             LOG_ID                 = V_OP_LOG_TYPE.LOG_ID
       WHERE SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;

      P_DD_MANDATE_CONF_ID := -1; -- NO INSERT HAPPENED
    END IF;

  END UPDATE_DD_MANDATE_STATUS;

  ------------------------------------------------------------
  ----------------UPDATE_DD_MANDATE_STATUS--------------------
  ------------------------------------------------------------
 -- OLD Procedure => new procedure
 -- P_X_REFERENCE_CODE => P_SYSTEM_REFERENCE_ID
 -- P_X_REFERENCE_TEXT=> P_GATEWAY_STATUS_MESSAGE
 -- P_STATUS_CODE=> P_STATUS_CODE
  PROCEDURE MARK_MADAPI_PREAPPROVAL_CALLBACK(P_TELCO_ENTITY_ID        IN ENTITY.ENTITY_ID%TYPE,
                                             P_SYSTEM_REFERENCE_ID    IN VARCHAR2,
                                             P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                             P_DD_RESP_JSON           IN VARCHAR2,
                                             P_STATUS_CODE            IN NUMBER,
                                             P_STATUS_MESSAGE         IN VARCHAR2,
                                             P_RESPONSE_DATE          IN DATE,
                                             P_OP_LOG                 IN OUT VARCHAR2,
                                             P_DD_MANDATE_CONF_ID     OUT NUMBER,
                                             P_DD_MANDATE_LST         OUT Sys_Refcursor
                                             ) AS

    V_OP_LOG_TYPE USER_OP_LOG_TYPE := USER_OP_LOG_TYPE(NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL);

     V_MOBILE_NETWORK_CODE MOBILE_NETWORK.MOBILE_NETWORK_CODE%TYPE := PRE_AUTH_INSECUR_PYMT_CFG_UTIL.GET_MOBILE_NETWORK_CODE(P_TELCO_ENTITY_ID);
     V_ENTITY_ID   NUMBER(12) := NULL;
     V_ROW_COUNT   NUMBER := 0;

  BEGIN
    -- Initialize output parameters
    P_DD_MANDATE_CONF_ID := NULL;

    -- GENERATE LOG
    FORMAT_N_GENERATE_LOG(P_OP_LOG, V_OP_LOG_TYPE);

    INSERT INTO DD_MANDATE_NOTIFICATION
      (INSERT_DATE, P_SYSTEM_REFERENCE_ID, NOTIFICATION_DATA)
    VALUES
      (SYSDATE, P_SYSTEM_REFERENCE_ID, P_DD_RESP_JSON);

    -- Try to find existing pre-auth request
    BEGIN
        SELECT PP.MERCHANT_ENTITY_ID
        INTO V_ENTITY_ID
        FROM PRE_AUTH_REQUEST PP
        WHERE PP.X_REFERENCE_CODE = P_SYSTEM_REFERENCE_ID
        AND PP.MOBILE_NETWORK = V_MOBILE_NETWORK_CODE;

        -- Update existing pre-auth request
        UPDATE PRE_AUTH_REQUEST R
           SET R.X_REFERENCE_CODE = NVL(P_SYSTEM_REFERENCE_ID, R.X_REFERENCE_CODE),
               R.X_REFERENCE_TEXT = NVL(P_GATEWAY_STATUS_MESSAGE, R.X_REFERENCE_TEXT),
               R.RESPONSE_DATE    = NVL(P_RESPONSE_DATE, R.RESPONSE_DATE),
               R.STATUS_CODE      = NVL(P_STATUS_CODE, R.STATUS_CODE)
         WHERE R.X_REFERENCE_CODE = P_SYSTEM_REFERENCE_ID
           AND R.MOBILE_NETWORK = V_MOBILE_NETWORK_CODE;


        -- Set the mandate list cursor for existing records
        OPEN P_DD_MANDATE_LST FOR
            SELECT DDS.X_REFERENCE_CODE,
                   DDS.X_REFERENCE_TEXT,
                   DDS.STATUS_CODE,
                   DDS.MERCHANT_ENTITY_ID,
                   NULL MERCHANT_REF_ID,
                   NULL MOBILE,
                   NULL NETWORK_CODE,
                   NULL AMOUNT,
                   NULL START_DATE,
                   NULL END_DATE,
                   U.OTA_APPROVAL_CALLBACK_URL,
                   U.OTA_CANCELLATION_CALLBACK_URL
            FROM PRE_AUTH_REQUEST DDS,
                 ENTITY_URL U
            WHERE DDS.MERCHANT_ENTITY_ID=U.MAIN_ENTITY_ID
            AND DDS.X_REFERENCE_CODE = P_SYSTEM_REFERENCE_ID;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Handle case when pre-auth request not found
            IF P_STATUS_CODE = 1 THEN
                -- Check if DD_MANDATE_REQUEST exists
                SELECT COUNT(*)
                INTO V_ROW_COUNT
                FROM DD_MANDATE_REQUEST
                WHERE SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;

                IF V_ROW_COUNT > 0 THEN
                    -- Update DD_MANDATE_REQUEST
                    UPDATE DD_MANDATE_REQUEST
                       SET STATUS_CODE            = P_STATUS_CODE,
                           STATUS_MESSAGE         = P_STATUS_MESSAGE,
                           GATEWAY_STATUS_MESSAGE = P_GATEWAY_STATUS_MESSAGE,
                           RESPONSE_DATE          = P_RESPONSE_DATE,
                           LOG_ID                 = V_OP_LOG_TYPE.LOG_ID
                     WHERE SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;

                    -- Insert into DD_MANDATES
                    P_DD_MANDATE_CONF_ID := SEQ_DD_MANDATE_CONFIG.NEXTVAL;

                    INSERT INTO DD_MANDATES
                      (MANDATE_ID,
                       DD_CONFIG_DATE,
                       MANDATE_REQ_ID,
                       MERCHANT_ENTITY_ID,
                       MERCHANT_REF_ID,
                       MOBILE,
                       NETWORK_ID,
                       NARRATION,
                       CURRENCY_ID,
                       FREQUENCY_ID,
                       NO_OF_INSTALLMENTS,
                       START_DATE,
                       END_DATE,
                       DAY_OF_DEBIT,
                       IS_PRE_AUTH_ENABLED,
                       PLATFORM_SCHEDULING,
                       OVA_SERVICE_ID,
                       OVA_SP_ID,
                       STATUS_CODE,
                       STATUS_MESSAGE,
                       SYSTEM_REFERENCE_ID,
                       GATEWAY_REFERENCE_ID,
                       GATEWAY_STATUS_MESSAGE,
                       RESPONSE_DATE,
                       LAST_UPDATE,
                       POST,
                       LOG_ID)
                      SELECT P_DD_MANDATE_CONF_ID,
                             SYSDATE,
                             REQUEST_ID,
                             MERCHANT_ENTITY_ID,
                             MERCHANT_REF_ID,
                             MOBILE,
                             NETWORK_ID,
                             NARRATION,
                             CURRENCY_ID,
                             FREQUENCY_ID,
                             NULL, -- NO_OF_INSTALLMENTS
                             START_DATE,
                             END_DATE,
                             DAY_OF_DEBIT,
                             1, -- IS_PRE_AUTH_ENABLED
                             PLATFORM_SCHEDULING,
                             OVA_SERVICE_ID,
                             OVA_SP_ID,
                             STATUS_CODE,
                             STATUS_MESSAGE,
                             SYSTEM_REFERENCE_ID,
                             GATEWAY_REFERENCE_ID,
                             GATEWAY_STATUS_MESSAGE,
                             RESPONSE_DATE,
                             SYSDATE, -- LAST_UPDATE
                             1, -- POST
                             V_OP_LOG_TYPE.LOG_ID
                        FROM DD_MANDATE_REQUEST
                       WHERE SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;

                    -- Set cursor for newly created mandate
                    OPEN P_DD_MANDATE_LST FOR
                        SELECT DDTS.SYSTEM_REFERENCE_ID X_REFERENCE_CODE,
                               DDTS.GATEWAY_STATUS_MESSAGE X_REFERENCE_TEXT,
                               DDTS.STATUS_CODE,
                               DDTS.MERCHANT_ENTITY_ID,
                               DDTS.MERCHANT_REF_ID,
                               DDTS.MOBILE,
                               MN.MOBILE_NETWORK_CODE NETWORK_CODE,
                               DDTS.AMOUNT AMOUNT,
                               DDTS.START_DATE,
                               DDTS.END_DATE,
                               U.OTA_APPROVAL_CALLBACK_URL,
                               U.OTA_CANCELLATION_CALLBACK_URL
                        FROM DD_MANDATE_REQUEST DDTS,
                             ENTITY_URL U,
                             MOBILE_NETWORK MN
                        WHERE DDTS.MERCHANT_ENTITY_ID=U.MAIN_ENTITY_ID
                        AND DDTS.NETWORK_ID = MN.MOBILE_NETWORK_ID
                        AND DDTS.SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;
                ELSE
                    -- No DD_MANDATE_REQUEST found either
                    P_DD_MANDATE_CONF_ID := -2; -- Indicate no source data found
                    OPEN P_DD_MANDATE_LST FOR
                        SELECT NULL FROM DUAL WHERE 1=0; -- Empty cursor
                END IF;

            ELSE
                -- Status code is not 1, check if DD_MANDATE_REQUEST exists
                SELECT COUNT(*)
                INTO V_ROW_COUNT
                FROM DD_MANDATE_REQUEST
                WHERE SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;

                IF V_ROW_COUNT > 0 THEN
                    -- Update DD_MANDATE_REQUEST only
                    UPDATE DD_MANDATE_REQUEST
                       SET STATUS_CODE            = P_STATUS_CODE,
                           STATUS_MESSAGE         = P_STATUS_MESSAGE,
                           GATEWAY_STATUS_MESSAGE = P_GATEWAY_STATUS_MESSAGE,
                           RESPONSE_DATE          = P_RESPONSE_DATE,
                           LOG_ID                 = V_OP_LOG_TYPE.LOG_ID
                     WHERE SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;

                    P_DD_MANDATE_CONF_ID := -1; -- No insert happened

                    -- Set cursor for mandate request data
                    OPEN P_DD_MANDATE_LST FOR
                       SELECT DDTS.SYSTEM_REFERENCE_ID X_REFERENCE_CODE,
                               DDTS.GATEWAY_STATUS_MESSAGE X_REFERENCE_TEXT,
                               DDTS.STATUS_CODE,
                               DDTS.MERCHANT_ENTITY_ID,
                               DDTS.MERCHANT_REF_ID,
                               DDTS.MOBILE,
                               MN.MOBILE_NETWORK_CODE NETWORK_CODE,
                               DDTS.AMOUNT AMOUNT,
                               DDTS.START_DATE,
                               DDTS.END_DATE,
                               U.OTA_APPROVAL_CALLBACK_URL,
                               U.OTA_CANCELLATION_CALLBACK_URL
                        FROM DD_MANDATE_REQUEST DDTS,
                             ENTITY_URL U,
                             MOBILE_NETWORK MN
                        WHERE DDTS.MERCHANT_ENTITY_ID=U.MAIN_ENTITY_ID
                        AND DDTS.NETWORK_ID = MN.MOBILE_NETWORK_ID
                        AND DDTS.SYSTEM_REFERENCE_ID = P_SYSTEM_REFERENCE_ID;
                ELSE
                    -- No data found at all
                    P_DD_MANDATE_CONF_ID := -2; -- Indicate no source data found
                    OPEN P_DD_MANDATE_LST FOR
                        SELECT NULL FROM DUAL WHERE 1=0; -- Empty cursor
                END IF;
            END IF;

        WHEN OTHERS THEN
            -- Handle any other unexpected errors
            P_DD_MANDATE_CONF_ID := -999; -- Error occurred
            OPEN P_DD_MANDATE_LST FOR
                SELECT NULL FROM DUAL WHERE 1=0; -- Empty cursor

            -- Re-raise the exception or handle as needed
            RAISE;
    END;

    -- Commit the transaction
   -- COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
        -- Global exception handler
       -- ROLLBACK;
        P_DD_MANDATE_CONF_ID := -999;

        -- Ensure cursor is opened even in error case
        IF P_DD_MANDATE_LST%ISOPEN = FALSE THEN
            OPEN P_DD_MANDATE_LST FOR
                SELECT NULL FROM DUAL WHERE 1=0; -- Empty cursor
        END IF;

        -- Log the error or re-raise as needed
        RAISE;

END MARK_MADAPI_PREAPPROVAL_CALLBACK;

  ------------------------------------------------------------
  ----------------DD_MANDATE_CANCEL_REQ-----------------------
  ------------------------------------------------------------
  PROCEDURE DD_MANDATE_CANCEL_REQ(P_MANDATE_REQ_ID         IN NUMBER,
                                  P_CONFIG_ID              IN NUMBER,
                                  P_CANCELLATION_DATE      IN DATE,
                                  P_CANCELLATION_REASON    IN VARCHAR2,
                                  P_CANCELLATION_SOURCE    IN VARCHAR2,
                                  P_STATUS_CODE            IN NUMBER,
                                  P_STATUS_MESSAGE         IN VARCHAR2,
                                  P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                  P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                  P_OP_LOG                 IN OUT VARCHAR2,
                                  O_CANCELLATION_ID        OUT NUMBER,
                                  O_STATUS_MESSAGE         OUT VARCHAR2) AS
    V_OP_LOG_TYPE USER_OP_LOG_TYPE := USER_OP_LOG_TYPE(NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL);
  BEGIN

    --GENERATE LOG
    FORMAT_N_GENERATE_LOG(P_OP_LOG, V_OP_LOG_TYPE);
    -- GENERATE THE CANCELLATION_ID USING THE SEQUENCE
    O_CANCELLATION_ID := SEQ_DD_MANDATE_CANCEL.NEXTVAL;

    -- INSERT THE RECORD INTO THE TABLE
    INSERT INTO DD_MANDATE_CANCELLATION
      (CANCELLATION_ID,
       MANDATE_REQ_ID,
       CONFIG_ID,
       CANCELLATION_DATE,
       CANCELLATION_REASON,
       CANCELLATION_SOURCE,
       STATUS_CODE,
       STATUS_MESSAGE,
       GATEWAY_REFERENCE_ID,
       GATEWAY_STATUS_MESSAGE,
       LAST_UPDATE)
    VALUES
      (O_CANCELLATION_ID,
       P_MANDATE_REQ_ID,
       P_CONFIG_ID,
       P_CANCELLATION_DATE,
       P_CANCELLATION_REASON,
       P_CANCELLATION_SOURCE,
       P_STATUS_CODE,
       P_STATUS_MESSAGE,
       P_GATEWAY_REFERENCE_ID,
       P_GATEWAY_STATUS_MESSAGE,
       SYSDATE);

    -- RETURN SUCCESS MESSAGE
    O_STATUS_MESSAGE := 'Success';

  EXCEPTION
    WHEN OTHERS THEN
      -- RETURN ERROR DETAILS
      O_CANCELLATION_ID := -1;
      O_STATUS_MESSAGE  := 'Failure: ' || SQLERRM;
  END DD_MANDATE_CANCEL_REQ;

  ------------------------------------------------------------
  --------------------CANCEL_DD_MANDATE-----------------------
  ------------------------------------------------------------
  PROCEDURE CANCEL_DD_MANDATE(P_MANDATE_REQ_ID          IN NUMBER,
                              P_CANCELLATION_REASON     IN VARCHAR2,
                              P_CANCELLATION_SOURCE     IN VARCHAR2,
                              P_GATEWAY_REFRENCE_ID     IN VARCHAR2,
                              P_GATEWAY_STATUS_MESSGAGE IN VARCHAR2,
                              P_OP_LOG                  IN OUT VARCHAR2,
                              P_STATUS_CODE             OUT NUMBER,
                              P_STATUS_MESSAGE          OUT VARCHAR2) AS
    V_OP_LOG_TYPE USER_OP_LOG_TYPE := USER_OP_LOG_TYPE(NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL);
  BEGIN
    --GENERATE LOG
    FORMAT_N_GENERATE_LOG(P_OP_LOG, V_OP_LOG_TYPE);
    P_STATUS_CODE    := 1;
    P_STATUS_MESSAGE := 'Mandate Cancelled';

    UPDATE DD_MANDATE_CANCELLATION DMC
       SET DMC.STATUS_CODE            = 4,
           DMC.CANCELLATION_DATE      = SYSDATE,
           DMC.CANCELLATION_REASON    = P_CANCELLATION_REASON,
           DMC.CANCELLATION_SOURCE    = P_CANCELLATION_SOURCE,
           DMC.GATEWAY_REFERENCE_ID   = P_GATEWAY_REFRENCE_ID,
           DMC.GATEWAY_STATUS_MESSAGE = P_GATEWAY_STATUS_MESSGAGE,
           DMC.STATUS_MESSAGE         = 'CANCELLED',
           DMC.LOG_ID                 = V_OP_LOG_TYPE.LOG_ID
     WHERE DMC.MANDATE_REQ_ID = P_MANDATE_REQ_ID;

    UPDATE DD_MANDATES DMG
       SET DMG.IS_PRE_AUTH_ENABLED = 0,
           DMG.STATUS_CODE         = 4,
           DMG.STATUS_MESSAGE      = 'CANCELLED',
           DMG.LOG_ID              = V_OP_LOG_TYPE.LOG_ID
     WHERE DMG.MANDATE_REQ_ID = P_MANDATE_REQ_ID;

    UPDATE DD_MANDATE_REQUEST DMR
       SET DMR.STATUS_CODE    = 4,
           DMR.STATUS_MESSAGE = 'CANCELLED',
           DMR.LOG_ID         = V_OP_LOG_TYPE.LOG_ID
     WHERE DMR.REQUEST_ID = P_MANDATE_REQ_ID;

  END CANCEL_DD_MANDATE;

  ------------------------------------------------------------
  --------------------CANCEL_DD_MANDATE_UPDATE----------------
  ------------------------------------------------------------

  PROCEDURE DD_MANDATE_CANCEL_UPDATE(P_CANCEL_REQ_ID          IN NUMBER,
                                     P_CONFIG_ID              IN NUMBER,
                                     P_CANCELLATION_DATE      IN DATE,
                                     P_CANCELLATION_REASON    IN VARCHAR2,
                                     P_CANCELLATION_SOURCE    IN VARCHAR2,
                                     P_STATUS_CODE            IN NUMBER,
                                     P_STATUS_MESSAGE         IN VARCHAR2,
                                     P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                     P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                     P_OP_LOG                 IN OUT VARCHAR2,
                                     O_CANCELLATION_ID        OUT NUMBER,
                                     O_STATUS_MESSAGE         OUT VARCHAR2) AS
    V_OP_LOG_TYPE USER_OP_LOG_TYPE := USER_OP_LOG_TYPE(NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL);
  BEGIN
    -- GENERATE LOG
    FORMAT_N_GENERATE_LOG(P_OP_LOG, V_OP_LOG_TYPE);

    -- UPDATE THE RECORD IN THE TABLE
    UPDATE DD_MANDATE_CANCELLATION
       SET CONFIG_ID              = P_CONFIG_ID,
           CANCELLATION_DATE      = P_CANCELLATION_DATE,
           CANCELLATION_REASON    = P_CANCELLATION_REASON,
           CANCELLATION_SOURCE    = P_CANCELLATION_SOURCE,
           STATUS_CODE            = P_STATUS_CODE,
           STATUS_MESSAGE         = P_STATUS_MESSAGE,
           GATEWAY_REFERENCE_ID   = P_GATEWAY_REFERENCE_ID,
           GATEWAY_STATUS_MESSAGE = P_GATEWAY_STATUS_MESSAGE,
           LAST_UPDATE            = SYSDATE
     WHERE CANCELLATION_ID = P_CANCEL_REQ_ID;

    -- CHECK IF UPDATE SUCCEEDED
    IF SQL%ROWCOUNT > 0 THEN
      O_STATUS_MESSAGE := 'Update Successful';
    ELSE
      O_STATUS_MESSAGE := 'No record found with the given MANDATE_REQ_ID';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      -- HANDLE ERROR
      O_STATUS_MESSAGE := 'Failure: ' || SQLERRM;
  END DD_MANDATE_CANCEL_UPDATE;

  ------------------------------------------------------------
  ------------------GET_DD_MANDATE_DETAIL---------------------
  ------------------------------------------------------------
  PROCEDURE GET_DD_MANDATE_DET(P_MANDATE_REQ_ID IN NUMBER,
                               P_MANDATE_DET_C  OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN P_MANDATE_DET_C FOR
      SELECT MDC.MANDATE_ID,
             MDC.DD_CONFIG_DATE,
             MDC.MANDATE_REQ_ID,
             MDC.MERCHANT_ENTITY_ID,
             MDC.MERCHANT_REF_ID,
             MDC.MOBILE,
             MDC.NETWORK_ID,
             MDC.NARRATION,
             MDC.CURRENCY_ID,
             MDC.FREQUENCY_ID,
             MDC.NO_OF_INSTALLMENTS,
             MDC.START_DATE,
             MDC.END_DATE,
             MDC.DAY_OF_DEBIT,
             MDC.IS_PRE_AUTH_ENABLED,
             MDC.PLATFORM_SCHEDULING,
             MDC.OVA_SERVICE_ID,
             MDC.OVA_SP_ID,
             MDC.STATUS_CODE,
             MDC.STATUS_MESSAGE,
             MDC.SYSTEM_REFERENCE_ID,
             MDC.GATEWAY_REFERENCE_ID,
             MDC.GATEWAY_STATUS_MESSAGE,
             MDC.RESPONSE_DATE,
             MDC.LAST_UPDATE,
             MDC.POST,
             MDC.LOG_ID
        FROM DD_MANDATES MDC
       WHERE MDC.MANDATE_REQ_ID = P_MANDATE_REQ_ID;


  END GET_DD_MANDATE_DET;

  --------------------------------------------------------------------
  ------------------INSERT_DD_MANDATE_PAYMENT_REQ---------------------
  --------------------------------------------------------------------
  PROCEDURE INSERT_DD_MANDATE_PAYMENT_REQ(P_MERCHANT_ENTITY IN NUMBER,
                                          P_MANDATE_REQ     IN NUMBER,
                                          P_SYSTEM_TXN      IN NUMBER,
                                          P_STATUS_CODE     OUT NUMBER,
                                          P_STATUS_MESSAGE  OUT VARCHAR2) IS
  BEGIN

    -- INSERT THE RECORD
    INSERT INTO DD_MANDATE_PAYMENT_HISTORY
      (TXN_DATE, MERCHANT_ENTITY_ID, MANDATE_REQ_ID, SYSTEM_TXN_ID)
    VALUES
      (SYSDATE, -- CURRENT TRANSACTION DATE
       P_MERCHANT_ENTITY,
       P_MANDATE_REQ,
       P_SYSTEM_TXN);

    --  COMMIT;
    P_STATUS_CODE    := 0;
    P_STATUS_MESSAGE := 'Transaction inserted successfully';

  EXCEPTION
    WHEN OTHERS THEN
      -- ROLLBACK;
      P_STATUS_CODE    := SQLCODE;
      P_STATUS_MESSAGE := SQLERRM;
  END INSERT_DD_MANDATE_PAYMENT_REQ;

  -----------------------------------------------------------------
  ------------------GET_PENDING_DD_MANDATE_REQ---------------------
  -----------------------------------------------------------------
  PROCEDURE GET_PENDING_DD_MANDATE_REQ(P_MANDATE_DET_C OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN P_MANDATE_DET_C FOR
      SELECT DMR.REQUEST_ID,
             DMR.REQUEST_DATE,
             DMR.MERCHANT_ENTITY_ID,
             DMR.MERCHANT_REF_ID,
             DMR.NARRATION,
             DMR.PLATFORM_SCHEDULING,
             DMR.MOBILE,
             DMR.NETWORK_ID,
             DMR.AMOUNT,
             DMR.CURRENCY_ID,
             DMR.FREQUENCY_ID,
             DMR.START_DATE,
             DMR.END_DATE,
             DMR.DAY_OF_DEBIT,
             DMR.OVA_SERVICE_ID,
             DMR.OVA_SP_ID,
             DMR.STATUS_CODE,
             DMR.STATUS_MESSAGE,
             DMR.SYSTEM_REFERENCE_ID,
             DMR.GATEWAY_REFERENCE_ID,
             DMR.GATEWAY_STATUS_MESSAGE,
             DMR.RESPONSE_DATE,
             DMR.POST,
             DMR.LOG_ID
        FROM DD_MANDATE_REQUEST DMR
       WHERE DMR.STATUS_CODE = 0
         AND DMR.NETWORK_ID = 3
         AND DMR.REQUEST_DATE >= SYSDATE - INTERVAL '12' HOUR;


  END GET_PENDING_DD_MANDATE_REQ;

  -----------------------------------------------------------------
  ------------------GET_DD_PENDING_PAYMENTS------------------------
  -----------------------------------------------------------------
  PROCEDURE GET_DD_PENDING_PAYMENTS(P_DD_PENDING_PAY_DET_C OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN P_DD_PENDING_PAY_DET_C FOR
      SELECT DMH.REQ_ID,
             DMH.TXN_DATE,
             DMH.MERCHANT_ENTITY_ID,
             DMH.MANDATE_REQ_ID,
             DMH.SYSTEM_TXN_ID,
             TR.TRANSACTION_ID,
             TR.MERCHANT_TRANS_REF_CODE,
             TR.AMOUNT,
             TR.POST_TO_BANK_AMOUNT,
             TR.BANK_REFERENCE_CODE,
             TR.BANK_RESPONSE_TEXT,
             TR.BANK_ENTITY_ID,
             TR.OVA_SERVICEID,
             TR.OVA_SPID
        FROM DD_MANDATE_PAYMENT_HISTORY DMH, ENTITY_WALLET_TOPUP_REQUEST TR
       WHERE DMH.SYSTEM_TXN_ID = TR.SYSTEM_TRANS_ID
         AND TR.STATUS_CODE = 0
         AND TR.TRANSACTION_DATE >= SYSDATE - INTERVAL '12' HOUR;


    --AND DMR.REQUEST_DATE >= SYSDATE - INTERVAL '12' HOUR;
  END GET_DD_PENDING_PAYMENTS;

  -----------------------------------------------------------------
  ------------------UPDATE_RECURRING_PAYMENT_AMOUNT----------------
  -----------------------------------------------------------------
  PROCEDURE UPDATE_RECURRING_PAYMENT_AMOUNT(P_REQUEST_ID    IN DD_MANDATE_REQUEST.REQUEST_ID%TYPE,
                                            P_AMOUNT        IN DD_MANDATE_REQUEST.AMOUNT%TYPE,
                                            P_MOBILE        IN DD_MANDATE_REQUEST.MOBILE%TYPE,
                                            P_STATUS        OUT NUMBER,
                                            P_ERROR_MESSAGE OUT VARCHAR2) IS
    V_TRANSACTION_ID DD_MANDATE_REQUEST.REQUEST_ID%TYPE := NULL;
  BEGIN
    P_STATUS        := 1;
    P_ERROR_MESSAGE := 'SUCCESS';

    SELECT REQUEST_ID
      INTO V_TRANSACTION_ID
      FROM DD_MANDATE_REQUEST
     WHERE REQUEST_ID = P_REQUEST_ID
       AND MOBILE = P_MOBILE
       FOR UPDATE NOWAIT;

    UPDATE DD_MANDATE_REQUEST
       SET AMOUNT = P_AMOUNT
     WHERE REQUEST_ID = P_REQUEST_ID
       AND MOBILE = P_MOBILE;

    IF SQL%ROWCOUNT = 0 THEN
      P_STATUS        := 0;
      P_ERROR_MESSAGE := 'No rows updated';
    END IF;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      P_STATUS        := 0;
      P_ERROR_MESSAGE := SQLERRM;
      ROLLBACK;
  END UPDATE_RECURRING_PAYMENT_AMOUNT;

  -----------------------------------------------------------------
  ------------------FETCH_MANDATE_HISTORY------------------------
  -----------------------------------------------------------------

  PROCEDURE FETCH_MANDATE_HISTORY(P_MERCHANT_ENTITY_ID IN NUMBER,
                                  P_MANDATE_HISTORY_C  OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN P_MANDATE_HISTORY_C FOR
      SELECT MDC.MOBILE,
             MN.MOBILE_NETWORK_CODE,
             DIF.INSTALLMENT_FREQ_CODE,
             MDC.START_DATE,
             MDC.END_DATE
        FROM DD_MANDATES MDC
        LEFT JOIN MOBILE_NETWORK MN
          ON MDC.NETWORK_ID = MN.MOBILE_NETWORK_ID
        LEFT JOIN DD_INSTALLMENT_FREQUENCY DIF
          ON MDC.FREQUENCY_ID = DIF.INSTALLMENT_FREQ_ID -- ? USE CORRECT COLUMN
       WHERE MDC.MERCHANT_ENTITY_ID = P_MERCHANT_ENTITY_ID
         AND MDC.STATUS_CODE = 1;


  END FETCH_MANDATE_HISTORY;

  -----------------------------------------------------------------
  ------------------DD_VALIDATE_CONSENT------------------------
  -----------------------------------------------------------------

  PROCEDURE DD_MANDATE_STATUS(P_MOBILE             IN VARCHAR2,
                              P_MANDATE_REQUEST_ID IN NUMBER,
                              P_MANDATE_ID         OUT NUMBER,
                              P_STATUS_CODE        OUT NUMBER,
                              P_STATUS_MESSAGE     OUT VARCHAR2,
                              P_DATE_GIVEN         OUT DATE,
                              P_LAST_UPDATED       OUT DATE) AS
  BEGIN
    -- STEP 1: CHECK DD_MANDATE_REQUEST
    BEGIN
      SELECT REQUEST_ID,
             STATUS_CODE,
             STATUS_MESSAGE,
             REQUEST_DATE,
             RESPONSE_DATE
        INTO P_MANDATE_ID, -- YOU’RE REUSING IN PARAM HERE (POSSIBLE ISSUE, SEE NOTE BELOW)
             P_STATUS_CODE,
             P_STATUS_MESSAGE,
             P_DATE_GIVEN,
             P_LAST_UPDATED
        FROM DD_MANDATE_REQUEST
       WHERE MOBILE = P_MOBILE
         AND REQUEST_ID = P_MANDATE_REQUEST_ID;

      -- STEP 2: IF STATUS_CODE = 1, FETCH LATEST MANDATE_ID FROM DD_MANDATES
      IF P_STATUS_CODE = 1 THEN
        BEGIN
          SELECT DM.MANDATE_ID
            INTO P_MANDATE_ID
            FROM DD_MANDATES DM
           WHERE DM.MANDATE_REQ_ID = P_MANDATE_REQUEST_ID
           ORDER BY DM.MANDATE_ID DESC
           FETCH FIRST 1 ROWS ONLY; -- FOR ORACLE 12C+, ELSE USE ROWNUM FILTER
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            P_MANDATE_ID := NULL;
        END;
      END IF;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        P_MANDATE_ID     := 0;
        P_STATUS_CODE    := -1;
        P_STATUS_MESSAGE := 'No Record Found';
        P_DATE_GIVEN     := NULL;
        P_LAST_UPDATED   := NULL;
    END;
  END DD_MANDATE_STATUS;

  -----------------------------------------------------------------
  ------------------CREATE DD PAYMENT REQUEST----------------------
  -----------------------------------------------------------------
  PROCEDURE CREATE_DD_RECURRING_PAYMENT( -- INPUT PARAMETERS
                                        P_MERCHANT_ENTITY_ID IN NUMBER,
                                        P_MANDATE_ID         IN NUMBER,
                                        P_AMOUNT             IN NUMBER,
                                        P_PAYMENT_MODE_ID    IN NUMBER,
                                        P_TRANSACTION_REF_ID IN VARCHAR2,
                                        P_STATUS_CODE        IN VARCHAR2,
                                        P_STATUS_MESSAGE     IN VARCHAR2,
                                        -- OUTPUT PARAMETERS
                                        O_STATUS_CODE    OUT VARCHAR2,
                                        O_STATUS_MESSAGE OUT VARCHAR2,
                                        O_CURSOR         OUT SYS_REFCURSOR) AS
    V_MANDATE_EXISTS NUMBER := 0;
    V_TRANSACTION_ID NUMBER;
    V_MOBILE         VARCHAR2(50);
    V_NETWORK_ID     NUMBER(3);
    V_CURRENCY_ID    NUMBER(3);
    V_OVA_SERVICE_ID VARCHAR2(100);
    V_OVA_SP_ID      VARCHAR2(100);
    V_SYSTEM_TXN_ID  NUMBER(12);

  BEGIN
    -- CHECK IF MANDATE EXISTS IN DD_MANDATES TABLE
    BEGIN
      SELECT COUNT(*),
             MAX(MOBILE),
             MAX(NETWORK_ID),
             MAX(CURRENCY_ID),
             MAX(OVA_SERVICE_ID),
             MAX(OVA_SP_ID)
        INTO V_MANDATE_EXISTS,
             V_MOBILE,
             V_NETWORK_ID,
             V_CURRENCY_ID,
             V_OVA_SERVICE_ID,
             V_OVA_SP_ID
        FROM DD_MANDATES
       WHERE MANDATE_ID = P_MANDATE_ID
         AND MERCHANT_ENTITY_ID = P_MERCHANT_ENTITY_ID
         AND STATUS_CODE = 1; -- ASSUMING 1 MEANS ACTIVE/APPROVED MANDATE

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_MANDATE_EXISTS := 0;
      WHEN OTHERS THEN
        O_STATUS_CODE    := '-1';
        O_STATUS_MESSAGE := 'Error checking mandate: ' || SQLERRM;
        OPEN O_CURSOR FOR
          SELECT NULL FROM DUAL WHERE 1 = 0;


        RETURN;
    END;

    -- IF MANDATE DOESN'T EXIST, RETURN ERROR
    IF V_MANDATE_EXISTS = 0 THEN
      O_STATUS_CODE    := '0';
      O_STATUS_MESSAGE := 'Mandate not found or not active for the given merchant';
      OPEN O_CURSOR FOR
        SELECT NULL FROM DUAL WHERE 1 = 0;


      RETURN;
    END IF;

    -- GENERATE SYSTEM TRANSACTION ID (YOU MAY WANT TO USE A SEQUENCE)
    SELECT NVL(MAX(SYSTEM_TXN_ID), 0) + 1
      INTO V_SYSTEM_TXN_ID
      FROM DD_RECURRING_PAYMENT;

    -- INSERT PAYMENT REQUEST INTO DD_RECURRING_PAYMENT TABLE
    BEGIN
      INSERT INTO DD_RECURRING_PAYMENT
        (MANDATE_ID,
         SYSTEM_TXN_ID,
         X_TRANSACTION_REF,
         MOBILE,
         TXN_AMOUNT,
         CURRENCY_ID,
         STATUS_CODE,
         STATUS_MESSAGE,
         OVA_SERVICEID,
         OVA_SPID,
         TRANSACTION_DATE,
         LAST_UPDATED)
      VALUES
        (P_MANDATE_ID,
         V_SYSTEM_TXN_ID,
         P_TRANSACTION_REF_ID,
         V_MOBILE,
         P_AMOUNT,
         V_CURRENCY_ID,
         P_STATUS_CODE,
         P_STATUS_MESSAGE,
         V_OVA_SERVICE_ID,
         V_OVA_SP_ID,
         SYSDATE,
         SYSDATE)
      RETURNING TRANSACTION_ID INTO V_TRANSACTION_ID;

      -- COMMIT THE TRANSACTION
      COMMIT;

      -- SET SUCCESS RESPONSE
      O_STATUS_CODE    := '1';
      O_STATUS_MESSAGE := 'Payment created successfully';

      -- RETURN CURSOR WITH TRANSACTION DETAILS
      OPEN O_CURSOR FOR
        SELECT DP.STATUS_CODE      AS TRANSACTION_STATUS,
               DM.OVA_SERVICE_ID   AS OVAID,
               DM.OVA_SP_ID        AS OVASPID,
               DP.MOBILE,
               DM.NETWORK_ID       AS NETWORKID,
               DP.TXN_AMOUNT       AS AMOUNT,
               DP.CURRENCY_ID      AS CURRENCYCODE,
               DP.SYSTEM_TXN_ID    AS SYSTEMID,
               DP.TRANSACTION_ID,
               DP.TRANSACTION_DATE
          FROM DD_RECURRING_PAYMENT DP
         INNER JOIN DD_MANDATES DM
            ON DP.MANDATE_ID = DM.MANDATE_ID
         WHERE DP.TRANSACTION_ID = V_TRANSACTION_ID;


    EXCEPTION
      WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        O_STATUS_CODE    := '0';
        O_STATUS_MESSAGE := 'Duplicate transaction reference ID';
        OPEN O_CURSOR FOR
          SELECT NULL FROM DUAL WHERE 1 = 0;


      WHEN OTHERS THEN
        ROLLBACK;
        O_STATUS_CODE    := '-1';
        O_STATUS_MESSAGE := 'Error creating payment request: ' || SQLERRM;
        OPEN O_CURSOR FOR
          SELECT NULL FROM DUAL WHERE 1 = 0;


    END;

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      O_STATUS_CODE    := '-1';
      O_STATUS_MESSAGE := 'Unexpected error: ' || SQLERRM;
      OPEN O_CURSOR FOR
        SELECT NULL FROM DUAL WHERE 1 = 0;


  END CREATE_DD_RECURRING_PAYMENT;

  --------------------------------------------------------------------------
  ------------------UPDATE_DD_RECURRING_PAYMENT_STATUS----------------------
  --------------------------------------------------------------------------
  PROCEDURE UPDATE_DD_RECURRING_PAYMENT_STATUS(P_SYSTEM_ID                IN NUMBER,
                                               P_GATEWAY_REFERENCE_ID     IN VARCHAR2,
                                               P_STATUS_CODE              IN VARCHAR2,
                                               P_STATUS_MESSAGE           IN VARCHAR2,
                                               P_GATEWAY_STATUS_CODE      IN VARCHAR2,
                                               P_GATEWAY_STATUS_MESSAGE   IN VARCHAR2,
                                               O_PROCEDURE_STATUS_CODE    OUT VARCHAR2,
                                               O_PROCEDURE_STATUS_MESSAGE OUT VARCHAR2) AS
    V_COUNT          NUMBER := 0;
    V_TRANSACTION_ID NUMBER;
  BEGIN
    -- INITIALIZE OUTPUT PARAMETERS
    O_PROCEDURE_STATUS_CODE    := '1';
    O_PROCEDURE_STATUS_MESSAGE := 'Success';

    -- VALIDATE INPUT PARAMETERS
    IF P_SYSTEM_ID IS NULL THEN
      O_PROCEDURE_STATUS_CODE    := '0';
      O_PROCEDURE_STATUS_MESSAGE := 'System ID cannot be null';
      RETURN;
    END IF;

    /* IF P_GATEWAY_REFERENCE_ID IS NULL THEN
      O_PROCEDURE_STATUS_CODE    := '1';
      O_PROCEDURE_STATUS_MESSAGE := 'GATEWAY REFERENCE ID CANNOT BE NULL';
      RETURN;
    END IF;*/

    -- CHECK IF RECORD EXISTS WITH THE GIVEN SYSTEM_TXN_ID
    SELECT COUNT(*), MAX(TRANSACTION_ID)
      INTO V_COUNT, V_TRANSACTION_ID
      FROM DD_RECURRING_PAYMENT
     WHERE SYSTEM_TXN_ID = P_SYSTEM_ID;

    IF V_COUNT = 0 THEN
      O_PROCEDURE_STATUS_CODE    := '0';
      O_PROCEDURE_STATUS_MESSAGE := 'No record found with System ID: ' ||
                                    P_SYSTEM_ID;
      RETURN;
    END IF;

    IF V_COUNT > 1 THEN
      O_PROCEDURE_STATUS_CODE    := '0';
      O_PROCEDURE_STATUS_MESSAGE := 'Multiple records found with System ID: ' ||
                                    P_SYSTEM_ID;
      RETURN;
    END IF;

    -- UPDATE THE RECORD
    BEGIN
      UPDATE DD_RECURRING_PAYMENT
         SET STATUS_CODE            = P_STATUS_CODE,
             STATUS_MESSAGE         = P_STATUS_MESSAGE,
             GATEWAY_REFERENCE_ID   = NVL(P_GATEWAY_REFERENCE_ID,
                                          GATEWAY_REFERENCE_ID),
             GATEWAY_STATUS_CODE    = NVL(P_GATEWAY_STATUS_CODE,
                                          GATEWAY_STATUS_CODE),
             GATEWAY_STATUS_MESSAGE = NVL(P_GATEWAY_STATUS_MESSAGE,
                                          GATEWAY_STATUS_MESSAGE),
             RESPONSE_DATE          = SYSDATE,
             LAST_UPDATED           = SYSDATE
       WHERE SYSTEM_TXN_ID = P_SYSTEM_ID;

      -- CHECK IF UPDATE WAS SUCCESSFUL
      IF SQL%ROWCOUNT = 0 THEN
        O_PROCEDURE_STATUS_CODE    := '0';
        O_PROCEDURE_STATUS_MESSAGE := 'Update failed - no rows affected';
        ROLLBACK;
      ELSE
        O_PROCEDURE_STATUS_CODE    := '1';
        O_PROCEDURE_STATUS_MESSAGE := 'Record updated successfully. Transaction ID: ' ||
                                      V_TRANSACTION_ID;
        COMMIT;
      END IF;

    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        O_PROCEDURE_STATUS_CODE    := '-100';
        O_PROCEDURE_STATUS_MESSAGE := 'Database error during update: ' ||
                                      SQLERRM;
    END;

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      O_PROCEDURE_STATUS_CODE    := '-100';
      O_PROCEDURE_STATUS_MESSAGE := 'Unexpected error: ' || SQLERRM;

  END UPDATE_DD_RECURRING_PAYMENT_STATUS;

  --------------------------------------------------------------------------
  ------------------UPDATE_DD_RECURRING_PAYMENT_STATUS----------------------
  --------------------------------------------------------------------------
  PROCEDURE GET_DD_RECURRING_PAYMENT_STATUS(P_MANDATE_ID        IN DD_RECURRING_PAYMENT.MANDATE_ID%TYPE,
                                            P_X_TRANSACTION_REF IN DD_RECURRING_PAYMENT.X_TRANSACTION_REF%TYPE,
                                            P_SYSTEM_TXN_ID     OUT DD_RECURRING_PAYMENT.SYSTEM_TXN_ID%TYPE,
                                            P_STATUS_CODE       OUT DD_RECURRING_PAYMENT.STATUS_CODE%TYPE,
                                            P_STATUS_MESSAGE    OUT DD_RECURRING_PAYMENT.STATUS_MESSAGE%TYPE) IS
  BEGIN
    SELECT SYSTEM_TXN_ID, STATUS_CODE, STATUS_MESSAGE
      INTO P_SYSTEM_TXN_ID, P_STATUS_CODE, P_STATUS_MESSAGE
      FROM DD_RECURRING_PAYMENT
     WHERE MANDATE_ID = P_MANDATE_ID
       AND X_TRANSACTION_REF = P_X_TRANSACTION_REF;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      P_SYSTEM_TXN_ID  := NULL;
      P_STATUS_CODE    := '-1';
      P_STATUS_MESSAGE := 'No record found for given mandate_id and transaction_ref';
    WHEN OTHERS THEN
      P_SYSTEM_TXN_ID  := NULL;
      P_STATUS_CODE    := '-100';
      P_STATUS_MESSAGE := SQLERRM;
  END GET_DD_RECURRING_PAYMENT_STATUS;

  --------------------------------------------------------------------------
  ------------------DD_MANDATE_STATUS_VIA_REF----------------------
  --------------------------------------------------------------------------

  PROCEDURE DD_MANDATE_STATUS_VIA_REF(P_TRANSACTION_REF_ID IN VARCHAR2,
                                      P_MERCHANT_ENTITY_ID IN NUMBER,
                                      P_MANDATE_ID         OUT NUMBER,
                                      P_STATUS_CODE        OUT NUMBER,
                                      P_STATUS_MESSAGE     OUT VARCHAR2,
                                      P_DATE_GIVEN         OUT DATE,
                                      P_LAST_UPDATED       OUT DATE,
                                      P_MANDATE_DETAILS    OUT SYS_REFCURSOR -- NEW OUT PARAM
                                      ) AS
  BEGIN
    -- STEP 1: CHECK DD_MANDATE_REQUEST
    BEGIN
      SELECT REQUEST_ID,
             STATUS_CODE,
             STATUS_MESSAGE,
             REQUEST_DATE,
             RESPONSE_DATE
        INTO P_MANDATE_ID,
             P_STATUS_CODE,
             P_STATUS_MESSAGE,
             P_DATE_GIVEN,
             P_LAST_UPDATED
        FROM DD_MANDATE_REQUEST
       WHERE merchant_ref_id = P_TRANSACTION_REF_ID and MERCHANT_ENTITY_ID= P_MERCHANT_ENTITY_ID;

      -- STEP 2: IF STATUS_CODE = 1, FETCH ALL DETAILS FROM DD_MANDATES
      IF P_STATUS_CODE = 1 THEN
        OPEN P_MANDATE_DETAILS FOR
          SELECT *
            FROM DD_MANDATES DM
           WHERE DM.merchant_ref_id = P_TRANSACTION_REF_ID
           ORDER BY DM.MANDATE_ID DESC;

      ELSE
        P_MANDATE_DETAILS := NULL;
      END IF;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        P_MANDATE_ID      := 0;
        P_STATUS_CODE     := -1;
        P_STATUS_MESSAGE  := 'No Record Found';
        P_DATE_GIVEN      := NULL;
        P_LAST_UPDATED    := NULL;
        P_MANDATE_DETAILS := NULL;
    END;
  END DD_MANDATE_STATUS_VIA_REF;


  --------------------------------------------------------------------------
  ------------------CREATE_DD_MANDATE_WITH_PREAPPROVAL----------------------
  --------------------------------------------------------------------------
PROCEDURE CREATE_DD_MANDATE_WITH_PREAPPROVAL(
                                      P_REQUEST_DATE           IN DATE,
                                      P_PREAPPROVAL_ID IN VARCHAR2, -- NEW PARAM
                                      P_MERCHANT_ENTITY_ID     IN NUMBER,
                                      P_MERCHANT_REF_ID        IN VARCHAR2,
                                      P_NARRATION              IN VARCHAR2,
                                      P_PLATFORM_SCHEDULING    IN NUMBER,
                                      P_MOBILE                 IN VARCHAR2,
                                      P_NETWORK_ID             IN NUMBER,
                                      P_AMOUNT                 IN NUMBER,
                                      P_CURRENCY_ID            IN NUMBER,
                                      P_FREQUENCY_ID           IN NUMBER,
                                      P_START_DATE             IN DATE,
                                      P_END_DATE               IN DATE,
                                      P_DAY_OF_DEBIT           IN NUMBER,
                                      P_OVA_SERVICE_ID         IN VARCHAR2,
                                      P_OVA_SP_ID              IN VARCHAR2,
                                      P_STATUS_CODE            IN NUMBER,
                                      P_STATUS_MESSAGE         IN VARCHAR2,
                                      P_SYSTEM_REFERENCE_ID    IN VARCHAR2,
                                      P_GATEWAY_REFERENCE_ID   IN VARCHAR2,
                                      P_GATEWAY_STATUS_MESSAGE IN VARCHAR2,
                                      P_RESPONSE_DATE          IN DATE,
                                      P_POST                   IN NUMBER,
                                      P_OP_LOG                 IN OUT VARCHAR2,
                                      P_EXISTING_REQUEST_ID    OUT NUMBER,
                                      P_RESPONSE_CODE          OUT NUMBER,
                                      P_RESPONSE_DESC          OUT VARCHAR,
                                      P_RET_OVA_SERVCEID       OUT VARCHAR2,
                                      P_RET_OVA_SPID           OUT VARCHAR2) 
                                      IS
    V_OP_LOG_TYPE USER_OP_LOG_TYPE := USER_OP_LOG_TYPE(NULL,NULL,NULL,NULL,NULL,NULL,NULL);

    V_MNGATEWAY_ENTITY_ID ENTITY.ENTITY_ID%TYPE := NULL;
    V_OVA_SERVICE_ID      VARCHAR2(50) := NULL;
    V_OVA_SP_ID           VARCHAR2(50) := NULL;
    V_COUNT               NUMBER := 0;
    V_MANDATE_REQ_ID   DD_MANDATES.MANDATE_REQ_ID%TYPE;  -- variable to hold REQUEST_ID

BEGIN
    -- Generate log
    FORMAT_N_GENERATE_LOG(P_OP_LOG, V_OP_LOG_TYPE);

    -- Step 1: Check Pre-Approval ID existence
    SELECT COUNT(1)
      INTO V_COUNT
      FROM DD_MANDATES
     WHERE GATEWAY_REFERENCE_ID = P_PREAPPROVAL_ID;

    IF V_COUNT = 0 THEN
        -- PreApproval not found
        P_EXISTING_REQUEST_ID := 0;
        P_RESPONSE_CODE := -99;
        P_RESPONSE_DESC := 'PreApproval ID does not exist: ' || P_PREAPPROVAL_ID;
        RETURN;
    END IF;

    -- If OVA IDs not passed, resolve them
    IF P_OVA_SERVICE_ID IS NULL THEN
        SELECT MN.ENTITY_ID
          INTO V_MNGATEWAY_ENTITY_ID
          FROM MOBILE_NETWORK MN
         WHERE MN.MOBILE_NETWORK_ID = P_NETWORK_ID;

        SYSTEM_PROCESS_UTIL.GET_PAYMODE_ENTITY_OVA_CONFIG(
            P_PM_PROVIDER_ENTITY_ID => V_MNGATEWAY_ENTITY_ID,
            P_MERCHANT_ENTITY_ID    => P_MERCHANT_ENTITY_ID,
            P_FEE_TYPE_ID           => NULL,
            P_IS_PRE_AUTH_ENABLED   => 1,
            P_OVA_SERVICEID         => V_OVA_SERVICE_ID,
            P_OVA_SPID              => V_OVA_SP_ID
        );
    ELSE
        V_OVA_SERVICE_ID := P_OVA_SERVICE_ID;
        V_OVA_SP_ID      := P_OVA_SP_ID;
    END IF;

    P_RET_OVA_SERVCEID := V_OVA_SERVICE_ID;
    P_RET_OVA_SPID     := V_OVA_SP_ID;

    -- Insert into DD_MANDATE_REQUEST
    INSERT INTO DD_MANDATE_REQUEST
      (REQUEST_ID,
       REQUEST_DATE,
       MERCHANT_ENTITY_ID,
       MERCHANT_REF_ID,
       NARRATION,
       PLATFORM_SCHEDULING,
       MOBILE,
       NETWORK_ID,
       AMOUNT,
       CURRENCY_ID,
       FREQUENCY_ID,
       START_DATE,
       END_DATE,
       DAY_OF_DEBIT,
       OVA_SERVICE_ID,
       OVA_SP_ID,
       STATUS_CODE,
       STATUS_MESSAGE,
       SYSTEM_REFERENCE_ID,
       GATEWAY_REFERENCE_ID,
       GATEWAY_STATUS_MESSAGE,
       RESPONSE_DATE,
       POST,
       LOG_ID)
    VALUES
      (SEQ_DD_MANDATE_REQUEST.NEXTVAL,
       P_REQUEST_DATE,
       P_MERCHANT_ENTITY_ID,
       P_MERCHANT_REF_ID,
       P_NARRATION,
       P_PLATFORM_SCHEDULING,
       P_MOBILE,
       P_NETWORK_ID,
       P_AMOUNT,
       P_CURRENCY_ID,
       P_FREQUENCY_ID,
       P_START_DATE,
       P_END_DATE,
       P_DAY_OF_DEBIT,
       V_OVA_SERVICE_ID,
       V_OVA_SP_ID,
       P_STATUS_CODE,
       P_STATUS_MESSAGE,
       P_SYSTEM_REFERENCE_ID,
       P_GATEWAY_REFERENCE_ID,
       P_GATEWAY_STATUS_MESSAGE,
       P_RESPONSE_DATE,
       P_POST,
       V_OP_LOG_TYPE.LOG_ID)
    RETURNING REQUEST_ID INTO V_MANDATE_REQ_ID;

    -- Insert into DD_MANDATES

    INSERT INTO DD_MANDATES
        (MANDATE_ID,
         DD_CONFIG_DATE,
         MANDATE_REQ_ID,
         MERCHANT_ENTITY_ID,
         MERCHANT_REF_ID,
         MOBILE,
         NETWORK_ID,
         NARRATION,
         CURRENCY_ID,
         FREQUENCY_ID,
         NO_OF_INSTALLMENTS,
         START_DATE,
         END_DATE,
         DAY_OF_DEBIT,
         IS_PRE_AUTH_ENABLED,
         PLATFORM_SCHEDULING,
         OVA_SERVICE_ID,
         OVA_SP_ID,
         STATUS_CODE,
         STATUS_MESSAGE,
         SYSTEM_REFERENCE_ID,
         GATEWAY_REFERENCE_ID,
         GATEWAY_STATUS_MESSAGE,
         RESPONSE_DATE,
         LAST_UPDATE,
         POST,
         LOG_ID)
    VALUES
        (SEQ_DD_MANDATE_CONFIG.NEXTVAL,
         SYSDATE,
         V_MANDATE_REQ_ID,
         P_MERCHANT_ENTITY_ID,
         P_MERCHANT_REF_ID,
         P_MOBILE,
         P_NETWORK_ID,
         P_NARRATION,
         P_CURRENCY_ID,
         P_FREQUENCY_ID,
         NULL,
         P_START_DATE,
         P_END_DATE,
         P_DAY_OF_DEBIT,
         1,
         P_PLATFORM_SCHEDULING,
         V_OVA_SERVICE_ID,
         V_OVA_SP_ID,
         P_STATUS_CODE,
         P_STATUS_MESSAGE,
         P_SYSTEM_REFERENCE_ID,
         P_GATEWAY_REFERENCE_ID,
         P_GATEWAY_STATUS_MESSAGE,
         P_RESPONSE_DATE,
         SYSDATE,
         1,
         V_OP_LOG_TYPE.LOG_ID)
           RETURNING MANDATE_ID INTO P_EXISTING_REQUEST_ID;

    -- Final response
    P_RESPONSE_CODE := 1;
    P_RESPONSE_DESC := 'Mandate successfully created with Request ID: ' || P_EXISTING_REQUEST_ID;

EXCEPTION
    WHEN OTHERS THEN
        P_RESPONSE_CODE := -1;
        P_RESPONSE_DESC := 'An error occurred: ' || SQLERRM;
END CREATE_DD_MANDATE_WITH_PREAPPROVAL;



END DD_MANDATE_UTIL;
/
