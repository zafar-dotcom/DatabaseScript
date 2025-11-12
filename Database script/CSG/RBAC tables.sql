select * from module;
select * from operation;
select * from trn_code;
select * from trn_operations;
select * from trn_module;
select * from user_role;
select * from ROLE_DETAIL;

select * from users;
select * from entity;


update users u set u.password='XVnPLDwAm6QBN8yGlvI1/3sfMUjO9/UsE+KLZJg4QAC9SrHk' where u.user_id=5000;  
update entity e set e.entity_code='Techfin' where e.entity_id=8;
insert into user_role (ROLE_ID, ROLE_DESCRIPTION, POST, LOG_ID, ENTITY_ID)
values (1, 'ADMINISTRATOR', 1, 0, null);


insert into module (MODULE_CODE, MODULE_DESCRIPTION, DISPLAY_LABEL, PARENT, PRIORITY_LEVEL, POST, LOG_ID, ICON_CLASS, COMMENTS)
values (1, 'Techfin Admin', 'Admin', null, 11, 1, 1, 'icon-list', 'momo techfin');

INSERT INTO USER_OP_LOG (LOG_ID, USER_ID, TRN_CODE, OPR_CODE, SERVER_DATE, TERMINAL_ID, REMARKS)
VALUES (1, 1001, 2001, 301, SYSDATE, 'Terminal_01', 'Initial log entry');
INSERT INTO USER_OP_LOG (LOG_ID, USER_ID, TRN_CODE, OPR_CODE, SERVER_DATE, TERMINAL_ID, REMARKS)
VALUES (0, 1001, 2001, 301, SYSDATE, 'Terminal_01', 'Initial log entry');



    
    
    




insert into operation (OPR_ID, OPR_DESCRIPTION, OPR_SHORT_DESC, POST, LOG_ID)
values (1, 'View', 'VIEW', 1, 0);

insert into operation (OPR_ID, OPR_DESCRIPTION, OPR_SHORT_DESC, POST, LOG_ID)
values (2, 'Save', 'SAVE', 1, 0);

insert into operation (OPR_ID, OPR_DESCRIPTION, OPR_SHORT_DESC, POST, LOG_ID)
values (3, 'Update', 'UPDT', 1, 0);

insert into operation (OPR_ID, OPR_DESCRIPTION, OPR_SHORT_DESC, POST, LOG_ID)
values (4, 'Delete', 'DLTE', 1, 0);

insert into operation (OPR_ID, OPR_DESCRIPTION, OPR_SHORT_DESC, POST, LOG_ID)
values (5, 'Post', 'POST', 1, 0);

insert into operation (OPR_ID, OPR_DESCRIPTION, OPR_SHORT_DESC, POST, LOG_ID)
values (6, 'Unpost', 'UPST', 1, 0);

insert into operation (OPR_ID, OPR_DESCRIPTION, OPR_SHORT_DESC, POST, LOG_ID)
values (7, 'Reject', 'REJ', 1, 0);

insert into operation (OPR_ID, OPR_DESCRIPTION, OPR_SHORT_DESC, POST, LOG_ID)
values (8, 'Password Reset', 'PRSET', 1, 0);

insert into operation (OPR_ID, OPR_DESCRIPTION, OPR_SHORT_DESC, POST, LOG_ID)
values (9, 'Approve', 'APR', 1, 0);



insert into ROLE_DETAIL (ROW_ID, ROLE_ID, TRN_ID, OPR_ID, BLOCK)
values (34158, 11, 256, 1, 0);






