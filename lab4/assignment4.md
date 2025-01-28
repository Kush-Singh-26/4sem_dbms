# LAB 4

1) Count number of faculty members in each department.

``` sql
SQL> select deptname, count(*) as facultycount from department group by deptname;

DEPTNAME                                                                                             FACULTYCOUNT
-----------------------------------------------------------------------------------------------------------------
Mathematics                                                                                                     2
Computer Science                                                                                                1
Chemistry                                                                                                       1
Biology                                                                                                         2

```

2)  Display the total number of dependents for each employee.

``` sql
SQL> SELECT EmployeeID, COUNT(*) AS TotalDependents from dependent group by employeeid;

EMPLOYEEID TOTALDEPENDENTS
---------- ---------------
       102               2
       104               2
       106               1
```

3) Find sum of Maximum count by term and course. (GROUP BY two columns)

``` sql
SQL> SELECT Termid, Courseid, SUM(MaxCount) AS TotalMaxCount FROM CRSSECTION GROUP BY Termid, Courseid;

    TERMID   COURSEID TOTALMAXCOUNT
---------- ---------- -------------
         1          1            70
         1          2            40
        20          2            60
         2          3            30
         5          3            35
         1          4            20
         1          5            40

7 rows selected.
```

4) Display average employee salary by department, but do not include departments with average salary less than $75,000.

```sql
SQL> SELECT deptid, AVG(Salary) AS AverageSalary FROM Employee GROUP BY deptid HAVING AVG(Salary) >= 75000;

    DEPTID AVERAGESALARY
---------- -------------
        10    75166.6667
        20    79333.3333
        40         77000
```

5) Create a new user XYZ and grant only SELECT privilege to the user on your TERM table.

```sql
SQL> CREATE USER C##XYZ IDENTIFIED BY "password123";
User created.
SQL> GRANT SELECT ON KUSHSQL.TERM TO C##XYZ;
Grant succeeded.
```

6) INSERT a new Winter 2004 term in the TERM table. Use a SELECT query to see the result. Ask the user XYZ with the SELECT privilege to view your TERM table. COMMIT your transaction and ask the same user to view the table again.

```sql
SQL> INSERT INTO TERM (TERMID, TERMDESC, STARTDATE, ENDDATE)
  2  VALUES (101, 'Winter', TO_DATE('01-JAN-2004', 'DD-MON-YYYY'), TO_DATE('31-MAR-2004', 'DD-MON-YYYY'));

1 row created.

SQL> SELECT * FROM TERM;

    TERMID TERMDESC                                                                                             STARTDATE ENDDATE
---------- ---------------------------------------------------------------------------------------------------- --------- ---------
       101 Winter                                                                                               01-JAN-04 31-MAR-04
         1 Fall 2023                                                                                            01-SEP-23 15-DEC-23
         2 Spring 2024                                                                                          15-JAN-24 10-MAY-24
         3 Summer 2024                                                                                          01-JUN-24 15-AUG-24
         4 Fall 2024                                                                                            01-SEP-24 15-DEC-24
         5 Spring 2025                                                                                          15-JAN-25 10-MAY-25
      2025 Spring 2025                                                                                          15-JAN-25 15-MAY-15

7 rows selected.

SQL> COMMIT;

Commit complete.

SQL> CONNECT sys/password AS SYSDBA;

SQL> SELECT * FROM KUSHSQL.TERM;

    TERMID TERMDESC                                                                                             STARTDATE ENDDATE
---------- ---------------------------------------------------------------------------------------------------- --------- ---------
       101 Winter                                                                                               01-JAN-04 31-MAR-04
         1 Fall 2023                                                                                            01-SEP-23 15-DEC-23
         2 Spring 2024                                                                                          15-JAN-24 10-MAY-24
         3 Summer 2024                                                                                          01-JUN-24 15-AUG-24
         4 Fall 2024                                                                                            01-SEP-24 15-DEC-24
         5 Spring 2025                                                                                          15-JAN-25 10-MAY-25
      2025 Spring 2025                                                                                          15-JAN-25 15-MAY-15

7 rows selected.
```
7) Write a query to find the date of the last Sunday of the current month.
```sql
SQL> SELECT NEXT_DAY(CURRENT_DATE - 1, 'SUNDAY') AS LastSunday FROM dual;

LASTSUNDA
---------
02-FEB-25
```