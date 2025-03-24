--  Write a PL/SQL block to find the square, cube, and double of a number. 

DECLARE
    n NUMBER(5); 
BEGIN
    n := &n;      
    DBMS_OUTPUT.PUT_LINE('Square: ' || (n * n));
    DBMS_OUTPUT.PUT_LINE('Cube: ' || (n * n * n));
    DBMS_OUTPUT.PUT_LINE('Double: ' || (2 * n));
END;
/

/*
SQL> @ f3.sql
Enter value for n: 4
old   4:     n := &n;
new   4:     n := 4;
Square: 16
Cube: 64
Double: 8

PL/SQL procedure successfully completed.
*/