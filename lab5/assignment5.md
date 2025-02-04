# LAB 5

## Use the Corporation database tables to design the following queries.

1)  Display all employee names and their department names.
``` sql
SQL> select e.fname || ' ' ||  e.lname as "NAME", d.deptname from employee e join department d on e.deptid = d.deptid;

NAME                                                                                                  DEPTNAME
-----------------------------------------------------------------------------------------------------------------------
Liam Taylor                                                                                           Computer Science
Olivia Martinez                                                                                       Mathematics
```
2)  Find name of the supervisor for employee number 433.
``` sql
SQL> SELECT
  2      e.LNAME || ' ' || e.FNAME AS "employee name",
  3      s.LNAME || ' ' || s.FNAME AS "supervisor name"
  4  FROM
  5      employee e
  6  JOIN
  7      employee s ON e.SUPERVISOR = s.EMPLOYEEID
  8  WHERE
  9      e.EMPLOYEEID = 433;

employee name                   supervisor name
------------------------------- -------------------------------
John Doe                        Martinez Olivia
```

3) Find all employees’ full names (lastname, firstname format) with salary, and their supervisor’s name with salary.
``` sql
SQL> SELECT
  2      e.LNAME || ', ' || e.FNAME AS "employee name",
  3      e.SALARY AS "employee salary",
  4      s.LNAME || ', ' || s.FNAME AS "supervisor name",
  5      s.SALARY AS "supervisor salary"
  6  FROM
  7      employee e
  8  LEFT JOIN
  9      employee s ON TO_NUMBER(e.SUPERVISOR) = s.EMPLOYEEID;

employee name                    employee salary supervisor name                  supervisor salary
-------------------------------- --------------- -------------------------------- -----------------
Johnson, Michael                           77000 Smith, John                                  80000
Taylor, Liam                               68200 Johnson, Emily                               85000
Martinez, Olivia                           49500 Johnson, Emily                               85000
Williams, James                            60500 Johnson, Emily                               85000
Smith, John                                80000 Doe, Jane                                    66000
Johnson, Emily                             85000 Doe, Jane                                    66000
Jones, Linda                               76000 Johnson, Michael                             77000
Brown, Emily                               49500 Johnson, Michael                             77000
Davis, Sarah                               60500 Martinez, Olivia                             49500
John, Doe                                  95000 Martinez, Olivia                             49500
Williams, James                            95000 Williams, James                              60500
Brown, Michael                             77000 Williams, James                              60500
Doe, Jane                                  66000 Williams, James                              60500

13 rows selected.
```

4) Find each employee’s salary information and level based on the salary.
``` sql
SQL> SELECT
  2      e.EmployeeId,
  3      e.Salary AS "employee salary",
  4      el.LevelNo AS "level number",
  5      el.LowSalary AS "level low salary",
  6      el.HighSalary AS "level high salary"
  7  FROM
  8      EMPLOYEE e
  9  JOIN
 10      EMPLEVEL el ON e.Salary BETWEEN el.LowSalary AND el.HighSalary;

EMPLOYEEID employee salary level number level low salary level high salary
---------- --------------- ------------ ---------------- -----------------
       103           49500            1                0             50000
       107           49500            1                0             50000
       102           66000            2            50001             70000
       105           60500            2            50001             70000
       106           68200            2            50001             70000
       108           60500            2            50001             70000
         1           80000            3            70001             90000
         2           85000            3            70001             90000
         4           76000            3            70001             90000
         5           77000            3            70001             90000
       104           77000            3            70001             90000
         3           95000            4            90001            110000
       433           95000            4            90001            110000

13 rows selected.

```

