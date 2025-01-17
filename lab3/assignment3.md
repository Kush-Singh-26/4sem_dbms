# LAB 3
1. Display all employees with their commission value. Display 0 commission for employees who do not get any commission.
``` sql
SP2-0734: unknown command beginning "SQL> selec..." - rest of line ignored.
SQL> select fname || ' ' || lname as "NAME", nvl(commission,0) from employee;

NAME                                                                                                  NVL(COMMISSION,0)
----------------------------------------------------------------------------------------------------- -----------------
John Smith                                                                                                         5000
Jane Doe                                                                                                           3000
Emily Brown                                                                                                        2000
Michael Johnson                                                                                                    7000
Sarah Davis                                                                                                        4000
Liam Taylor                                                                                                           0
Olivia Martinez                                                                                                       0
James Williams                                                                                                        0

8 rows selected.
```
2. Count the total number of rooms in LOCATION.
```sql
SQL> select count(roomno) from location;

COUNT(ROOMNO)
-------------
            5

```
3. Count the distinct building names in LOCATION.
```sql
SQL> select count(distinct building) from location;

COUNT(DISTINCTBUILDING)
-----------------------
                      5
```
4. Display all student names and birth dates. Display birth dates with the format ‘20 OCTOBER, 1970’.
```sql
SQL> select FIRST || ' ' || LAST as "NAME", to_char(birthdate,'DD MONTH,YYYY') as "BIRTHDATE" from student;

NAME                                                                                                  BIRTHDATE
-------------------------------------------------------------------------------------------------------------------------------------------------
John Smith                                                                                            15 MAY      ,2000
Jane Doe                                                                                              20 JULY     ,1999
Emily Brown                                                                                           30 MARCH    ,2001
Michael Johnson                                                                                       12 NOVEMBER ,1998
Sarah Davis                                                                                           25 FEBRUARY ,2002
```
5. Find the average, highest, and lowest age for students.\
```sql
SQL> select avg(extract(year from sysdate) - extract(year from birthdate)) as "AVERAGE AGE" from student;

AVERAGE AGE
-----------
         25

SQL> select max(extract(year from sysdate) - extract(year from birthdate)) as "MAX AGE" from student;

   MAX AGE
----------
        27

SQL> select min(extract(year from sysdate) - extract(year from birthdate)) as "MIN AGE" from student;

   MIN AGE
----------
        23

```
6. Display only the year value from each employee’s hire date.\
```sql
SQL> select extract (year from hiredate) as "HIRE YEAR" from employee;

 HIRE YEAR
----------
      2020
      2019
      2018
      2021
      2022
      2024
      2023
      2023

8 rows selected.
```
7. Find average employee commission.
    - Ignore nulls.
    - Do not ignore nulls.
```sql
SQL> select avg(commission) from employee;

AVG(COMMISSION)
---------------
           3500
```
8. Find 2 to the power 10.
```sql
SQL> select power(2,10) from dual;

POWER(2,10)
-----------
       1024
```
9. Display courses and prerequisites. If there is no prerequisite, display ‘none’ else display ‘one’.
```sql
SQL> select title, nvl2(prereq, 'one', 'none') from course;

TITLE                                                                                                NVL2
---------------------------------------------------------------------------------------------------- ----
Mathematics I                                                                                        none
Physics I                                                                                            one
Computer Science I                                                                                   none
Chemistry I                                                                                          none
Biology I      
```
10. Find the number of years employees have been working for. Display integer part of value only.
```sql
SQL> select extract(year from sysdate) - extract(year from hiredate) as "NO. of Years" from employee;

NO. of Years
------------
           5
           6
           7
           4
           3
           1
           2
           2

8 rows selected.
```
11. Find students who are born in the month of May.
```sql
SQL> select First || ' ' || Last as "Name", birthdate from student where extract(month from birthdate) = 5;

Name                                                                                                  BIRTHDATE
----------------------------------------------------------------------------------------------------- ---------
John Smith                                                                                            15-MAY-00
Adam Joe                                                                                              10-MAY-02
Johnson Doe                                                                                           20-MAY-99
```
12. Display employee’s last name and first name, followed by salary+commission if commission is not null, else display salary only.
```sql
SQL> select lname, fname, nvl2(commission, salary + commission, salary) from employee;

LNAME                                              FNAME                                              NVL2(COMMISSION,SALARY+COMMISSION,SALARY)
-------------------------------------------------- -------------------------------------------------- -----------------------------------------
Smith                                              John                                                                                   65500
Doe                                                Jane                                                                                   69000
Brown                                              Emily                                                                                  51500
Johnson                                            Michael                                                                                84000
Davis                                              Sarah                                                                                  64500
Taylor                                             Liam                                                                                   68200
Martinez                                           Olivia                                                                                 49500
Williams                                           James                                                                                  60500

8 rows selected.
```
13. Display employee’s full name followed by a message based on salary. If salary is above $100,000, display “HIGH”. If salary is between $50,000 and $100,000, display “MEDIUM”. If salary is below $50,000, display “LOW”.
```sql
SQL> select fname || ' ' || lname as "NAME",
    case
       when salary > 1000000 then 'HIGH'
       when salary between 50000 and 1000000 then 'MEDIUM'
       when salary < 50000 then 'LOW'
    end
    as "SALARY" from employee;

NAME                                                                                                  SALARY
----------------------------------------------------------------------------------------------------- ------
John Smith                                                                                            MEDIUM
Jane Doe                                                                                              MEDIUM
Emily Brown                                                                                           LOW
Michael Johnson                                                                                       MEDIUM
Sarah Davis                                                                                           MEDIUM
Liam Taylor                                                                                           MEDIUM
Olivia Martinez                                                                                       LOW
James Williams                                                                                        MEDIUM

8 rows selected.
```