# LAB 2 Assignment

1) Display all employee names (last name and first name separated by a comma and a space) and salary with appropriate column aliases.

``` sql
SQL> select LNAME || ', ' || FNAME AS "Employee Name", SALARY AS "Salary" FROM EMPLOYEE;
Employee Name                                                                                              Salary
------------------------------------------------------------------------------------------------------ ----------
Smith, John                                                                                                 50000
Doe, Jane                                                                                                   60000
Brown, Emily                                                                                                45000
Johnson, Michael                                                                                            70000
Davis, Sarah                                                                                                55000
```
2) Display all employees who do not get any commission.
``` sql
SQL> SELECT LNAME, FNAME FROM EMPLOYEE WHERE COMMISSION IS NULL OR COMMISSION = 0;

LNAME                                              FNAME
-------------------------------------------------- --------------------------------------------------
Taylor                                             Liam
Martinez                                           Olivia
Williams                                           James                                              
```
3) Display unique building names from LOCATION table.

``` sql
SQL> select distinct BUILDING from LOCATION;

BUILDING
--------------------------------------------------
Science Building
Engineering Building
Humanities Building
Administration Building
Main Building
```
4) Display all course sections offered in Winter 2020.
``` sql
SQL> select * from crssection where termid in (SELECT TERMID FROM TERM WHERE TERMDESC = 'Winter 2020');
  COURSEID SECCTION     TERMID
----------------------------------
         1 A          1
         2 B          1
         3 A          1
         4 C          1
         5 A          1
```
5) Display names of faculty members who work in department 1 or 2.
``` sql
SQL> select name from faculty where deptid in (1,2);

NAME
----------------------------------------------------------------------------------------------------
Dr. Allen
Dr. Baker
Dr. Johnson
```
6) Find all New York and New Jersey students.
``` sql
SQL> select FIRST, LAST, STATE from student where state in ('NY', 'NJ');
FIRST                                              LAST                                               STATE
-----------------------------------------------------------------------------------------------------------------
John                                               Smith                                              NY
Jane                                               Doe                                                NY
Emily                                              Brown                                              NJ


```
7) Give a 10% raise to employee number 111.
```sql
SQL> update employee set salary = salary * 1.10 where employeeid = 111;
1 row updated.
BEFORE :

EMPLOYEEID     SALARY
---------- ----------
       111      55000
AFTER :

EMPLOYEEID     SALARY
---------- ----------
       111      60500
```
8) Delete department number 30 from the department table.
``` sql
SQL> delete from department where deptid = 30;
1 row deleted.

BEFORE :
    DEPTID DEPTNAME
---------- ----------------------------------------------------------------------------------------------------
         5  Biology
        30  Physics
         4  Chemistry
         3  Computer Science

AFTER :
    DEPTID DEPTNAME
---------- ----------------------------------------------------------------------------------------------------
         5 Biology
         4 Chemistry
         3 Computer Science
```
9) For each course ID, display the maximum count in descending order.
``` sql
SQL> select courseid, max(MAXCOUNT) as "Max Count" from crssection group by courseid order by "Max Count" desc;

  COURSEID  Max Count
---------- ----------
         5         40
         3         35
         1         30
```
10) Insert a new term in the TERM table.
``` sql

SQL> insert into term values (2025, 'Spring 2025', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2015-05-15' 'YYYY-MM-DD'));
1 row created.

    TERMID TERMDESC                                                                                             STARTDATE ENDDATE
---------- ---------------------------------------------------------------------------------------------------- --------- ---------
      2023 Fall 2023                                                                                            01-SEP-23 15-DEC-23
      2014 Spring 2024                                                                                          15-JAN-24 10-MAY-24
      2025 Spring 2025                                                                                          15-JAN-25 15-MAY-25
```
11) Find courses with no required prerequisite.
``` sql
SQL> select courseid, title from course where prereq is null;

  COURSEID TITLE
---------- ----------------------------------------------------------------------------------------------------
         1 Mathematics I
         2 Physics I
         3 Computer Science I
```
12) Find faculty members whose names start with C.
``` sql
SQL> select name from faculty where name like 'C%';
NAME
----------------------------------------------------------------------------------------------------
Charles Moore
Cindy Brown
Carter Baker
```
13) Find students who started in the year 2015. Use StartTerm column and wild card
``` sql
SQL> select first, last, startterm from student where startterm like '2015%';
FIRST                                              LAST                                               STARTTERM
-------------------------------------------------- -------------------------------------------------- ----------
John                                               Smith                                              2015 Fall
Jane                                               Doe                                                2015 Spring
Emily                                              Brown                                              2015 Fall
```
