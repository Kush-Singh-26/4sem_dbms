# LAB 8

1. Create a view to include all employee information, but hide salary and commission.

```sql
CREATE VIEW employee_info AS
SELECT employeeid, fname, lname, positionid, supervisor, deptid
FROM employee;
```
2. Create a view to include department name and average salary by department.

```sql
CREATE VIEW dept_avg_salary AS
SELECT d.deptname, AVG(e.salary) AS average_salary
FROM employee e
JOIN dept d ON e.deptid = d.deptid
GROUP BY d.deptname;
```
3. Create an index to search students faster based on their major ID.

```sql
CREATE INDEX idx_major_id ON student(majorid);
```

4. Create a sequence to add room IDs and then insert a new room into LOCATION table using the newly created sequence. What is the CURRVAL after the new row is inserted?

```sql
CREATE SEQUENCE room_id_seq START WITH 1 INCREMENT BY 1;

INSERT INTO location (roomid, roomtype, building, roomno, capacity)
VALUES (room_id_seq.NEXTVAL, 'Conference Room', 'Electronics Building', 601, 101);

SELECT room_id_seq.CURRVAL FROM dual;

CURRVAL
---------
        1
```

5. Create a view that will display name, department number, and total income (salary + commission) of each employee in department 10. Prevent change of department through the view.

```sql
CREATE VIEW dept10_employee AS
SELECT fname, lname, deptid, (salary + NVL(commission, 0)) AS total_income
FROM employee
WHERE deptid = 10
WITH CHECK OPTION;
```

6. Create a view that will display department names and sum of all employee income by department.

```sql
CREATE VIEW dept_total_income AS
SELECT d.deptname, SUM(e.salary + NVL(e.commission, 0)) AS total_income
FROM employee e
JOIN dept d ON e.deptid = d.deptid
GROUP BY d.deptname;
```
7. Create a sequence deptid_seq to generate department Id (in dept table) and another sequence empid_seq to generate employee Id (in the employee table). Use deptid_seq to add a new department in the dept table. Now, add yourself as a new employee with empid_seq in the department you just added.

```sql
CREATE SEQUENCE deptid_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE empid_seq START WITH 1000 INCREMENT BY 1;

INSERT INTO dept (deptid, deptname, location)
VALUES (deptid_seq.NEXTVAL, 'Management', 'San Francisco');

INSERT INTO employee (employeeid, fname, lname, positionid, deptid, hiredate)
VALUES (empid_seq.NEXTVAL, 'Kush', 'Singh', 111, deptid_seq.CURRVAL, TO_DATE('2020-05-15', 'YYYY-MM-DD'));
```
