select * from entity where entity_id=149803;
select * from entity_api_credentials where app_id='2367618162';

ENTITY_SETUP_UTIL.CREATE_GENERAL_MERCHANT

ENTITY_URL_POSTFIX
select * from ENTITY_SETUP_DET where entity_email='mohammadzafarft12555@gmail.com';
select main_entity_id from entity_url where upper(login_url)='ZAFAR';
select * from entity where entity_id in (select main_entity_id from entity_url where upper(login_url)='ZAFAR');
IS_INTERPAY_PARTNER
update entity set IS_INTERPAY_PARTNER=0 where entity_id=149923;
