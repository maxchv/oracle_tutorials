DECLARE
  -- type declaration
  c_id CUSTOMER.CUSTOMER_ID%type        := 130;
  c_fname CUSTOMER.FIRST_NAME%type      := 'JEFF';
  c_lname CUSTOMER.LAST_NAME%type       := 'AFONSO';
  c_mname CUSTOMER.MIDDLE_NAME%type     := 'A';
  c_addr1 CUSTOMER.ADDRESS_LINE1%type   := '23 SUWANEE RD';
  c_addr2 CUSTOMER.ADDRESS_LINE2%type   := NULL;
  c_city CUSTOMER.CITY%type             := 'ALPHARETTA';
  c_country CUSTOMER.COUNTRY%type       := 'USA';
  c_date_added CUSTOMER.DATE_ADDED%type := sysdate;
  c_region CUSTOMER.REGION%type         :='south';
BEGIN
  INSERT
  INTO customer
    (
      customer_id, first_name,  last_name, middle_name, address_line1, address_line2, city, country, date_added, region 
    )
    VALUES
    (
      c_id,        c_fname,    c_lname,    c_mname,    c_addr1,        c_addr2,      c_city,c_country, c_date_added, c_region
    );
  COMMIT;
  dbms_output.put_line('Data successfully Inserted');
END;