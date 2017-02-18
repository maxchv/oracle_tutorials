DECLARE
  -- variable section
  cntr NUMBER(2) := 10;
BEGIN
  WHILE cntr < 20
  LOOP
    dbms_output.put_line('value of cntr' || cntr);
    cntr := cntr + 1;
  END LOOP;
END;