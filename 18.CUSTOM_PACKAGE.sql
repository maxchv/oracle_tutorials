CREATE OR REPLACE PACKAGE CUSTOMER_PACKAGE
AS
  PROCEDURE ADD_CUSTOMER(
      C_ID         IN NUMBER,
      C_FNAME      IN VARCHAR2,
      C_LNAME      IN VARCHAR2,
      C_MNAME      IN VARCHAR2,
      C_ADD1       IN VARCHAR2,
      C_ADD2       IN VARCHAR2,
      C_CITY       IN VARCHAR2,
      C_COUNTRY    IN VARCHAR2,
      C_DATE_ADDED IN DATE,
      C_REGION     IN VARCHAR2 );
  PROCEDURE display_names;
  PROCEDURE get_customer(c_id IN NUMBER );
  PROCEDURE SHOW_CUSTOMER(C_ID IN NUMBER, TCOUNT OUT NUMBER );
  FUNCTION find_salescount( p_sales_date DATE) RETURN NUMBER;
  FUNCTION get_names(custid IN NUMBER) RETURN sys_refcursor;
END CUSTOMER_PACKAGE;

CREATE OR REPLACE PACKAGE body customer_package
AS
  PROCEDURE ADD_CUSTOMER(
      C_ID         IN NUMBER,
      C_FNAME      IN VARCHAR2,
      C_LNAME      IN VARCHAR2,
      C_MNAME      IN VARCHAR2,
      C_ADD1       IN VARCHAR2,
      C_ADD2       IN VARCHAR2,
      C_CITY       IN VARCHAR2,
      C_COUNTRY    IN VARCHAR2,
      C_DATE_ADDED IN DATE,
      C_REGION     IN VARCHAR2 )
  AS
  BEGIN
    INSERT
    INTO CUSTOMER
      (
        CUSTOMER_ID,
        FIRST_NAME,
        LAST_NAME,
        MIDDLE_NAME,
        ADDRESS_LINE1,
        ADDRESS_LINE2,
        CITY,
        COUNTRY,
        DATE_ADDED,
        REGION
      )
      VALUES
      (
        C_ID,
        C_FNAME,
        C_LNAME,
        C_MNAME,
        C_ADD1,
        C_ADD2,
        C_CITY,
        C_COUNTRY,
        C_DATE_ADDED,
        C_REGION
      );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data successfuly Inserted');
  END ADD_CUSTOMER;
  PROCEDURE display_names
  AS
    c_rec sys_refcursor;
    fname VARCHAR2(50);
    lname VARCHAR2(50);
  BEGIN
    c_rec := get_names(10);
    LOOP
      FETCH c_rec INTO fname, lname;
      EXIT
    WHEN c_rec%notfound;
      dbms_output.put_line(fname);
      dbms_output.put_line(lname);
    END LOOP;
    CLOSE c_rec;
  END;
  PROCEDURE get_customer(
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
  PROCEDURE SHOW_CUSTOMER(
      C_ID IN NUMBER,
      TCOUNT OUT NUMBER )
  AS
    FNAME CUSTOMER.FIRST_NAME%TYPE;
  BEGIN
    SELECT FIRST_NAME INTO FNAME FROM CUSTOMER WHERE CUSTOMER_ID=C_ID;
    COMMIT;
    SELECT COUNT(1) INTO TCOUNT FROM CUSTOMER;
  END SHOW_CUSTOMER;
  FUNCTION find_salescount(
      p_sales_date DATE)
    RETURN NUMBER
  AS
    num_of_sales NUMBER:=0;
  BEGIN
    SELECT COUNT(*) INTO num_of_sales FROM sales WHERE sales_date = p_sales_date;
    RETURN num_of_sales;
  END find_salescount;
  FUNCTION get_names(
      custid IN NUMBER)
    RETURN sys_refcursor
  AS
    l_return sys_refcursor;
  BEGIN
    OPEN l_return FOR SELECT first_name,
    last_name FROM customer WHERE customer_id = custid;
    RETURN l_return;
  END get_names;
END customer_package;

execute customer_package.display_names;
exec CUSTOMER_PACKAGE.GET_CUSTOMER(10);