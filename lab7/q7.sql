-- Input a number and print its multiplication table using a WHILE loop.

DECLARE
    i NUMBER(5);

BEGIN
    i := &i;
    
    for m in 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i || ' * ' || m || ' = ' || (i*m));
    END LOOP;
END;
/

/*
SQL> edit f8.sql

SQL> @ f8.sql
Enter value for i: 4
old   5:     i := &i;
new   5:     i := 4;
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36
4 * 10 = 40

PL/SQL procedure successfully completed.
*/