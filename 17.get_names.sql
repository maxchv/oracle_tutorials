CREATE OR REPLACE FUNCTION get_names(
    custid IN NUMBER)
  RETURN sys_refcursor
AS
  l_return sys_refcursor;
BEGIN
  OPEN l_return FOR SELECT first_name, last_name FROM customer WHERE customer_id = custid;
  RETURN l_return;
END get_names;