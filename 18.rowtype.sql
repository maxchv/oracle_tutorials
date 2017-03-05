CREATE OR REPLACE PROCEDURE process_customer(
    c_id CUSTOMER.CUSTOMER_ID%TYPE)
AS
  c_rec customer%rowtype;
--  c_customerid CUSTOMER.CUSTOMER_ID%TYPE;
--  c_fname CUSTOMER.FIRST_NAME%TYPE;
--  c_lname CUSTOMER.LAST_NAME%TYPE;
--  c_mname CUSTOMER.MIDDLE_NAME%TYPE;
--  c_addr1 CUSTOMER.ADDRESS_LINE1%TYPE;
--  c_addr2 CUSTOMER.ADDRESS_LINE2%TYPE;
--  c_city CUSTOMER.city%type;
--  c_country CUSTOMER.country%type;
--  c_date_added CUSTOMER.date_added%type;
--  c_region CUSTOMER.region%type;
BEGIN
  SELECT *
--    customer_id,
--    first_name,
--    last_name,
--    middle_name,
--    address_line1,
--    address_line2,
--    city,
--    country,
--    date_added,
--    region
  INTO 
    c_rec
-- c_customerid,
--    c_fname,
--    c_lname,
--    c_mname,
--    c_addr1,
--    c_addr2,
--    c_city,
--    c_country,
--    c_date_added,
--    c_region
  FROM customer
  WHERE customer_id = c_id;
  SHOW_CUSTOMER(c_rec);
  -- INSERT_CUSTOMER(c_rec);
  c_rec.first_name := 'Max';
  UPDATE_CUSTOMER(c_rec);
--    dbms_output.put_line('First Name:' || c_rec.first_name);
--    dbms_output.put_line('Last Name:' || c_rec.last_name);
--  dbms_output.put_line('First Name:' || c_fname);
--  dbms_output.put_line('Last Name:' || c_lname);
--  dbms_output.put_line('Middle Name:' || c_mname);
--  dbms_output.put_line('Address Line1:' || c_addr1);
--  dbms_output.put_line('Address Line2:' || c_addr2);
--  dbms_output.put_line('City:' || c_city);
--  dbms_output.put_line('Country:' || c_country);
--  dbms_output.put_line('Date added:' || c_date_added);
--  dbms_output.put_line('Region:' || c_region);
END;

CREATE OR REPLACE PROCEDURE show_customer(
    c_rec customer%rowtype )
AS
BEGIN
  dbms_output.put_line('First Name:' || c_rec.first_name);
  dbms_output.put_line('Last Name:' || c_rec.last_name);
END show_customer;

CREATE OR REPLACE PROCEDURE insert_customer(
    c_rec customer%rowtype )
AS
BEGIN
  insert into customer values c_rec;
END insert_customer;

exec PROCESS_CUSTOMER(10);

CREATE OR REPLACE PROCEDURE update_customer(
    c_rec customer%rowtype)
AS
BEGIN
  update customer set row=c_rec where customer_id = c_rec.customer_id;
END update_customer;

CREATE OR REPLACE PROCEDURE custom_record(
    c_id customer.customer_id%type )
AS
type customer_record
IS
  record
  (
    first_name CUSTOMER.FIRST_NAME%type,
    last_name CUSTOMER.LAST_NAME%type );
  c_rec customer_record;
BEGIN
  SELECT first_name,
    last_name
  INTO c_rec
  FROM customer
  WHERE customer_id = c_id;
  dbms_output.put_line('First Name: ' || c_rec.first_name);
  dbms_output.put_line('Last Name: ' || c_rec.last_name);
END custom_record;

exec PROCESS_CUSTOMER(11);
exec CUSTOM_RECORD(11);

select * from customer where customer_id=11;