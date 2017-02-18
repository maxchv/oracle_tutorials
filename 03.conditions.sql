DECLARE
  -- variable section
  total_amount NUMBER := 201;
  discount     NUMBER := 0;
BEGIN
  IF total_amount     > 200 THEN
    discount         := total_amount * .2;
  elsif total_amount >= 100 THEN
    discount         := total_amount * .1;
  ELSE
    discount := total_amount * .05;
  END IF;
  dbms_output.put_line(discount);
END;