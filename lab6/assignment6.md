# LAB 6

## Use the Corporation database tables to design the following subqueries.

1) Display employee Jinku Shaw’s department name.
``` sql

SQL> select deptname from dept where deptid = (
  2     select deptid from employee where fname = 'Jinku' and lname = 'Shaw'
  3  );

DEPTNAME
---------------
Finance
```
2) Find name of the supervisor for employee number 433.
``` sql
SQL> select fname || ' ' || lname as "Name" from employee where employeeid = (
  2  select supervisor from employee where employeeid = 433
  3  );

Name
-------------------------------
Olivia Martinez
```

3) Who has same qualification as Stanley Garner?
``` sql
SQL> select fname || ' ' || lname as "Name" from employee where qualid = (
  2     select qualid from employee where fname = 'Stanley' and lname = 'Garner'
  3  ) and not (fname = 'Stanley' and lname = 'Garner');

Name
-------------------------------
John Smith
Doe John
```

4) Which department has more employees than department 20?
``` sql
SQL> select deptid from employee group by deptid
  2       having count(*) > (
  3               select count(*) from employee where deptid = 20
  4      );

    DEPTID
----------
        10
        30
```

5) Which employees are working in the company longer than Larry Houston?
``` sql
SQL> select fname || ' ' || lname as "Name" , hiredate from employee
  2         where hiredate < (
  3                 select hiredate from employee where fname = 'Larry' and lname = 'Houston'
  4         );

Name                            HIREDATE
------------------------------- ---------
John Smith                      01-JAN-20
Emily Johnson                   15-FEB-21
James Williams                  20-MAR-22
Linda Jones                     10-MAY-19
Michael Brown                   22-AUG-20
```

6) Find all employees in the sales department by using a nested query.
``` sql
SQL> select fname || ' ' || lname as "Name" from employee where deptid in (
  2     select deptid from dept where deptname = 'Sales'
  3  );

Name
-------------------------------
Michael Johnson
Olivia Martinez
```

7) Create a new table, EMP30, and populate it with employees in department 30, using an existing table and a subquery. Use EmployeeId, Lname, Fname,
HireDate and Salary columns.
``` sql
SQL> create table EMP30 as
  2  select employeeid, lname, fname, hiredate, salary from employee
  3  where deptid = 30;

Table created.

SQL> select * from emp30;

EMPLOYEEID LNAME           FNAME           HIREDATE      SALARY
---------- --------------- --------------- --------- ----------
         4 Jones           Linda           10-MAY-19      76000
       103 Brown           Emily           25-JUN-18      49500
       106 Taylor          Liam            13-APR-24      68200
       108 Williams        James           25-FEB-23      60500
```

8) Add more rows to EMP30 table with employee in department 40. Do not transfer employee’s salary.
``` sql
SQL> insert into emp30 (employeeid, lname, fname, hiredate)
  2     select employeeid, lname, fname, hiredate from employee
  3     where deptid = 40;

2 rows created.

SQL> select * from emp30;

EMPLOYEEID LNAME           FNAME           HIREDATE      SALARY
---------- --------------- --------------- --------- ----------
         4 Jones           Linda           10-MAY-19      76000
       103 Brown           Emily           25-JUN-18      49500
       106 Taylor          Liam            13-APR-24      68200
       108 Williams        James           25-FEB-23      60500
       104 Johnson         Michael         10-SEP-21
       107 Martinez        Olivia          11-JUL-23

6 rows selected.
```

9) Find employees with minimum salary in their own department with the use of correlated subquery.
``` sql
SQL> select employeeid, fname || ' ' || lname as  "Name", deptid from employee e1
  2     where salary = (
  3             select min(salary) from employee e2 where e1.deptid = e2.deptid
  4     );

EMPLOYEEID Name                                DEPTID
---------- ------------------------------- ----------
         1 John Smith                              10
       102 Jane Doe                                20
       103 Emily Brown                             30
       105 Sarah Davis                             50
       107 Olivia Martinez                         40
```

10) Use multiple level subquery to display dependent information for employees, who belong to FINANCE department.
``` sql
SQL> SELECT DEPENDENTID, EMPLOYEEID, DEPDOB, RELATION
  2  FROM DEPENDENT
  3  WHERE EMPLOYEEID IN (
  4      SELECT EMPLOYEEID
  5      FROM EMPLOYEE
  6      WHERE DEPTID in (
  7          SELECT DEPTID
  8          FROM dept
  9          WHERE DEPTNAME = 'Finance'
 10      )
 11  );

DEPENDENTID EMPLOYEEID DEPDOB    RELATION
----------- ---------- --------- -----------
          6        102 11-JUN-85 Son
          7        102 11-JUN-85 Spouse
```

