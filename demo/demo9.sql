DECLARE
type descr_coll
IS
  TABLE OF products%rowtype index by pls_integer;
  pdescr descr_coll;
  CURSOR c
  IS
    SELECT * FROM products;
  iter NUMBER := 0;
BEGIN
  OPEN c;
  LOOP
    iter := iter + 1;
    dbms_output.put_line('iteration #' || iter);
    FETCH c bulk collect INTO pdescr limit 5;
    dbms_output.put_line('count ' || pdescr.count);
    dbms_output.put_line('start');
    FOR i IN 1..pdescr.count
    LOOP
      dbms_output.put_line('id ' || pdescr(i).id);
      dbms_output.put_line('title ' || pdescr(i).title);
    END LOOP;
    IF c%notfound THEN
      dbms_output.put_line('end');
    END IF;
    EXIT
  WHEN c%notfound;
  END LOOP;
  CLOSE c;
END;
/