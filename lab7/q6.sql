-- Create a table called ITEM with one column ItemNum with NUMBER type. 
-- Write a PL/SQL program to insert values of 1 to 5 for ItemNum.


CREATE TABLE ITEM (ItemNum NUMBER);

BEGIN
    FOR i in 1..5 LOOP
        INSERT INTO ITEM (ItemNum) VALUES (i);
    END LOOP;

    COMMIT;
END;
/

/*
SQL> @ f7.sql

PL/SQL procedure successfully completed.

SQL> select * from item;

   ITEMNUM
----------
         1
         2
         3
         4
         5
*/