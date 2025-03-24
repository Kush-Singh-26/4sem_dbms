-- Use a PL/SQL block to delete item number 4 from the ITEM table.

BEGIN
    DELETE FROM ITEM WHERE ItemNum = 4;
    COMMIT;
END;
/

/*
SQL> @ f9.sql

PL/SQL procedure successfully completed.

SQL> select * from item;

   ITEMNUM
----------
         1
         2
         3
         5
*/