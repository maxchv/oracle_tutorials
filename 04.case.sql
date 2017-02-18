DECLARE
  -- variable section
  total_amount NUMBER := 201;
  discount     NUMBER := 0;
BEGIN
  CASE
  WHEN total_amount  > 200 THEN
    discount        := total_amount * .2;
  WHEN total_amount >= 100 THEN
    discount        := total_amount * .1;
  ELSE
    discount := total_amount * .05;
  END CASE;
  dbms_output.put_line(discount);
END;