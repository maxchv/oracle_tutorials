DECLARE
  -- variable section
  ordernumber  CONSTANT NUMBER:=1001;
  orderid      NUMBER DEFAULT 1002;
  customername VARCHAR2(20):= 'john';
BEGIN
  -- ordernumber:=234;
  /*
  multi line comment
  */
  DBMS_OUTPUT.PUT_LINE('Welcome to the course');
  DBMS_OUTPUT.put_line(ordernumber);
  DBMS_OUTPUT.put_line(orderid);
  DBMS_OUTPUT.put_line(customername);
END;