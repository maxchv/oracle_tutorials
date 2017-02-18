declare
-- type declaration
c_id CUSTOMER.CUSTOMER_ID%type := 10;
c_name CUSTOMER.FIRST_NAME%type;
c_addr CUSTOMER.COUNTRY%type;
begin
  select first_name, country into c_name, c_addr
  from customer
  where customer_id = c_id;
  
  dbms_output.put_line('Name: ' || c_name);
  dbms_output.put_line('Country: ' || c_addr);
end;