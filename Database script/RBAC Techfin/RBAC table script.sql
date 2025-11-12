--Create table
create table MODULE
(
  module_code        NUMBER(5) not null,
  module_description VARCHAR2(50) not null,
  display_label      VARCHAR2(30) not null,
  parent             NUMBER(5),
  priority_level     NUMBER(5) not null,
  post               NUMBER(1) default 0 not null,
  log_id             NUMBER(12) not null,
  icon_class         VARCHAR2(50),
  comments           VARCHAR2(255)
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
create index IX_MODULE_LOG on MODULE (LOG_ID)
 -- tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 -- storage
  --(
    --initial 64K
    --next 1M
    --minextents 1
    --maxextents unlimited
  --)
  nologging;
create index IX_MODULE_PARENT on MODULE (PARENT)
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
  /*storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )*/
  nologging;
-- Create/Recreate primary, unique and foreign key constraints 
alter table MODULE
  add constraint TRN_MODULE_CODE_PK primary key (MODULE_CODE)
  using index 
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
/*  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/
alter index TRN_MODULE_CODE_PK nologging;
alter table MODULE
  add constraint UQ_MODULE_DESC unique (MODULE_DESCRIPTION)
  using index 
 -- tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/
alter index UQ_MODULE_DESC nologging;
alter table MODULE
  add constraint FK_MODULE_LOG foreign key (LOG_ID)
  references USER_OP_LOG (LOG_ID);
alter table MODULE
  add constraint FK_MODULE_PARENT foreign key (PARENT)
  references MODULE (MODULE_CODE);
alter table MODULE
  add constraint TRN_MODULE_CODE_FK foreign key (MODULE_CODE)
  references MODULE (MODULE_CODE);
-- Create/Recreate check constraints 
alter table MODULE
  add constraint CHK_MODULE_POST
  check (POST IN (0, 1));






-- end module 


-- Create table OPERATION
create table OPERATION
(
  opr_id          NUMBER(5) not null,
  opr_description VARCHAR2(100) not null,
  opr_short_desc  VARCHAR2(30) not null,
  post            NUMBER(1) default 0 not null,
  log_id          NUMBER(12) not null
)
/*tablespace CSGDEVDBTBS
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
nologging;*/
-- Create/Recreate indexes 
create index IX_OPERATION_LOG on OPERATION (LOG_ID)
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )*/
  nologging;
-- Create/Recreate primary, unique and foreign key constraints 
alter table OPERATION
  add constraint PK_OPERATION primary key (OPR_ID)
  using index 
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
  /*storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/
alter index PK_OPERATION nologging;
alter table OPERATION
  add constraint UQ_OPERATION_DESC unique (OPR_DESCRIPTION)
  using index 
 -- tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  ); */
alter index UQ_OPERATION_DESC nologging;
alter table OPERATION
  add constraint UQ_OPERATION_SHORTDESC unique (OPR_SHORT_DESC)
  using index 
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/
alter index UQ_OPERATION_SHORTDESC nologging;
alter table OPERATION
  add constraint FK_OPERATION_LOG foreign key (LOG_ID)
  references USER_OP_LOG (LOG_ID);
-- Create/Recreate check constraints 
alter table OPERATION
  add constraint CHK_OPERATION_POST
  check (POST IN (0, 1));




-- end table OPERATION


-- Create table  TRN_CODE
create table TRN_CODE
(
  trn_id         NUMBER(12) not null,
  description    VARCHAR2(100) not null,
  trn_short_desc VARCHAR2(50) not null,
  menu_label     VARCHAR2(50),
  menu_url       VARCHAR2(255),
  module_code    NUMBER(5) not null,
  priority_level NUMBER(5),
  post           NUMBER(1) default 0 not null,
  log_id         NUMBER(12) not null
)
/*tablespace CSGDEVDBTBS
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
nologging; */
-- Create/Recreate indexes 
create index IX_TRN_CODE_LOG on TRN_CODE (LOG_ID)
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  ) */
  nologging;
