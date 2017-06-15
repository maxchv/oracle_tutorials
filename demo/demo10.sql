DECLARE
type idx_coll
IS
  TABLE OF NUMBER;
  idxs idx_coll;
  idx number;
BEGIN
  SELECT id bulk collect INTO idxs FROM products WHERE price <= 100;
  
  forall idx IN 1..idxs.count SAVE exceptions
  UPDATE products SET price=price*1.1 WHERE id=idxs(idx);
exception
  when others then
    if sqlcode = -24381 then
      for idx in 1..sql%bulk_exceptions.count
      loop
        dbms_output.put_line('ERROR_INDEX: ' || sql%bulk_exceptions(idx).ERROR_INDEX);
        dbms_output.put_line('ERROR_CODE: ' || sql%bulk_exceptions(idx).ERROR_CODE);
      end loop;
    end if;
END;