11) Write a subquery that finds average salary by each department. Check to find if employee 543’s salary satisfies =ANY, <ANY, >ANY, <ALL, or >ALL condition against those departmental average salaries.
> ANY
``` sql
SQL> SELECT SALARY
  2  FROM EMPLOYEE
  3  WHERE EMPLOYEEID = 543
  4  AND SALARY = ANY (
  5      SELECT AVG(SALARY)
  6      FROM EMPLOYEE
  7      GROUP BY DEPTID
  8  );

no rows selected
```
> <ANY
```sql
SQL> SELECT SALARY
  2  FROM EMPLOYEE
  3  WHERE EMPLOYEEID = 543
  4  AND SALARY < ANY (
  5      SELECT AVG(SALARY)
  6      FROM EMPLOYEE
  7      GROUP BY DEPTID
  8  );

no rows selected
```
>  \>ANY

```sql
SQL> SELECT SALARY
  2  FROM EMPLOYEE
  3  WHERE EMPLOYEEID = 543
  4  AND SALARY > ANY (
  5      SELECT AVG(SALARY)
  6      FROM EMPLOYEE
  7      GROUP BY DEPTID
  8  );

    SALARY
----------
     98000
```
> <ALL

```sql
SQL> SELECT SALARY
  2  FROM EMPLOYEE
  3  WHERE EMPLOYEEID = 543
  4  AND SALARY < ALL (
  5      SELECT AVG(SALARY)
  6      FROM EMPLOYEE
  7      GROUP BY DEPTID
  8  );

no rows selected
```
> \>All

```sql
SQL> SELECT SALARY
  2  FROM EMPLOYEE
  3  WHERE EMPLOYEEID = 543
  4  AND SALARY > ALL (
  5      SELECT AVG(SALARY)
  6      FROM EMPLOYEE
  7      GROUP BY DEPTID
  8  );

    SALARY
----------
     98000
```

## Use the College database tables to design the following subqueries.

1) Display student Jose Diaz’s faculty advisor’s name and phone number.
``` sql
SQL> select name, phone from faculty where facultyid = (
  2     select facultyid from student where first = 'Jose' and last = 'Diaz'
  3  );

NAME            PHONE
--------------- ----------
Dr. Evans       6305557890
```

2) Find rooms with bottom-2 capacities. Do not include office rooms.
``` sql
SQL> SELECT ROOMID, ROOMTYPE, CAPACITY
  2  FROM location
  3  WHERE ROOMTYPE <> 'Office'
  4  AND CAPACITY IN (
  5      SELECT DISTINCT CAPACITY
  6      FROM location
  7      WHERE ROOMTYPE <> 'Office'
  8      ORDER BY CAPACITY ASC
  9      FETCH FIRST 2 ROWS ONLY
 10  );

    ROOMID ROOMTYPE               CAPACITY
---------- -------------------- ----------
         3 Classroom                    25
         2 Lab                          30
```

3) Find Spring 2003 course sections with the top three maximum count numbers.
```sql
SQL> SELECT TERMID, COURSEID, SECTION, MAXCOUNT
  2  FROM CRSSECTION
  3  WHERE TERMID = (
  4      SELECT TERMID FROM TERM WHERE TERMDESC = 'Spring 2003'
  5  )
  6  AND MAXCOUNT IN (
  7      SELECT DISTINCT MAXCOUNT
  8      FROM CRSSECTION
  9      WHERE TERMID = (SELECT TERMID FROM TERM WHERE TERMDESC = 'Spring 2003')
 10      ORDER BY MAXCOUNT DESC
 11      FETCH FIRST 3 ROWS ONLY
 12  );

    TERMID   COURSEID S   MAXCOUNT
---------- ---------- - ----------
         1          2 A         40
         1          5 A         40
         1          1 A         30
         1          1 A         25
```

4) Find all information regarding classrooms (RoomType = ‘C’).
```sql
SQL> select * from location where roomtype = 'C';

    ROOMID BUILDING                                           ROOMNO       CAPACITY ROOMTYPE
---------- -------------------------------------------------- ---------- ---------- --------------------
         1 Science Building                                   101                50 C
         3 Humanities Building                                301                25 C
```
5) Create a new table, SP03SECT, for Spring 2003 semester course sections using a subquery. Include CourseId, Section, FacultyId and RoomId columns only.
```sql
SQL> CREATE TABLE SP03SECT AS
  2  SELECT COURSEID, SECTION, FACULTYID, ROOMID
  3  FROM CRSSECTION
  4  WHERE TERMID = (
  5      SELECT TERMID
  6      FROM TERM
  7      WHERE TERMDESC = 'Spring 2003'
  8  );

Table created.
SQL> select * from sp03sect;

  COURSEID S  FACULTYID     ROOMID
---------- - ---------- ----------
         1 A        106          1
         1 B        107          2
         2 A        108          3
```

6) Delete rows from SP03SECT table for faculty Mobley.
```sql
SQL> DELETE FROM SP03SECT
  2  WHERE FACULTYID = (
  3      SELECT FACULTYID
  4      FROM FACULTY
  5      WHERE name = 'Dr. Mobley'
  6  );

1 row deleted.

SQL> select * from SP03SECT;

  COURSEID S  FACULTYID     ROOMID
---------- - ---------- ----------
         1 B        107          2
         2 A        108          3
```