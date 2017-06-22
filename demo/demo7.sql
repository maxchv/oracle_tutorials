DECLARE
    -- объ€вление ассоциированного массива с элементами типа varchar2 
    -- и индексами строкового типа
    TYPE coll_group IS
        TABLE OF VARCHAR2(100) INDEX BY VARCHAR2(255);
    sgroup   coll_group;
    g_idx    VARCHAR2(255);
BEGIN
    sgroup('first') := 'lkajflks';
    sgroup('second') := 'lkajsf';
    sgroup('third') := 'lkajklfsjkljf';
    sgroup('fourth') := '11111111111';
    sgroup.DELETE('third');
    dbms_output.put_line('count: ' || sgroup.count);
    g_idx := sgroup.first; -- первый индекс коллекции
    WHILE
        g_idx IS NOT NULL
    LOOP
        dbms_output.put_line(g_idx || ' => ' || sgroup(g_idx) );
        g_idx := sgroup.next(g_idx); -- следующий элемент коллекции
    END LOOP;
END;