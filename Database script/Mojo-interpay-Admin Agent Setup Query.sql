select * from biller_info order by 1 desc;
select * from ACCOUNT_SIGNUP order by 1 desc;
select * from ACCOUNT_SIGNUP where row_id=1006;
select * from IMPORT_BILL_INQUIRY order by 1 desc;
select * from ENTITY_ACCOUNT_PROFILE order by 1 desc;
select * from users order by 1 desc;
select * from ENTITY_ACCOUNT order by 1 desc;
select * from entity order by 1 desc;








SELECT COUNT(*) FROM Users WHERE USER_NAME=+920304712024;
select * from Entity where  ENTITY_ID = 162 AND ENTITY_TYPE_ID = 2;
SELECT * FROM ACCOUNT_SIGNUP TR WHERE TR.ENTITY_ID IS NULL
select * from Occupation order by NAME ASC;
select * from income_bracket;
select * from Occupation order by NAME ASC;
select * from ENTITY order by  1 ASC;  
select * from ENTITY where entity_id=95;
select * from ACCOUNT_SIGNUP order by 1 asc;
select * from USERS order by 1 desc; 
select * from ADMIN_PORTAL_USERS order by 1 desc;  
select * from ENTITY where entity =179; 
select * from currency; 
select * from ENTITY_WALLET ;
currency
select * from  TODAY_WALLET_BALANCE where wallet_id=428; 
select * from MFA_TYPE;
select * from Register_Authenticator_APP;
 select et.entity_type_id,et.entity_type_code from entity_type et where et.entity_type_id in (1,2,3);
 select e.entity_id, e.entity_code from entity e where e.entity_type_id =1; 
 select c.currency_id, c.currency_name from currency c where c.currency_id in (34,2);
 select e.entity_id,e.entity_code from entity e where e.entity_type_id=1;
select e.entity_id,e.entity_code from entity e where e.entity_type_id=3;
select * from Register_Authenticator_APP;
UPDATE Register_Authenticator_APP
SET google_auth_appkey = NULL
WHERE row_id = 1;


SELECT
      E.entity_first_name AS entityname,
      E.entity_code AS code,
      W.wallet_code,
      W.wallet_id,
      TWB.amount AS balance
    FROM ENTITY E
    JOIN ENTITY_ACCOUNT EA ON E.entity_id = EA.entity_id
    JOIN ENTITY_WALLET W ON EA.entity_account_id = W.entity_account_id
    LEFT JOIN TODAY_WALLET_BALANCE TWB ON W.wallet_id = TWB.wallet_id
    WHERE W.currency_id = 2
    AND E.entity_id = 138;


 
 
