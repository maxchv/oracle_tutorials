declare
c_id number:= 10;
c_name varchar2(50);
c_addr varchar2(50);
begin
  select first_name, country into c_name, c_addr
  from customer
  where customer_id = c_id;
  
  dbms_output.put_line('Name: ' || c_name);
  dbms_output.put_line('Country: ' || c_addr);
end;