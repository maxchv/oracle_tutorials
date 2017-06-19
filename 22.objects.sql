CREATE OR REPLACE type sales_row
AS
  object
  (
    s_date        DATE,
    s_orderid     NUMBER,
    s_product_id  NUMBER,
    s_customerid  NUMBER,
    s_totalamount NUMBER );
/
create type sales_table is table of sales_row;
create table sr of sales_row; 