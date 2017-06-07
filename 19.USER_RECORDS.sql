create or replace procedure process_customer
( c_id in CUSTOMER.CUSTOMER_ID%type)
as
type customer_rec is record
(
  first_name varchar(50),
  last_name varchar(50)
);
  c_rec customer_rec;
begin
  select first_name, last_name into c_rec from customer where customer_id = c_id;
  c_rec.first_name := 'Вася';

  dbms_output.put_line('First Name: ' || c_rec.first_name);
  dbms_output.put_line('Last Name: ' || c_rec.last_name);
end;
/
