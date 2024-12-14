## LAB 1
``` sql
SQL> create table student(ROLL NUMBER(6), NAME VARCHAR2(20), GENDER CHAR(1), AGE NUMBER(3), CGPA NUMBER(4,2));

Table created.

SQL> DESCRIBE STUDENT
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROLL                                               NUMBER(6)
 NAME                                               VARCHAR2(20)
 GENDER                                             CHAR(1)
 AGE                                                NUMBER(3)
 CGPA                                               NUMBER(4,2)

SQL> INSERT INTO STUDENT(ROLL, NAME, GENDER, AGE, CGPA) VALUES (705129, 'Uday', 'M', 19, 9.2);

1 row created.

SQL> INSERT INTO STUDENT VALUES (2247, 'Kush', 'M', 20, 9.1);

1 row created.

SQL> INSERT INTO STUDENT(ROLL, NAME, CGPA) VALUES (7051, 'SAM', 9.2);

1 row created.

SQL> INSERT INTO STUDENT VALUES (&ROLL, '&NAME', '&GENDER', &AGE, &CGPA);
Enter value for roll: 2243
Enter value for name: HARSH
Enter value for gender: M
Enter value for age: 20
Enter value for cgpa: 8.5
old   1: INSERT INTO STUDENT VALUES (&ROLL, '&NAME', '&GENDER', &AGE, &CGPA)
new   1: INSERT INTO STUDENT VALUES (2243, 'HARSH', 'M', 20, 8.5)

1 row created.

SQL> SELECT * FROM STUDENT
  2  ;

      ROLL NAME                 G        AGE       CGPA
---------- -------------------- - ---------- ----------
    705129 Uday                 M         19        9.2
      2247 Kush                 M         20        9.1
      7051 SAM                                      9.2
      2243 HARSH                M         20        8.5

SQL> SELECT ROLL, NAME, CGPA FROM STUDENT
  2  ;

      ROLL NAME                       CGPA
---------- -------------------- ----------
    705129 Uday                        9.2
      2247 Kush                        9.1
      7051 SAM                         9.2
      2243 HARSH                       8.5

SQL> COMMIT;

SQL> ACCEPT Roll PROMPT 'Please enter the Roll of Student:';
Please enter the Roll of Student:2251
SQL> ACCEPT Name PROMPT 'Please enter the Name of Student:';
Please enter the Name of Student:NAVEEN
SQL> ACCEPT Gender PROMPT 'Please enter the Gender of Student:';
Please enter the Gender of Student:M
SQL> ACCEPT Age PROMPT 'Please enter the Age of Student:';
Please enter the Age of Student:20
SQL> ACCEPT CGPA PROMPT 'Please enter the CGPA of Student:';
Please enter the CGPA of Student:9.4
SQL> INSERT INTO STUDENT VALUES (&Roll, '&Name', '&Gender', &Age, &CGPA);
old   1: INSERT INTO STUDENT VALUES (&Roll, '&Name', '&Gender', &Age, &CGPA)
new   1: INSERT INTO STUDENT VALUES (2251, 'NAVEEN', 'M', 20, 9.4)

1 row created.

SQL> SELECT * FROM STUDENT;

      ROLL NAME                 G        AGE       CGPA
---------- -------------------- - ---------- ----------
    705129 Uday                 M         19        9.2
      2247 Kush                 M         20        9.1
      7051 SAM                                      9.2
      2243 HARSH                M         20        8.5
      2251 NAVEEN               M         20        9.4


SQL> ALTER TABLE STUDENT ADD(ADDRESS NUMBER(20));

Table altered.

SQL> SELECT * FROM STUDENT;

      ROLL NAME                 G        AGE       CGPA    ADDRESS
---------- -------------------- - ---------- ---------- ----------
    705129 Uday                 M         19        9.2
      2247 Kush                 M         20        9.1
      7051 SAM                                      9.2
      2243 HARSH                M         20        8.5
      2251 NAVEEN               M         20        9.4
      2239 Devayush             M         20        9.6

SQL> ALTER TABLE STUDENT DROP COLUMN ADDRESS;

Table altered.

SQL> SELECT * FROM STUDENT;

      ROLL NAME                 G        AGE       CGPA
---------- -------------------- - ---------- ----------
    705129 Uday                 M         19        9.2
      2247 Kush                 M         20        9.1
      7051 SAM                                      9.2
      2243 HARSH                M         20        8.5
      2251 NAVEEN               M         20        9.4
      2239 Devayush             M         20        9.6

6 rows selected.

SQL> ALTER TABLE STUDENT ADD(ADDRESS NUMBER(20));

Table altered.

SQL> DESC STUDENT;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROLL                                               NUMBER(6)
 NAME                                               VARCHAR2(20)
 GENDER                                             CHAR(1)
 AGE                                                NUMBER(3)
 CGPA                                               NUMBER(4,2)
 ADDRESS                                            NUMBER(20)

SQL> ALTER TABLE STUDENT MODIFY(ADDRESS varchar2(20));

Table altered.

SQL> DESC STUDENT;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROLL                                               NUMBER(6)
 NAME                                               VARCHAR2(20)
 GENDER                                             CHAR(1)
 AGE                                                NUMBER(3)
 CGPA                                               NUMBER(4,2)
 ADDRESS                                            VARCHAR2(20)


SQL> ALTER TABLE STUDENT RENAME COLUMN ROLL TO ID;

Table altered.

SQL> DESC STUDENT;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER(6)
 NAME                                               VARCHAR2(20)
 GENDER                                             CHAR(1)
 AGE                                                NUMBER(3)
 CGPA                                               NUMBER(4,2)

SQL> select * from student;

        ID NAME                 G        AGE       CGPA
---------- -------------------- - ---------- ----------
    705129 Uday                 M         19        9.2
      2247 Kush                 M         20        9.1
      7051 SAM                                      9.2
      2243 HARSH                M         20        8.5
      2251 NAVEEN               M         20        9.4
      2239 Devayush             M         20        9.6

6 rows selected.

SQL> delete from student where name = 'SAM';

1 row deleted.

SQL> select * from student;

        ID NAME                 G        AGE       CGPA
---------- -------------------- - ---------- ----------
    705129 Uday                 M         19        9.2
      2247 Kush                 M         20        9.1
      2243 HARSH                M         20        8.5
      2251 NAVEEN               M         20        9.4
      2239 Devayush             M         20        9.6

SQL> select gender, name from student;

G NAME
- --------------------
M Uday
M Kush
M HARSH
M NAVEEN
M Devayush

SQL> delete from student where name = 'Uday';

1 row deleted.

SQL> select * from student;

        ID NAME                 G        AGE       CGPA
---------- -------------------- - ---------- ----------
      2247 Kush                 M         20        9.1
      2243 HARSH                M         20        8.5
      2251 NAVEEN               M         20        9.4
      2239 Devayush             M         20        9.6

```