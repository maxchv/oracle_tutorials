DECLARE
  -- Global variables
  num1 NUMBER := 95;
BEGIN

  dbms_output.put_line('Outer Variable num1: ' || num1);
  
  DECLARE
    -- Local variables
    num2 NUMBER := 185;
  
  BEGIN
    dbms_output.put_line('Inner variable num1: ' || num1);
    dbms_output.put_line('Inner variable num3: ' || num2);
  END;
END;