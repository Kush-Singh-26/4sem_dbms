-- Write a PL/SQL block to print all odd numbers between 1 and 10 using a loop.

DECLARE
    i NUMBER(2) := 1;
BEGIN
    WHILE i <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 2;
    END LOOP;
END;
/


/*
SQL> ed f6.sql

SQL> @ f6.sql
1
3
5
7
9

PL/SQL procedure successfully completed.
*/