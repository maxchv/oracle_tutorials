DECLARE
BEGIN
  /*
  Write a program to declare 3 variables with datatype as below and display their values.
  ? Number
  ? Varchar
  ? Date
  */
  DECLARE
    n NUMBER       := 100;
    v VARCHAR(256) := 'Hello PL/SQL';
    -- http://oracleplsql.ru/to_date-function.html
    d DATE := to_date('01.02.2017', 'DD.MM.YYYY'); -- sysdate;
  BEGIN
    dbms_output.put_line('number ' || n);
    dbms_output.put_line('varchar ' || v);
    dbms_output.put_line('date ' || d);
  END;
  /*
  Write a program to check for a salary value and display the output based on
  the salary range (use IF condition)
  ? if salary is greater than 100000 then display the output as 'Grade A'
  ? if salary is between 50000 and 100000 then display the output as 'Grade B'
  ? if salary is between 25000 and 50000 then display the output as 'Grade C'
  ? if salary is between 10000 and 25000 then display the output as 'Grade D'
  ? otherwise  display the output as 'Grade E'
  */
  DECLARE
    salary INTEGER := 100100;
  BEGIN
    IF salary > 100000 THEN
      dbms_output.put_line('Grade A');
    elsif salary > 50000 THEN
      dbms_output.put_line('Grade B');
    elsif salary > 25000 THEN
      dbms_output.put_line('Grade C');
    elsif salary > 10000 THEN
      dbms_output.put_line('Grade D');
    ELSE
      dbms_output.put_line('Grade E');
    END IF;
  END;
  /*
  Write a program using the same conditions as in the #1 question,
  but use CASE condition instead of IF condition.
  */
  DECLARE
    salary INTEGER := 1000;
  BEGIN
    CASE
    WHEN salary > 100000 THEN
      dbms_output.put_line('Grade A');
    WHEN salary > 50000 THEN
      dbms_output.put_line('Grade B');
    WHEN salary > 25000 THEN
      dbms_output.put_line('Grade C');
    WHEN salary > 10000 THEN
      dbms_output.put_line('Grade D');
    ELSE
      dbms_output.put_line('Grade E');
    END CASE;
  END;
  /*
  Write a program to display values from 200 to 300 using a WHILE loop.
  */
  DECLARE
    up   CONSTANT NUMBER := 200;
    down CONSTANT NUMBER := 300;
    cur  NUMBER          := up;
  BEGIN
    WHILE cur < down
    LOOP
      dbms_output.put_line(cur);
      cur := cur + 1;
    END LOOP;
  END;
  /*
  Write a program to display values from 200 to 300 using a FOR loop
  */
  DECLARE
    up   CONSTANT NUMBER := 200;
    down CONSTANT NUMBER := 300;
    cur  NUMBER          := up;
  BEGIN
    FOR cur IN REVERSE up..down
    LOOP
      dbms_output.put_line(cur);
    END LOOP;
  END;
  /*
  Write a program to perform below steps
  ? Declare a variable
  ? If the variable value is 1 then display values from 300 to 400 using a WHILE loop
  ? If the variable value is 2 then display values from 400 to 800 using a FOR loop
  ? If the variable value is 3 then just display “wrong choice”
  */
  DECLARE
    VARIABLE NUMBER := 1;
    cur      NUMBER := 0;
  BEGIN
    IF VARIABLE  = 1 THEN
      cur       := 300;
      WHILE cur <= 400
      LOOP
        dbms_output.put_line('while ' || cur);
        cur := cur + 1;
      END LOOP;
    elsif VARIABLE = 2 THEN
      FOR cur IN 400..800
      LOOP
        dbms_output.put_line('while ' || cur);
      END LOOP;
    ELSE
      dbms_output.put_line('wrong choice');
    END IF;
  END;
END;