create user student IDENTIFIED BY student;
grant connect,resource,dba to student;
grant create session, grant any privilege to student;
grant unlimited tablespace to student;