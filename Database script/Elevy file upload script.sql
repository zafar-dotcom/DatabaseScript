select * from Ep_Elevy_Remittance_batch_file order by 1 desc;
ALTER TABLE Ep_Elevy_Remittance_batch_file
ADD Trnx_ID ;

--add column
--ALTER TABLE Ep_Elevy_Remittance_batch_file
--ADD Transaction_date  ;

alter table EP_ELEVY_REMITTANCE_BATCH_FILE modify status_message VARCHAR2(1000);


FILE_UPLOAD_UTIL.PROCESS_ELEVY_CASHOUT_EP_FILE





--rename column
--ALTER TABLE Ep_Elevy_Remittance_batch_file
--RENAME COLUMN  Trnx_ID TO Transaction_ID;


select * from remittance_register order by 1 desc;
select * from bank_register order by 1 desc;

--
select * from ep_elevy_remittance_batch_file r where r.batch_no=9532201;
select * from remitt_reg_taxation order by 1 desc;
drop Ep_Elevy_Remittance_batch_file;
CREATE TABLE Ep_Elevy_Remittance_batch_file(
    Transaction_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    TXN_DATE DateTime,
    InterPay_Ref_No VARCHAR2(100),
    Activity VARCHAR2(100),
    Currency VARCHAR2(10),
    Merchant_Ref_Code VARCHAR2(50),
    Amount NUMBER,
    Gross_Commission NUMBER,
    VAT NUMBER,
    Net_To_Customer NUMBER,
    Balance NUMBER,
    Cashout_Type VARCHAR2(20),
    Mobile VARCHAR2(20),
    Mobile_Network VARCHAR2(50),
    Acct_No VARCHAR2(20),
    Account_Title VARCHAR2(100),
    Bank_Branch VARCHAR2(100),
    Remarks VARCHAR2(200),
    Taxable_Amount NUMBER,
    Elevy_Tax_Amount NUMBER,
    Status_Code NUMBER,
    Status_Message VARCHAR2(100)
);

