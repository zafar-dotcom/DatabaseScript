drop table ADMIN_PORTAL_USERS;

-- Create table
create table ADMIN_PORTAL_USERS
(
  user_id     NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  user_name   VARCHAR2(100) not null,
  first_name  VARCHAR2(100) not null,
  last_name   VARCHAR2(100),
  mobile_no   varchar2(30) ,
  user_email  VARCHAR2(100)   not null,
  password    NVARCHAR2(200) not null,
  entity_id   NUMBER(12) not null,
  role_id     NUMBER(12) not null,
  isActive    VARCHAR2(10) default 0,
  is_mfa_enable number(1) default 0,
  mfa_type    number,
  post        NUMBER(1) default 0 not null,
  log_id      NUMBER(12) not null
);


alter table ADMIN_PORTAL_USERS
  add constraint UQ_ADMIN_USER_EMAIL unique (USER_EMAIL);
  
alter table ADMIN_PORTAL_USERS
  add constraint UQ_ADMIN_USER_NAME unique (USER_NAME);
  
create table MFA_TYPE
(
  MFA_ID     NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  MFA_TYPE   VARCHAR2(100) not null,
  Description   VARCHAR2(100)  
)


-- Create/Recreate primary, unique and foreign key constraints 
alter table ADMIN_PORTAL_USERS
  add constraint FK_MFA_TYPE foreign key (MFA_TYPE)
  references mfa_type (MFA_ID);

select * from entity order by 1 desc;

select * from users;



insert into entity (ENTITY_ID, ENTITY_CODE, ENTITY_TYPE_ID, ENTITY_FIRST_NAME, ENTITY_MIDDLE_NAME, ENTITY_LAST_NAME, REGISTRATION_DATE, ENTITY_NATURE_ID, MALE_OR_FEMALE, BIRTH_DATE, ENTITY_SHORT_NAME, IS_PARTNER_MERCHANT, PARENT_ENTITY_ID, ACTIVE, LOG_ID)
values (124, 'ADMIN', 1, 'MOJO ADMIN', null, '', to_date('19-09-2023 12:19:52', 'dd-mm-yyyy hh24:mi:ss'), 2, 'M', to_date('16-04-1963', 'dd-mm-yyyy'), 'ADMIN', 0, null, 1, 0);


select * from entity;

insert into ADMIN_PORTAL_USERS
  ( user_name,first_name, mobile_no,user_email ,password,ENTITY_ID,ROLE_ID, post,LOG_ID)
values
  (
   'ADMIN',
   'MOJO ADMIN',
   '+92000000000','admin@gmail.com',
   '4OVVVeIESRc57x1nQdebFE+Z85b2aaDLi6mq7IfcHs6A9fwv',124,1,
   1,0);
   
insert into ADMIN_PORTAL_USERS
  ( user_name, first_name,mobile_no,user_email, password,ENTITY_ID,ROLE_ID, post,LOG_ID)
values
  (
   'ZEESHANILYAS002@GMAIL.COM','Zeeshan',
   '+923060506473','zeeshanilyas002@gmail.com',
   '4OVVVeIESRc57x1nQdebFE+Z85b2aaDLi6mq7IfcHs6A9fwv',124,1,
   1,0);



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
   
   
select * from MFA_TYPE order by 1 desc;

create table Register_Authenticator_APP
(
  Row_id         NUMBER generated always as identity primary key,
  user_id            NUMBER not null,  
  timestamp          TIMESTAMP(6) WITH TIME ZONE default CURRENT_TIMESTAMP,
  google_auth_appkey VARCHAR2(100),
  post               NUMBER(1),
  log_id             NUMBER
)
