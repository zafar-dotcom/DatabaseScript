select * from ADMIN_PORTAL_USERS;

--drop table MFA_TYPE;

select * from MFA_TYPE;
create table MFA_TYPE
(
  MFA_ID     NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  MFA_TYPE   VARCHAR2(100) not null,
  Description   VARCHAR2(100)  
)

--drop table ADMIN_PORTAL_USERS;

--add confgigs in MFA_TYPE table
insert into MFA_TYPE
  ( MFA_TYPE, Description)
values
  (
   'EMAIL',
   'Send MFA OTP via email');
   
insert into MFA_TYPE
  ( MFA_TYPE, Description)
values
  (
   'GOOGLE_AUTHENTICATOR',
   'Send MFA OTP via email');


--admim_portal_users
create table ADMIN_PORTAL_USERS
(
  user_id       NUMBER generated always as identity,
  user_name     VARCHAR2(100) not null,
  first_name    VARCHAR2(100) not null,
  last_name     VARCHAR2(100),
  mobile_no     VARCHAR2(30),
  user_email    VARCHAR2(100) not null,
  password      NVARCHAR2(200) not null,
  entity_id     NUMBER(12) not null,
  role_id       NUMBER(12) not null,
  isactive      VARCHAR2(10) default 0,
  is_mfa_enable NUMBER(1) default 0,
  mfa_type      NUMBER,
  post          NUMBER(1) default 0 not null,
  log_id        NUMBER(12) not null
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table ADMIN_PORTAL_USERS
  add primary key (USER_ID)
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
alter table ADMIN_PORTAL_USERS
  add constraint UQ_ADMIN_USER_EMAIL unique (USER_EMAIL)
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
alter table ADMIN_PORTAL_USERS
  add constraint UQ_ADMIN_USER_NAME unique (USER_NAME)
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
alter table ADMIN_PORTAL_USERS
  add constraint FK_MFA_TYPE foreign key (MFA_TYPE)
  references MFA_TYPE (MFA_ID);