create index IX_TRN_CODE_MODULE on TRN_CODE (MODULE_CODE)
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )*/
  nologging;
-- Create/Recreate primary, unique and foreign key constraints 
alter table TRN_CODE
  add constraint PK_TRN_ID primary key (TRN_ID)
  using index 
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/
alter index PK_TRN_ID nologging;
alter table TRN_CODE
  add constraint UQ_TRN_CODE_DESC unique (DESCRIPTION)
  using index 
 -- tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
  /*storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  ); */
alter index UQ_TRN_CODE_DESC nologging;
alter table TRN_CODE
  add constraint UQ_TRN_CODE_SHORTDESC unique (TRN_SHORT_DESC)
  using index 
 -- tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  ); */
alter index UQ_TRN_CODE_SHORTDESC nologging;
alter table TRN_CODE
  add constraint FK_TRN_CODE_LOG foreign key (LOG_ID)
  references USER_OP_LOG (LOG_ID);
alter table TRN_CODE
  add constraint FK_TRN_CODE_MODULE foreign key (MODULE_CODE)
  references MODULE (MODULE_CODE);
-- Create/Recreate check constraints 
alter table TRN_CODE
  add constraint CHK_TRN_CODE_POST
  check (POST IN (0, 1));




-- end table  TRN_CODE




-- Create table TRN_OPERATIONS
create table TRN_OPERATIONS
(
  trn_id NUMBER(12) not null,
  opr_id NUMBER(6) not null
)
--tablespace CSGDEVDBTBS
  pctfree 10
  initrans 1
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  ) */
nologging; 
-- Create/Recreate primary, unique and foreign key constraints 
alter table TRN_OPERATIONS
  add constraint TRN_OPER_PK primary key (TRN_ID, OPR_ID)
  using index 
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
  /*storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/
alter index TRN_OPER_PK nologging;


-- end table TRN_OPERATIONS



-- Create table TRN_MODULE
create table TRN_MODULE
(
  module_code NUMBER(5) not null,
  trn_id      NUMBER(12) not null
)
--tablespace CSGDEVDBTBS
  pctfree 10
  initrans 1
  maxtrans 255
  /*storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )*/
nologging;
-- Create/Recreate primary, unique and foreign key constraints 
alter table TRN_MODULE
  add constraint PK_TRN_MODULE primary key (MODULE_CODE, TRN_ID)
  using index 
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/
alter index PK_TRN_MODULE nologging;

-- end table TRN_MODULE




-- Create table USER_ROLE
create table USER_ROLE
(
  role_id          NUMBER(5) not null,
  role_description VARCHAR2(100) not null,
  post             NUMBER(1) default 0 not null,
  log_id           NUMBER(12) not null,
  entity_id        NUMBER(12)
)
--tablespace CSGDEVDBTBS
  pctfree 10
  initrans 1
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )*/
nologging;
-- Create/Recreate indexes 
create index IX_USER_ROLE_ENTITY on USER_ROLE (ENTITY_ID)
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )*/
  nologging;
-- Create/Recreate primary, unique and foreign key constraints 
alter table USER_ROLE
  add constraint PK_USER_ROLE primary key (ROLE_ID)
  using index 
 -- tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/
alter index PK_USER_ROLE nologging;
alter table USER_ROLE
  add constraint UQ_USER_ROLE_ENTITY unique (ROLE_DESCRIPTION, ENTITY_ID)
  using index 
  --tablespace CSGDEVDBTBS
  pctfree 10
  initrans 2
  maxtrans 255
 /* storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );*/
alter index UQ_USER_ROLE_ENTITY nologging;
alter table USER_ROLE
  add constraint FK_USER_ROLE_ENTITY foreign key (ENTITY_ID)
  references ENTITY (ENTITY_ID);




-- end table USER_ROLE


-- Create table
