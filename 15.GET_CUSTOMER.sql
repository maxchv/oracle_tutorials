CREATE OR REPLACE PROCEDURE get_customer(
    c_id IN NUMBER )
AS
  c_name customer.first_name%type;
  c_country customer.country%type;
  c_customer_id_exception EXCEPTION;
BEGIN
  IF c_id <= 0 THEN
    raise c_customer_id_exception;
  END IF;
  SELECT first_name,
    country
  INTO c_name,
    c_country
  FROM customer
  WHERE customer_id = c_id;
  dbms_output.put_line('Name: ' || c_name);
  dbms_output.put_line('Country: ' || c_country);
EXCEPTION
WHEN no_data_found THEN
  dbms_output.put_line('No data found');
WHEN c_customer_id_exception THEN
  dbms_output.put_line('Customer ID must be greater than 0');
WHEN OTHERS THEN
  dbms_output.put_line('Other Errors');
END get_customer; 