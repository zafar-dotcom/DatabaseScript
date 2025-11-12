--CREATE OR REPLACE FUNCTION GENERATE_SNAKEFLOW_ID
RETURN NUMBER
IS
    v_time1   VARCHAR2(20);
    v_time2   VARCHAR2(20);
    v_random  VARCHAR2(10);
    v_result  VARCHAR2(50);
    v_final   VARCHAR2(8);
BEGIN
    -- First system time with milliseconds
    v_time1 := TO_CHAR(SYSTIMESTAMP, 'YYYYMMDDHH24MISSFF3'); 

    -- Random number (6 digits)
    v_random := TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(100000, 999999)));

    -- Second system time
    v_time2 := TO_CHAR(SYSTIMESTAMP, 'HH24MISSFF3');

    -- Full combined string
    v_result := v_time1 || v_random || v_time2;

    -- Build 8-digit ID: 
    -- 2 from start, 2 from middle, 2 from near-end, 2 from end
    v_final := SUBSTR(v_result, 1, 2) ||
               SUBSTR(v_result, LENGTH(v_result)/2, 2) ||
               SUBSTR(v_result, LENGTH(v_result)-3, 2) ||
               SUBSTR(v_result, LENGTH(v_result)-1, 2);

    RETURN TO_NUMBER(v_final);
END;
/




-------------------Add column in the dd-mandates table for snow flake  id--------------------------

ALTER TABLE DD_MANDATES 
ADD (SYSTEM_MANDATE_ID NUMBER(8));


ALTER TABLE DD_MANDATES 
ADD CONSTRAINT uq_system_mandate_id UNIQUE (SYSTEM_MANDATE_ID);



-------------------Add column in the DD_RECURRING_PAYMENT table for snow  flake id--------------------------

ALTER TABLE DD_RECURRING_PAYMENT 
ADD (SYSTEM_MANDATE_ID NUMBER(8));


-------------------Add column in the DD_MANDATE_CANCELLATION table for snow  flake id--------------------------


ALTER TABLE DD_MANDATE_CANCELLATION 
ADD (SYSTEM_MANDATE_ID NUMBER(8));





