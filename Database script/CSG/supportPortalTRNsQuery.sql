select * from module ;
select * from module order by 1 desc;
select * from trn_module;
select * from trn_code order by 1 desc;
select * from trn_code c where c.trn_id=349 order by 1 desc;
select * from trn_module tm where tm.trn_id in (403,404);
select * from role_detail rd where rd.trn_id in (403,404);
select * from operation order by 1 desc;

select * from trn_operations o where o.trn_id in (403,404) order by 1 desc;
select * from entity_type order by 1  desc;
select * from entity_type_module order by 1 desc;

insert into module (MODULE_CODE, MODULE_DESCRIPTION, DISPLAY_LABEL, PARENT, PRIORITY_LEVEL, POST, LOG_ID, ICON_CLASS, COMMENTS)
values (69, 'Support Trnsaction', 'Transactions', null, 11, 1, 0, 'icon-file-text', null);

insert into entity_type_module (ENTITY_TYPE_ID, MODULE_CODE, POST)
values (13, 69, 1);

declare
  v_trn_id           trn_code.trn_id%type := 403;
  v_description      varchar2(100) := 'Transaction Search One UI';
  v_trn_short_desc   varchar2(100) := 'Transaction Search One UI';
  v_menu_label       varchar2(100) := 'Transaction Search One UI';
  v_menu_url         varchar2(100) := '/CashOut/Transactions';
  v_priority_level   trn_code.priority_level%type := 200;
  v_trn_module_code  trn_module.module_code%type := 69;--Support
begin
  --select max(t.trn_id)+1 into v_trn_id from trn_code t;
  --select max(t.priority_level) into v_priority_level from trn_code t where t.module_code=v_trn_module_code;
  insert into trn_code
    (trn_id, description, trn_short_desc, menu_label, menu_url, module_code, priority_level, post, log_id)
  values
    (v_trn_id, v_description, v_trn_short_desc, v_menu_label, v_menu_url, v_trn_module_code, v_priority_level, 1, 0);

  insert into trn_module (module_code, trn_id)
  values (69, v_trn_id ); --Cashout

  insert into trn_operations (trn_id, opr_id)
  values (v_trn_id, 1);  ---1 FOR VIEW
  
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
   AND E.ENTITY_TYPE_ID = 13  -- FOR MERCHANT
   AND UR.ROLE_ID = U.ROLE_ID
   AND UPPER(UR.ROLE_DESCRIPTION) IN ('SUPERDEV')--,'ADMINISTRATOR')
   -- AND E.ENTITY_ID = 2 
   --AND E.ENTITY_CODE IN ('CSG')--,'BLUEPENGUIN')
   GROUP BY U.ROLE_ID
   ) R,
   TRN_CODE TC, OPERATION OP 
   WHERE TC.TRN_ID IN (v_trn_id) AND OP.OPR_ID IN(1);
end;













