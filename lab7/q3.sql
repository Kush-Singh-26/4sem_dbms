-- Write a PL/SQL block to swap the values of two variables. Print variables before and after swapping.

DECLARE
    n NUMBER(5);  
    m NUMBER(5);  
    t NUMBER(5);  
BEGIN
    n := &n;      
    m := &m;      

    DBMS_OUTPUT.PUT_LINE('n Before: ' || n);
    DBMS_OUTPUT.PUT_LINE('m Before: ' || m);

    t := n;
    n := m;
    m := t;

    DBMS_OUTPUT.PUT_LINE('n After: ' || n);
    DBMS_OUTPUT.PUT_LINE('m After: ' || m);
END;
/


/*
SQL> @ f4.sql
Enter value for n: 4
old   6:     n := &n;
new   6:     n := 4;
Enter value for m: 6
old   7:     m := &m;
new   7:     m := 6;
n Before: 4
m Before: 6
n After: 6
m After: 4

PL/SQL procedure successfully completed.
*/