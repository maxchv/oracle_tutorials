DECLARE
  -- variable section
  cntr NUMBER(2) := 10;
BEGIN
  FOR cntr IN 10..20
  LOOP
    dbms_output.put_line('value of cntr' || cntr);
  END LOOP;
  
  FOR cntr IN REVERSE 10..20
  LOOP
    dbms_output.put_line('value of cntr' || cntr);
  END LOOP;
END;