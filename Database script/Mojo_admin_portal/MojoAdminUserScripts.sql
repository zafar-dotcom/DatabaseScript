select * from entity order by 1 desc;

select * from users;



insert into entity (ENTITY_ID, ENTITY_CODE, ENTITY_TYPE_ID, ENTITY_FIRST_NAME, ENTITY_MIDDLE_NAME, ENTITY_LAST_NAME, REGISTRATION_DATE, ENTITY_NATURE_ID, MALE_OR_FEMALE, BIRTH_DATE, ENTITY_SHORT_NAME, IS_PARTNER_MERCHANT, PARENT_ENTITY_ID, ACTIVE, LOG_ID)
values (1, 'ADMIN', 1, 'MOJO ADMIN', null, '', to_date('19-09-2023 12:19:52', 'dd-mm-yyyy hh24:mi:ss'), 2, 'M', to_date('16-04-1963', 'dd-mm-yyyy'), 'ADMIN', 0, null, 1, 0);




select * from entity;
insert into users
  (user_id, user_name, mobile_no, password,ENTITY_ID,ROLE_ID, post,LOG_ID)
values
  (1,
   'ZEESHANILYAS002@GMAIL.COM',
   '+923060506473',
   '4OVVVeIESRc57x1nQdebFE+Z85b2aaDLi6mq7IfcHs6A9fwv',1,1,
   1,0);

insert into users
  (user_id, user_name, mobile_no, password,ENTITY_ID,ROLE_ID, post,LOG_ID)
values
  (12,
   'ADMIN',
   '+92000000000',
   '4OVVVeIESRc57x1nQdebFE+Z85b2aaDLi6mq7IfcHs6A9fwv',1,1,
   1,0);
