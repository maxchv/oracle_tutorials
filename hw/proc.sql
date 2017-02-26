
-- ���������� ���������
CREATE OR REPLACE PROCEDURE ADD_CUSTOMER (C_ID IN NUMBER, 
                                          FIRST_NAME IN VARCHAR2(50) DEFAULT '����', 
										  TCOUNT OUT NUMERIC,
										  ...)
AS
BEGIN 
	INSERT INTO CUSTOMER VALUES(...);
	SELECT COUNT(1) INTO TCOUNT FROM CUSTOMER;
EXCEPTION
	WHEN exception_name THEN
		DBMS_OUTPUT.PUT_LINE('Some exception');
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE('Other exception');	
END;

-- ����� ���������

EXEC ADD_CUSTOMER(1, '����', ...);

-- 1-� ����� ������ ���������
DECLARE
	tcount NUMERIC;
BEGIN
	ADD_CUSTOMER(FIRST_NAME => '����', C_ID => 1, TCOUNT => tcount ...);
	DBMS_OUTPUT.PUT_LINE('records: ' || tcount);
END;

-- 2-� ����� ������ ���������
BEGIN
	ADD_CUSTOMER(1, '����', ...);
END;

-- �������
-- ���������� �������
CREATE OR REPLACE FUNCTION FADD_CUSTOMER (C_ID IN NUMBER, 
                                          FIRST_NAME IN VARCHAR2(50) DEFAULT '����', 										  
										  ...)
RETURN NUMBERIC
AS
	TCOUNT NUMBERIC;
BEGIN 
	INSERT INTO CUSTOMER VALUES(...);
	SELECT COUNT(1) INTO TCOUNT FROM CUSTOMER;
	
	RETURN TCOUNT;
EXCEPTION
	WHEN exception_name THEN
		DBMS_OUTPUT.PUT_LINE('Some exception');
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE('Other exception');	
END;

-- ����� �������

DECLARE
	TCOUNT NUMBERIC;
BEGIN
	TCOUNT := FADD_CUSTOMER(1, '����', ...);
	DBMS_OUTPUT.PUT_LINE('records: ' || tcount);
END;

-- ����������
CREATE OR REPLACE PROCEDURE GET_CUSTOMER (C_ID IN NUMBER, 
                                          CFIRST OUT VARCHAR2(50))
AS
	ID_EXCEPTION EXCEPTION;
BEGIN 	
	IF C_ID <= 0 THEN
		RAISE ID_EXCEPTION
	END IF;
	SELECT FIRST_NAME INTO CFIRST FROM CUSTOMER WHERE CUSTOMER_ID = C_ID;
EXCEPTION
	WHEN ID_EXCEPTION THEN
		DBMS_OUTPUT.PUT_LINE('Id should be great than 0');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('Too many rows exception');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Not data exception');
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE('Other exception');	
END;


DECLARE
	FNAME STUDENT.CUSTOMER%TYPE;
BEGIN
	GET_CUSTOMER(1, FNAME);
	DBMS_OUTPUT.PUT_LINE('FIRST NAME: ' || FNAME);
END;
