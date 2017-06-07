DROP TYPE Student;
DROP TYPE Person;

CREATE OR REPLACE TYPE Person As Object (
	firstName	VARCHAR2(30),
	lastName	VARCHAR2(30),
	phoneNumber	CHAR(10)
) NOT FINAL;
/
CREATE OR REPLACE TYPE Student UNDER Person (
	studentID	CHAR(7),
	MEMBER FUNCTION GetGrades RETURN VARCHAR2
);
/
CREATE OR REPlACE TYPE BODY Student AS
	MEMBER FUNCTION GetGrades RETURN VARCHAR2 IS
		grades	VARCHAR2(50) := 'LOL Grades';
	BEGIN
		RETURN grades;
	END;
END;
/

CREATE TABLE persons OF Person;
CREATE TABLE students OF Student;

set serveroutput on
DECLARE
	aPerson Person;
	aStudent Student;
BEGIN
	aPerson := Person('Luc-Olivier', 'Dumais-Blais', '8195551234');
	aStudent := Student('Yanik', 'Magnan', '8195551235', '1234567');
	DBMS_OUTPUT.PUT_LINE(aPerson.firstName || ' ' || aPerson.lastName || '''s phone number: ' || aPerson.phoneNumber);
	DBMS_OUTPUT.PUT_LINE(aStudent.firstName || '''s grades: ' || aStudent.GetGrades);

	INSERT INTO persons VALUES aPerson;
	INSERT INTO students VALUES aStudent;
END;
/