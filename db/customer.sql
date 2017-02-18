--------------------------------------------------------
--  File created - воскресенье-февраля-19-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "STUDENT"."CUSTOMER" 
   (	"CUSTOMER_ID" NUMBER, 
	"FIRST_NAME" VARCHAR2(50 BYTE), 
	"LAST_NAME" VARCHAR2(50 BYTE), 
	"MIDDLE_NAME" VARCHAR2(50 BYTE), 
	"ADDRESS_LINE1" VARCHAR2(80 BYTE), 
	"ADDRESS_LINE2" VARCHAR2(80 BYTE), 
	"CITY" VARCHAR2(40 BYTE), 
	"COUNTRY" VARCHAR2(50 BYTE), 
	"DATE_ADDED" DATE, 
	"REGION" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into STUDENT.CUSTOMER
SET DEFINE OFF;
Insert into STUDENT.CUSTOMER (CUSTOMER_ID,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,ADDRESS_LINE2,CITY,COUNTRY,DATE_ADDED,REGION) values ('10','JOHN','AMIRTHRAJ','T','2345 PETERDRIVE',null,'Atlanta','USA',to_date('12.01.15','DD.MM.RR'),'SOUTH');
Insert into STUDENT.CUSTOMER (CUSTOMER_ID,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,ADDRESS_LINE2,CITY,COUNTRY,DATE_ADDED,REGION) values ('11','TOM','JOSEPH','A','123SANDY DRIVE',null,'New York','USA',to_date('12.01.15','DD.MM.RR'),'SOUTH');
Insert into STUDENT.CUSTOMER (CUSTOMER_ID,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,ADDRESS_LINE2,CITY,COUNTRY,DATE_ADDED,REGION) values ('12','PETER','MANN','J','3456 GATES DRIVE',null,'Washington','USA',to_date('13.01.15','DD.MM.RR'),'NORTH');
Insert into STUDENT.CUSTOMER (CUSTOMER_ID,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,ADDRESS_LINE2,CITY,COUNTRY,DATE_ADDED,REGION) values ('130','JEFF','AFONSO','A','23 SUWANEE RD',null,'ALPHARETTA','USA',to_date('01.02.17','DD.MM.RR'),'south');