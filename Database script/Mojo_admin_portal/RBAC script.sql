select * from module;
select * from trn_operations;
select * from operation;
select * from trn_code order by 1 desc;
select * from trn_module;
select * from Role_Detail;
select * from entity;
select * from users;
select * from USER_ROLE;
select * from Entity where entity_id=55;
select * from role_detail where role_id=2;
SELECT * FROM Role_Detail ORDER BY 1 DESC;

DROP TRIGGER trn_id_trigger;
DROP SEQUENCE trn_id_seq;

--inital query to fetch user roles
 SELECT UR.role_id, UR.role_description, 
 UR.entity_id, UR.post, UR.log_id,RD.row_id, 
 RD.trn_id, RD.opr_id, RD.block,TC.menu_label,TC.Menu_Url,OP.OPR_SHORT_DESC
 FROM USER_ROLE UR 
 INNER JOIN ROLE_DETAIL RD ON UR.role_id = RD.role_id
 LEFT JOIN TRN_CODE TC ON RD.trn_id = TC.trn_id 
 LEFT JOIN operation OP ON RD.OPR_ID = OP.OPR_ID
 WHERE UR.role_id =2;


--inital query to fetch user roles
SELECT rd.ROLE_ID, rd.TRN_ID, tc.DESCRIPTION, tc.TRN_SHORT_DESC, tc.MENU_LABEL, tc.MENU_URL, tc.MODULE_CODE
                    FROM role_detail rd 
                    INNER JOIN trn_code tc ON rd.TRN_ID = tc.TRN_ID 
                    WHERE rd.role_id = 2;
         
INSERT INTO ROLE_DETAIL (row_id, role_id, trn_id, opr_id)
VALUES (13, 2, 5, 1);           

--final query to get user roles
  SELECT UR.role_id, UR.role_description, UR.entity_id,
  UR.post, UR.log_id,RD.row_id, RD.trn_id, RD.opr_id,
  RD.block,TC.menu_label,TC.Menu_Url,TC.trn_short_desc,OP.opr_description 
  FROM USER_ROLE UR INNER JOIN ROLE_DETAIL RD ON UR.role_id = RD.role_id 
  LEFT JOIN TRN_CODE TC ON RD.trn_id = TC.trn_id 
  LEFT JOIN operation OP ON RD.OPR_ID = OP.OPR_ID WHERE UR.role_id =2;                    


create table OPERATION
(
  opr_id          NUMBER(5) not null,
  opr_description VARCHAR2(100) not null,
  opr_short_desc  VARCHAR2(30) not null,
  post            NUMBER(1) default 0 not null,
  log_id          NUMBER(12) not null
)
tablespace CSGDEVDBTBS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
-- Create/Recreate indexes 
create index IX_OPERATION_LOG on OPERATION (LOG_ID)
  tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
-- Create/Recreate primary, unique and foreign key constraints 
alter table OPERATION
  add constraint PK_OPERATION primary key (OPR_ID)
  using index 
  tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter index PK_OPERATION nologging;
alter table OPERATION
  add constraint UQ_OPERATION_DESC unique (OPR_DESCRIPTION)
  using index 
  tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter index UQ_OPERATION_DESC nologging;
alter table OPERATION
  add constraint UQ_OPERATION_SHORTDESC unique (OPR_SHORT_DESC)
  using index 
  tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter index UQ_OPERATION_SHORTDESC nologging;
alter table OPERATION
  add constraint FK_OPERATION_LOG foreign key (LOG_ID)
  references USER_OP_LOG (LOG_ID);
-- Create/Recreate check constraints 
alter table OPERATION
  add constraint CHK_OPERATION_POST
  check (POST IN (0, 1));
  
  
  -- TRN_MODULE table script
  
  create table TRN_MODULE
(
  module_code NUMBER(5) not null,
  trn_id      NUMBER(12) not null
)
tablespace CSGDEVDBTBS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
-- Create/Recreate primary, unique and foreign key constraints 
alter table TRN_MODULE
  add constraint PK_TRN_MODULE primary key (MODULE_CODE, TRN_ID)
  using index 
  tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter index PK_TRN_MODULE nologging;

  
  
