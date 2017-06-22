CREATE TYPE address_obj AS OBJECT (
    country        VARCHAR2(255),
    city           VARCHAR2(255),
    address        VARCHAR2(255),
    postal_index   NUMBER,
    member         procedure info
);

CREATE TYPE BODY address_obj IS
    MEMBER PROCEDURE info
        AS
    BEGIN
        -- self - ссылка на экземпл€р класса
        dbms_output.put_line('Country:      ' || self.country);
        dbms_output.put_line('City:         ' || self.city);
        dbms_output.put_line('Address:      ' || self.address);
        dbms_output.put_line('Postal index: ' || self.postal_index);
    END info;

END;

DECLARE
    addr   address_obj;
BEGIN
    addr := address_obj(
        '”краина',
        'ƒнепр',
        'яворницкого,101',
        49000
    );
    addr.info ();
END;

-- создание таблицы с полем типа address_obj

CREATE TABLE student (
    id     INT,
    name   VARCHAR2(255),
    addr   address_obj
);

INSERT INTO student VALUES (
    1,
    '¬ас€',
    address_obj(
        '”краина',
        'ƒнепр',
        'яворницкого,101',
        49000
    )
);

DECLARE
    srow   student%rowtype; -- запись
BEGIN
    SELECT
        *
    INTO
        srow
    FROM
        student
    WHERE
        id = 1;

    dbms_output.put_line('Name: ' || srow.name);
    srow.addr.info ();
END;

-- таблица на базе объекта address_obj

CREATE TABLE address_table OF address_obj;

INSERT INTO address_table VALUES ( address_obj(
    '”краина',
    'ƒнепр',
    '“елевизионна€, 4а',
    49000
) );