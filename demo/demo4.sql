
-- декларация
create or replace package product_package
as
    procedure create_product(l_title in products.title%type,
                 l_descr in PRODUCTS.DESCRIPTION%type,
                 l_price in PRODUCTS.PRICE%type,
                 l_id out PRODUCTS.ID%type);
end;

create or replace package body product_package
as
    procedure create_product(l_title in products.title%type,
                 l_descr in PRODUCTS.DESCRIPTION%type,
                 l_price in PRODUCTS.PRICE%type,
                 l_id out PRODUCTS.ID%type)
    as
      -- somevalue int;
    begin
      insert into products(title, description, price) 
             values (l_title, l_descr, l_price);
      select id into l_id from products 
            where title = l_title and description = l_descr and price=l_price;
    end create_product;
end;

declare
    id number;
begin
    PRODUCT_PACKAGE.create_product('viski', 'drink', 123, id); 
    dbms_output.put_line('id = ' || id);
end;

create or replace procedure getDataByOrderId
(
    id in SALES_RYAB.ORDER_ID%type
)
as
    o_rec SALES_RYAB%rowtype; -- запись таблицы 
--    sales_date SALES_RYAB.SALES_DATE%type;
--    order_id SALES_RYAB.ORDER_ID%type;
--    product_id SALES_RYAB.PRODUCT_ID%type;
--    customer_id SALES_RYAB.CUSTOMER_ID%type;
--    salesperson_id SALES_RYAB.SALESPERSON_ID%type;
--    quantity SALES_RYAB.QUANTITY%type;
--    unit_price SALES_RYAB.UNIT_PRICE%type;
--    sales_amount SALES_RYAB.SALES_AMOUNT%type;
--    tax_amount SALES_RYAB.TAX_AMOUNT%type;
--    total_amount SALES_RYAB.TOTAL_AMOUNT%type;
begin
        SYS.DBMS_OUTPUT.PUT_LINE(id);
--    select SALES_DATE, PRODUCT_ID, CUSTOMER_ID, SALESPERSON_ID, QUANTITY, UNIT_PRICE, SALES_AMOUNT, TAX_AMOUNT, TOTAL_AMOUNT  
--            into sales_date,  product_id, customer_id, salesperson_id, quantity, unit_price, sales_amount, tax_amount, total_amount 
--            from SALES_RYAB where ORDER_id = 1000;
    select * into o_rec from SALES_RYAB where ORDER_id = 1000;
    DBMS_OUTPUT.PUT_LINE('sales date = ' || o_rec.SALES_DATE);
    DBMS_OUTPUT.PUT_LINE('order id = ' || o_rec.order_id);    
end getDataByOrderId;

exec getDataByOrderId(1000);