5) Display each employee’s name, department name, position description, and qualification description. Which employee is missing? Why?
``` sql
SQL> SELECT
  2      e.LNAME || ', ' || e.FNAME AS "employee name",
  3      d.DeptName AS "department name",
  4      p.PosDesc AS "position description",
  5      q.QualDesc AS "qualification description"
  6  FROM
  7      EMPLOYEE e
  8  JOIN
  9      DEPT d ON e.DeptId = d.DeptId
 10  JOIN
 11      POSITION p ON e.PositionId = p.PositionId
 12  JOIN
 13      QUALIFICATION q ON e.QualId = q.QualId;

employee name                    department name position descri qualification description
-------------------------------------------------------------------------------------------
Doe, Jane                        Finance         Position 2      Master of Science
Brown, Emily                     IT              Position 3      PhD in Computer Science
```
> If any employee is missing from the output, it indicates that there is no matching entry in one of these tables for that employee.

6) Find all employees in the sales department.
``` sql
SQL> SELECT
  2      e.EMPLOYEEID,
  3      e.LNAME || ', ' || e.FNAME AS "Employee Name",
  4      d.DeptName AS "Department Name"
  5  FROM
  6      EMPLOYEE e
  7  JOIN
  8      DEPT d ON e.DEPTID = d.DEPTID
  9  WHERE
 10      d.DeptName = 'Sales';

EMPLOYEEID Employee Name                    Department Name
---------- -------------------------------- ---------------
       104 Johnson, Michael                 Sales
```

7) Display employee names and dependent information using an outer join.

``` sql
SQL> SELECT
  2      e.LNAME || ', ' || e.FNAME AS "Employee Name",
  3      d.DependentId,
  4      d.DepDOB AS "Dependent Date of Birth",
  5      d.Relation
  6  FROM
  7      EMPLOYEE e
  8  RIGHT JOIN
  9      DEPENDENT d ON e.EMPLOYEEID = d.EMPLOYEEID;

Employee Name                    DEPENDENTID Dependent RELATION
-------------------------------- ----------- --------- --------------------------------------------------
Doe, Jane                                  6 11-JUN-85 Son
Doe, Jane                                  7 11-JUN-85 Spouse
Johnson, Michael                          10 11-JUN-75 Spouse
Johnson, Michael                           1 11-MAY-85 Daughter
Taylor, Liam                               2 10-MAY-85 Parent
```

8) Find out the names and number of years worked along with their department names in descending order by number of years worked.

``` sql
SQL> SELECT DISTINCT
  2      e.LNAME || ', ' || e.FNAME AS "Employee Name",
  3      d.DeptName AS "Department Name",
  4      EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM e.HIREDATE) AS "Years Worked"
  5  FROM
  6      EMPLOYEE e
  7  JOIN
  8      DEPT d ON e.DEPTID = d.DEPTID
  9  ORDER BY
 10      "Years Worked" DESC;

Employee Name                    Department Name Years Worked
-------------------------------- --------------- ------------
Brown, Emily                     IT                         7
Doe, Jane                        Finance                    6
Jones, Linda                     IT                         6
Brown, Michael                   Finance                    5
Smith, John                      HR                         5
Johnson, Emily                   HR                         4
Johnson, Michael                 Sales                      4
Williams, James                  Finance                    3

8 rows selected.
```

9) Who works in the same department in which John Smith works? (Hint : use self join)

``` sql
SQL> SELECT
  2      e2.LNAME || ', ' || e2.FNAME AS "Employee Name",
  3      e2.DEPTID AS "Department ID"
  4  FROM
  5      EMPLOYEE e1
  6  JOIN
  7      EMPLOYEE e2 ON e1.DEPTID = e2.DEPTID
  8  WHERE
  9      e1.LNAME = 'Smith' AND e1.FNAME = 'John'
 10      AND e2.EMPLOYEEID <> e1.EMPLOYEEID;

Employee Name                    Department ID
-------------------------------- -------------
Johnson, Emily                              10
```

## Use the College database tables to design the following queries.

1) Display a student’s full name along with his/her major’s description. 

