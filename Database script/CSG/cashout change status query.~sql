--cancel status_code = 4 , status_desc = CANCELLED  ...
--failed  status_code = 0 , status_desc = FAILED  ...
--success status_code = 1 , status_desc = SUCCESS  ...
--Description of statuses:
--we have an expiryDate field. If the transaction is not processed before the expiry time, it will receive the CO_EXPIRED status and will not be processed further
--Final statuses CO_SUCCESS, CO_FAILED, CO_EXPIRED, and CO_CANCELLED cannot be updated; 
--only transient statuses can be modified. LIKE CO_PENDING, CO_INCLEARING, CO_CONFLICTING. 


select * from bank_register br where br.remittance_reg_transid in (
'9178612',
'9178626',
'9178629'
)
select * from bank_register order by 1 desc;    --transaction_id of remittance register is foreign key (remittance_reg_transid)in bank_register
select * from remittance_register rr where rr.x_trans_reference_no in (
'RCL9597348445',
'RCL0997906421',
'RCL1914788433') ;  --its transaction_id is foreign_key in bank_register as remittance_reg_transid



UPDATE remittance_register rr
SET rr.is_paid = 0,
    rr.status_code = 4,
    rr.status_desc = 'CANCELLED'
WHERE rr.x_trans_reference_no IN (
    'RCL9597348445',
    'RCL0997906421',
    'RCL1914788433'
);

 
 
UPDATE BANK_REGISTER BR
SET BR.POST_XFR_RESPONSE_STATUS_CODE = 0,
    BR.POST_XFR_RESPONSE_STATUS_DESC = 'FAILED'
WHERE BR.REMITTANCE_REG_TRANSID IN (
   '9178612',
'9178626',
'9178629'
);

TRANSACTION_ID
select * from SYSTEM_TRANSACTION order by 1 desc;

--to check all the foreign key its table parent and child key a table have

SELECT
    c.constraint_name AS fk_name,
    cc.column_name     AS child_column,
    c_pk.table_name    AS parent_table,
    cc_pk.column_name  AS parent_column
FROM all_constraints c
JOIN all_cons_columns cc 
    ON c.constraint_name = cc.constraint_name
   AND c.owner = cc.owner
JOIN all_constraints c_pk 
    ON c.r_constraint_name = c_pk.constraint_name
   AND c_pk.owner = c.owner
JOIN all_cons_columns cc_pk 
    ON c_pk.constraint_name = cc_pk.constraint_name
   AND cc_pk.owner = c_pk.owner
   AND cc.position = cc_pk.position
WHERE c.constraint_type = 'R'            -- Foreign keys only
  AND c.table_name = 'BANK_REGISTER'     -- Your table name
ORDER BY c.constraint_name;

  
  



-- to check of which table a coulmn is foreign key of 

SELECT
    c.constraint_name,
    c.table_name AS child_table,
    cc.column_name AS child_column,
    c_pk.table_name AS parent_table,
    cc_pk.column_name AS parent_column
FROM all_constraints c
JOIN all_cons_columns cc 
    ON c.constraint_name = cc.constraint_name AND c.owner = cc.owner
JOIN all_constraints c_pk 
    ON c.r_constraint_name = c_pk.constraint_name AND c_pk.owner = c.owner
JOIN all_cons_columns cc_pk 
    ON c_pk.constraint_name = cc_pk.constraint_name AND cc_pk.owner = c_pk.owner
WHERE c.constraint_type = 'R'       -- Foreign key
  AND c.table_name = 'BANK_REGISTER'
  AND cc.column_name = 'REMITTANCE_REG_TRANSID';


--TO Check which value should be used E.G POST_XFR_RESPONSE_STATUS_CODE IN (0,1,2,3 ,8) ALLOWED

SELECT constraint_name, search_condition
FROM all_constraints
WHERE table_name = 'BANK_REGISTER'
  AND constraint_name = 'CHK_BANK_REGISTER_PXRSTATUS';
  
  
--Understand Different Types of Constraints
--Constraint Type Code  Purpose
--Primary Key   P     Uniquely identifies each row
--Foreign Key    R    Links a column to another table’s column
--Unique         U     Ensures values in a column are unique
--Check         C     Ensures values meet a condition
--Not Null      C     Ensures column cannot have NULL values

  SELECT constraint_name, constraint_type, search_condition
FROM all_constraints
WHERE table_name = 'BANK_REGISTER';

  
  
  
  
 --Find All Tables That Reference BANK_REGISTER

SELECT a.table_name AS child_table, a.column_name AS child_column,
       c.constraint_name AS fk_name
FROM all_cons_columns a
JOIN all_constraints c
  ON a.constraint_name = c.constraint_name
WHERE c.constraint_type = 'R'
  AND c.r_constraint_name IN (
       SELECT constraint_name
       FROM all_constraints
       WHERE table_name = 'BANK_REGISTER'
       AND constraint_type IN ('P','U')
     );s




--Show All Columns and Their Data Types

SELECT column_name, data_type, data_length
FROM all_tab_columns
WHERE table_name = 'BANK_REGISTER';

or

SELECT 
    column_name, 
    data_type, 
    data_length, 
    data_precision, 
    data_scale, 
    nullable
FROM all_tab_columns
WHERE table_name = 'ENTITY_WALLET_TOPUP_REQUEST'
ORDER BY column_id;

