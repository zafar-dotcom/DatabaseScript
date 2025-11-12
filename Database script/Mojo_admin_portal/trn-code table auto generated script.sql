-- Create table
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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IX_TRN_CODE_MODULE on TRN_CODE (MODULE_CODE)
  tablespace USERS
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table TRN_CODE
  add constraint PK_TRN_ID primary key (TRN_ID)
  using index 
  tablespace USERS
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
alter table TRN_CODE
  add constraint UQ_TRN_CODE_DESC unique (DESCRIPTION)
  using index 
  tablespace USERS
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
alter table TRN_CODE
  add constraint UQ_TRN_CODE_SHORTDESC unique (TRN_SHORT_DESC)
  using index 
  tablespace USERS
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
alter table TRN_CODE
  add constraint FK_TRN_CODE_MODULE foreign key (MODULE_CODE)
  references MODULE (MODULE_CODE);
-- Create/Recreate check constraints 
alter table TRN_CODE
  add constraint CHK_TRN_CODE_POST
  check (POST IN (0, 1));
