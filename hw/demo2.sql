declare
  id int := 1;
  birthdate date := to_date('12/01/1998', 'dd/mm/YYYY');
  const constant int := 100;
begin
  id := &id;
  dbms_output.put_line('id = ' || id);
  select random() from dual;
  dbms_output.put_line('birthday = ' || birthdate);
end;
-- Условные конструкции
declare
  val number;
begin
  val := &val;
  
  if val = 10 then
    goto lbl;
  end if;
  dbms_output.put_line('Нечто');
  
<<lbl>>
  dbms_output.put_line('Конец');
  
  /*
  case val
  when 1 then
    dbms_output.put_line('Это 1');
  when 2 then
    dbms_output.put_line('Это 2');
  else
    dbms_output.put_line('Что-то другое');
  end case;*/
  /*
  case
  when val > 100 then
    dbms_output.put_line('Больше 100');
  when val > 10 then
    dbms_output.put_line('Больше 10');
  else
    dbms_output.put_line('Меньше или равно 10');
  end case;
  */
  /*
  if val > 100 then
    dbms_output.put_line('Больше 100');
  elsif val > 10 then
    dbms_output.put_line('Больше 10');
  else
    dbms_output.put_line('Меньше или равно 10');
  end if;
  */
end;
-- Вложенные программные блоки
declare
  num number := 100;
  num2 number := 300;
begin  
  dbms_output.put_line('num = ' || num);  
  declare 
    num number := 200;
  begin 
  num := 2000;
  dbms_output.put_line('num = ' || num);  
  num2 := 500;
  dbms_output.put_line('num2 = ' || num2); 
  
  end;
  dbms_output.put_line('num = ' || num);
  dbms_output.put_line('num2 = ' || num2);
end;

-- Циклы
declare 
  counter int := 0;
begin
/*
  loop 
    counter := counter + 1;
    DBMS_OUTPUT.PUT_LINE(counter);
    -- exit when counter > 10;
    if counter > 10 then
      goto endloop;
    end if;
  end loop;
<<endloop>>
  DBMS_OUTPUT.PUT_LINE('end');
*/
/*
  while counter < 10
  loop
   DBMS_OUTPUT.PUT_LINE(counter);
   counter := counter + 1;
  end loop;
*/
  for item in reverse 1..10
  loop
    DBMS_OUTPUT.PUT_LINE(item);
  end loop;
end;

declare
  l_id products.id%type;
  l_title products.title%type;
  l_description PRODUCTS.DESCRIPTION%type;
  l_price PRODUCTS.PRICE%type;
begin
  select id, title, description, price into l_id, l_title, l_description, l_price 
    from products;
  dbms_output.put_line('id = ' || l_id);
  dbms_output.put_line('title = ' || l_title);
  dbms_output.put_line('descr = ' || l_description);
  dbms_output.put_line('price = ' || l_price);
end;