``` sql
SQL> SELECT
  2      s.Last || ', ' || s.First AS "Student Name",
  3      m.MajorDesc AS "Major Description"
  4  FROM
  5      STUDENT s
  6  JOIN
  7      MAJOR m ON s.MajorId = m.MajorId;

Student Name                                                                                           Major Description
----------------------------------------------------------------------------------------------------------------------------
Davis, Sarah                                                                                           Biology
Johnson, Michael                                                                                       Chemistry
Brown, Emily                                                                                           Computer Science
Smith, John                                                                                            Mathematics
Doe, Jane                                                                                              Physics
```

2) Get names of students, who received final grade ‘F’ in Winter 2003.
``` sql
SQL> SELECT
  2      s.Last || ' ' || s.First AS "Student Name",
  3      r.Final AS "Final Grade",
  4      t.TermDesc AS "Term"
  5  FROM
  6      STUDENT s
  7  JOIN
  8      REGISTRATION r ON s.StudentId = r.StudentId
  9  JOIN
 10      CRSSECTION cs ON r.CsId = cs.CsId
 11  JOIN
 12      TERM t ON cs.TermId = t.TermId
 13  WHERE
 14      r.Final = 'F'
 15      AND t.TermDesc = 'Winter 2003';

Student Name                                                                                          Final Grade     Term
----------------------------------------------------------------------------------------------------------------------------------
Doe Jane                                                                                              F               Winter 2003
```

3) Display student names, their faculty advisors names, and faculty’s office location.
``` sql
SQL> SELECT
  2      s.Last || ', ' || s.First AS "Student Name",
  3      f.Name AS "Faculty Advisor Name",
  4      l.Building AS "Building Location"
  5  FROM
  6      STUDENT s
  7  JOIN
  8      FACULTY f ON s.FacultyId = f.FacultyId
  9  JOIN
 10      LOCATION l ON f.RoomId = l.RoomId;

Student Name                     Faculty Advisor Name                                                                                 Building Location
-------------------------------- ---------------------------------------------------------------------------------------------------- --------------------------------------------------
Smith, John                      Dr. Allen                                                                                            Science Building
Doe, Jane                        Dr. Baker                                                                                            Engineering Building
Brown, Emily                     Dr. Carter                                                                                           Humanities Building
Johnson, Michael                 Dr. Davis                                                                                            Administration Building
Davis, Sarah                     Dr. Evans                                                                                            Main Building
```

4) Get Spring 2003 course sections with the faculty member assigned to teach the class. Include course sections without any faculty assigned to them.
``` sql
SQL> SELECT
  2      c.Title AS "Course Title",
  3      cs.Section AS "Section",
  4      f.Name AS "Faculty Name",
  5      cs.TermId AS "Term ID"
  6  FROM
  7      CRSSECTION cs
  8  JOIN
  9      COURSE c ON cs.CourseId = c.CourseId
 10  LEFT JOIN
 11      FACULTY f ON cs.FacultyId = f.FacultyId
 12  JOIN
 13      TERM t ON cs.TermId = t.TermId
 14  WHERE
 15      t.TermDesc = 'Spring 2003';

Course Title         S Faculty Name       Term ID
-------------------- - --------------- ----------
Biology I            A Dr. Evans                1
Chemistry I          C Dr. Davis                1
Mathematics I        A                          1
Mathematics I        B                          1
Mathematics I        A Dr. Allen                1
Physics I            A                          1

6 rows selected.
```

5) Display course titles along with their prerequisite names. Display courses without prerequisite also.
``` sql
SQL> SELECT
  2      c.Title AS "Course Title",
  3      p.Title AS "Prerequisite Title"
  4  FROM
  5      COURSE c
  6  LEFT JOIN
  7      COURSE p ON c.PreReq = p.CourseId;

Course Title         Prerequisite Title
-------------------- --------------------
Mathematics I         
Physics I             Mathematics I
Computer Science I
Chemistry I
Biology I
```
