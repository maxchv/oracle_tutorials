create or replace procedure process_customer
( c_id in CUSTOMER.CUSTOMER_ID%type)
as
  c_rec customer%rowtype;
begin
  select * into c_rec from customer where customer_id = c_id;
  c_rec.first_name := 'Вася';
  show_customer(c_rec);
end;
/
create or replace procedure show_customer
( customer_in in customer%rowtype)
as
begin
  dbms_output.put_line('First Name: ' || customer_in.first_name);
  dbms_output.put_line('Last Name: ' || customer_in.last_name);
  -- insert into customer values customer_in;
  update customer set row=customer_in where CUSTOMER_ID = customer_in.customer_id;
  commit;
end;
/

exec process_customer(11);