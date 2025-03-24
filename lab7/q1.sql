-- Write a PL/SQL block to calculate the area of a circle. Declare PI as constant. --
DECLARE
    n NUMBER(5);
    PI CONSTANT NUMBER := 3.14159;

BEGIN
    n := &n;
    DBMS_OUTPUT.PUT_LINE(PI * n * n);
END;
/

/*
SQL> @ f2.sql
Enter value for n: 5
old   6:     n := &n;
new   6:     n := 5;
78.53975

PL/SQL procedure successfully completed.
*/