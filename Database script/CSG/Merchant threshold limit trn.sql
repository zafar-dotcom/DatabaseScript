select * from trn_module;
select * from trn_code order by 1 desc;
select * from trn_operations;
select * from module order by 1 desc;
select * from operation order by 1 desc;
select * from operation;
select * from role_detail order by 1 desc;




select * from trn_code order by 1 desc;
--select * from module order by 1 desc;
declare
  v_trn_id           trn_code.trn_id%type := 409;
  v_description      varchar2(100) := 'Merchant Threshold Limit';
  v_trn_short_desc   varchar2(100) := 'Merchant Threshold Limit';
  v_menu_label       varchar2(100) := 'Merchant Threshold Limit';
  v_menu_url         varchar2(100) := '/Remittance/ThresholdConfig';
  v_priority_level   trn_code.priority_level%type := 200;
  v_trn_module_code  trn_module.module_code%type := 59;--float topup  from module table
begin
  --select max(t.trn_id)+1 into v_trn_id from trn_code t;
  --select max(t.priority_level) into v_priority_level from trn_code t where t.module_code=v_trn_module_code;
  insert into trn_code
    (trn_id, description, trn_short_desc, menu_label, menu_url, module_code, priority_level, post, log_id)
  values
    (v_trn_id, v_description, v_trn_short_desc, v_menu_label, v_menu_url, v_trn_module_code, v_priority_level, 1, 0);

  insert into trn_module (module_code, trn_id)
  values (59, v_trn_id ); --Cashout
 
 insert into trn_operations (trn_id, opr_id)
  values (v_trn_id, 1);  ---1 FOR VIEW
    insert into trn_operations (trn_id, opr_id)
  values (v_trn_id, 2);  ---1 FOR save
    insert into trn_operations (trn_id, opr_id)
  values (v_trn_id, 3);  ---1 FOR update
--=====================================================================
--ROLE_DETAIL
--=====================================================================
  INSERT INTO ROLE_DETAIL
  SELECT ROWNUM + (SELECT MAX(RD.ROW_ID) FROM ROLE_DETAIL RD),
   R.ROLE_ID,
   TC.TRN_ID,
   OP.OPR_ID,
   0
   FROM (SELECT U.ROLE_ID
   FROM ENTITY E, USERS U, USER_ROLE UR
   WHERE E.ENTITY_ID = U.ENTITY_ID
   AND E.ENTITY_TYPE_ID = 1 --1 for admin--13  -- FOR MERCHANT
   AND UR.ROLE_ID = U.ROLE_ID
   AND UPPER(UR.ROLE_DESCRIPTION) IN ('CSG ADMIN')--,'ADMINISTRATOR')
   -- AND E.ENTITY_ID = 2 
   --AND E.ENTITY_CODE IN ('CSG')--,'BLUEPENGUIN')
   GROUP BY U.ROLE_ID
   ) R,
   TRN_CODE TC, OPERATION OP 
   WHERE TC.TRN_ID IN (v_trn_id) AND OP.OPR_ID IN(1);
end;







