CREATE OR REPLACE PROCEDURE process_customer(
    c_id IN NUMBER )
AS
type customer_rec
IS
  record
  (
    first_name VARCHAR2(50),
    last_name  VARCHAR2(50) );
  c_rec customer_rec;
  total_rows NUMBER;
BEGIN
  SELECT first_name,
    last_name
  INTO c_rec
  FROM CUSTOMER
  WHERE customer_id = c_id;
  IF sql%found THEN
    total_rows := sql%rowcount;
    dbms_output.put_line('count ' || total_rows);
  ELSE
    dbms_output.put_line('no data found');
  END IF;
END;
/
EXEC PROCESS_CUSTOMER(c_id => 16);
CREATE OR REPLACE PROCEDURE process_customer_using_cursor(
    c_id NUMBER )
AS
  CURSOR c
  IS
    SELECT * FROM customer;
  c_rec customer%rowtype;
BEGIN
  OPEN c;
  LOOP
    FETCH c INTO c_rec;
    EXIT
  WHEN c%notfound;
    IF c%found THEN
      dbms_output.put_line('first_name ' || c_rec.first_name);
      dbms_output.put_line('last_name ' || c_rec.last_name);
    ELSE
      dbms_output.put_line('no data found');
    END IF;
  END LOOP;
  CLOSE c;
EXCEPTION
WHEN OTHERS THEN
  dbms_output.put_line(SQLCODE||': ' || sqlerrm);
END;
/
EXEC PROCESS_CUSTOMER_USING_CURSOR(12);
DECLARE
BEGIN
  FOR c_rec IN
  (SELECT * FROM customer
  )
  LOOP
    dbms_output.put_line(c_rec.first_name);
  END LOOP;
END;
/
CREATE OR REPLACE FUNCTION get_names
  RETURN sys_refcursor
AS
  l_return sys_refcursor;
BEGIN
  OPEN l_return FOR SELECT first_name FROM customer;
  RETURN l_return;
END;
/
DECLARE
  c_ref sys_refcursor;
  fname VARCHAR2(50);
BEGIN
  c_ref := get_names();
  LOOP
    FETCH c_ref INTO fname;
    EXIT
  WHEN c_ref%notfound;
    dbms_output.put_line(fname);
  END LOOP;
END;
/