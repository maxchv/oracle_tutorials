CREATE OR REPLACE PROCEDURE display_names
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