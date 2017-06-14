CREATE OR REPLACE PROCEDURE update_tax(
    tax_rate IN NUMBER)
AS
type orderid_type
IS
  TABLE OF SALES.ORDER_ID%type;
  l_order_ids orderid_type;
BEGIN
  dbms_output.put_line('start');
  SELECT DISTINCT order_id bulk collect INTO l_order_ids FROM sales;
    for i in 1 .. l_order_ids.count
    loop
      dbms_output.put_line(i || ' ' || l_order_ids(i));
    end loop;
    forall indx IN 1 .. l_order_ids.count
    UPDATE sales s
    SET s.TAX_AMOUNT = s.TOTAL_AMOUNT * tax_rate
    WHERE s.order_id   = l_order_ids(indx);
    dbms_output.put_line('end');
END;

exec update_tax(1.1);