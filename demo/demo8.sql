DECLARE
    -- collection nested table
    TYPE char_coll IS
        TABLE OF VARCHAR2(255);
    customer_name   char_coll := char_coll(
        'Vasja',
        'Petja',
        'Dasha'
    );
BEGIN
    dbms_output.put_line('count: ' || customer_name.count);
    customer_name.extend(4);
    customer_name(4) := 'Roma';
    FOR i IN 1..customer_name.count LOOP
        dbms_output.put_line('item '
         || i
         || ': '
         || customer_name(i) );
    END LOOP;

    customer_name.extend(4);
    customer_name(customer_name.count + 1) := 'Roma';
END;

DECLARE
    TYPE num_type IS
        TABLE OF NUMBER;
    n1   num_type := num_type(
        1,
        2,
        2,
        3,
        4,
        5,
        5,
        6
    );
    n2   num_type := num_type(
        5,
        5,
        6,
        7,
        8,
        9
    );
    n3   num_type;
BEGIN
    n3 := n1 MULTISET UNION n2;
    dbms_output.put_line(' multiset union ');
    FOR i IN 1..n3.count LOOP
        dbms_output.put_line('item '
         || i
         || ': '
         || n3(i) );
    END LOOP;

    n3 := n1 MULTISET UNION DISTINCT n2;
    dbms_output.put_line(' multiset union distinct ');
    FOR i IN 1..n3.count LOOP
        dbms_output.put_line('item '
         || i
         || ': '
         || n3(i) );
    END LOOP;

    n3 := n1 MULTISET INTERSECT n2;
    dbms_output.put_line(' multiset intersect ');
    FOR i IN 1..n3.count LOOP
        dbms_output.put_line('item '
         || i
         || ': '
         || n3(i) );
    END LOOP;

    n3 := n1 MULTISET INTERSECT DISTINCT n2;
    dbms_output.put_line(' multiset INTERSECT distinct ');
    FOR i IN 1..n3.count LOOP
        dbms_output.put_line('item '
         || i
         || ': '
         || n3(i) );
    END LOOP;

    n3 := n1 MULTISET EXCEPT n2;
    dbms_output.put_line(' multiset EXCEPT ');
    FOR i IN 1..n3.count LOOP
        dbms_output.put_line('item '
         || i
         || ': '
         || n3(i) );
    END LOOP;

    n3 := n1 MULTISET EXCEPT DISTINCT n2;
    dbms_output.put_line(' multiset EXCEPT distinct ');
    FOR i IN 1..n3.count LOOP
        dbms_output.put_line('item '
         || i
         || ': '
         || n3(i) );
    END LOOP;
END;