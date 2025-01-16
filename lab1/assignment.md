# LAB 1 Assignment

1) ## STUDENT (StudentId, Last, First, Street, City, State, Zip, StartTerm, BirthDate,FacultyId, MajorId, Phone)

``` sql
SQL> create table student(StudentId INT PRIMARY KEY, Last VARCHAR(50) NOT NULL, First VARCHAR(50) NOT NULL, Street VARCHAR(50), City VARCHAR(50), State VARCHAR(50), ZIP INT, StartTerm INT, BirthDate DATE, FacultyId INT, MajorId VARCHAR(20), Phone INT);
```
## All tables :


```sql
SQL> desc student
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 STUDENTID                                 NOT NULL NUMBER(38)
 LAST                                      NOT NULL VARCHAR2(50)
 FIRST                                     NOT NULL VARCHAR2(50)
 STREET                                             VARCHAR2(100)
 CITY                                      NOT NULL VARCHAR2(50)
 STATE                                     NOT NULL CHAR(2)
 ZIP                                                CHAR(5)
 STARTTERM                                 NOT NULL VARCHAR2(10)
 BIRTHDATE                                 NOT NULL DATE
 FACULTYID                                          NUMBER(38)
 MAJORID                                            NUMBER(38)
 PHONE                                              CHAR(10)

SQL> desc faculty
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FACULTYID                                 NOT NULL NUMBER(38)
 NAME                                      NOT NULL VARCHAR2(100)
 ROOMID                                             NUMBER(38)
 PHONE                                              CHAR(10)
 DEPTID                                             NUMBER(38)

SQL> desc course
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COURSEID                                  NOT NULL NUMBER(38)
 TITLE                                     NOT NULL VARCHAR2(100)
 CREDITS                                   NOT NULL NUMBER(38)
 PREREQ                                             NUMBER(38)

SQL> desc crssection
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CSID                                      NOT NULL NUMBER(38)
 COURSEID                                  NOT NULL NUMBER(38)
 SECTION                                   NOT NULL CHAR(1)
 TERMID                                    NOT NULL NUMBER(38)
 FACULTYID                                 NOT NULL NUMBER(38)
 DAY                                       NOT NULL VARCHAR2(20)
 STARTTIME                                 NOT NULL DATE
 ENDTIME                                   NOT NULL DATE
 ROOMID                                    NOT NULL NUMBER(38)
 MAXCOUNT                                  NOT NULL NUMBER(38)

SQL> desc term
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TERMID                                    NOT NULL NUMBER(38)
 TERMDESC                                  NOT NULL VARCHAR2(100)
 STARTDATE                                 NOT NULL DATE
 ENDDATE                                   NOT NULL DATE

SQL> desc room
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROOMTYPE                                  NOT NULL VARCHAR2(20)
 ROOMDESC                                  NOT NULL VARCHAR2(100)

SQL> desc registration
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 STUDENTID                                 NOT NULL NUMBER(38)
 CSID                                      NOT NULL NUMBER(38)
 MIDTERM                                            NUMBER(5,2)
 FINAL                                              NUMBER(5,2)
 REGSTATUS                                 NOT NULL VARCHAR2(20)

SQL> desc department
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPTID                                    NOT NULL NUMBER(38)
 DEPTNAME                                  NOT NULL VARCHAR2(100)
 FACULTYID                                 NOT NULL NUMBER(38)

SQL> desc major
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 MAJORID                                   NOT NULL NUMBER(38)
 MAJORDESC                                 NOT NULL VARCHAR2(100)

SQL> desc location
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROOMID                                    NOT NULL NUMBER(38)
 BUILDING                                  NOT NULL VARCHAR2(50)
 ROOMNO                                    NOT NULL VARCHAR2(10)
 CAPACITY                                  NOT NULL NUMBER(38)
 ROOMTYPE                                  NOT NULL VARCHAR2(20)

SQL> desc employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEEID                                NOT NULL NUMBER(38)
 LNAME                                     NOT NULL VARCHAR2(50)
 FNAME                                     NOT NULL VARCHAR2(50)
 POSITIONID                                NOT NULL NUMBER(38)
 SUPERVISIOR                                        NUMBER(38)
 HIREDATE                                  NOT NULL DATE
 SALARY                                             NUMBER(10,2)
 COMMISSION                                         NUMBER(10,2)
 DEPTID                                    NOT NULL NUMBER(38)
 QUALID                                             NUMBER(38)

SQL> desc position
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 POSITIONID                                NOT NULL NUMBER(38)
 POSDESC                                   NOT NULL VARCHAR2(100)

SQL> desc dept
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPTID                                    NOT NULL NUMBER(38)
 DEPTNAME                                  NOT NULL VARCHAR2(100)
 LOCATION                                  NOT NULL VARCHAR2(100)
 EMPLOYEEID                                         NUMBER(38)

SQL> desc qualification
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 QUALID                                    NOT NULL NUMBER(38)
 QUALDESC                                  NOT NULL VARCHAR2(100)

SQL> desc dependent
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPENDENTID                               NOT NULL NUMBER(38)
 EMPLOYEEID                                NOT NULL NUMBER(38)
 DEPDOB                                    NOT NULL DATE
 RELATION                                  NOT NULL VARCHAR2(50)

SQL> desc dependent
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPENDENTID                               NOT NULL NUMBER(38)
 EMPLOYEEID                                NOT NULL NUMBER(38)
 DEPDOB                                    NOT NULL DATE
 RELATION                                  NOT NULL VARCHAR2(50)

SQL> create table EMPLEVEL (LevelNo int, LowSalary int, HighSalary int);

```