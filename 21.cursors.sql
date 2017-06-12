DECLARE
type customer_type
IS
  TABLE OF VARCHAR(20) INDEX BY binary_integer;
  v_idx    NUMBER;
  cust_table customer_type;
  v_idx number;
BEGIN
  cust_table(1) := 'one';
  cust_table(2) := 'two';
  cust_table(3) := 'treed';
  cust_table(4) := 'fourt';
  cust_table(5) := 'fifth';
  cust_table.delete(1);
  
  while v_idx is not null
  loop
    v_idx := cust_table.next(v_idx);
  end;
END;