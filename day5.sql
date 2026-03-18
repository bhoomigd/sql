CREATE TABLE hr_emp_backup (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    department_id NUMBER,
    job_id VARCHAR2(20),
    salary NUMBER,
    hire_date DATE
);
INSERT INTO hr_emp_backup VALUES (100,'SURYA','King',90,'AD_PRES',24000,DATE '2003-06-17');
INSERT INTO hr_emp_backup VALUES (101,'Neena','Kochhar',90,'AD_VP',17000,DATE '2005-09-21');
INSERT INTO hr_emp_backup VALUES (102,'LAKS','De Haan',90,'AD_VP',17000,DATE '2001-01-13');
INSERT INTO hr_emp_backup VALUES (103,'AlICE','Hunold',60,'IT_PROG',9000,DATE '2006-01-03');
INSERT INTO hr_emp_backup VALUES (104,'BRUNDA','Ernst',60,'IT_PROG',6000,DATE '2007-05-21');
INSERT INTO hr_emp_backup VALUES (105,'DaNISH','Austin',60,'IT_PROG',4800,DATE '2005-06-25');
COMMIT;
-- M1
UPDATE hr_emp_backup
SET salary = salary + 500
WHERE employee_id = 100;
COMMIT;
SELECT * FROM hr_emp_backup WHERE employee_id = 100;

-- M2
UPDATE hr_emp_backup SET salary = salary + 100 WHERE employee_id = 101;
UPDATE hr_emp_backup SET salary = salary + 200 WHERE employee_id = 102;
ROLLBACK;
SELECT * FROM hr_emp_backup WHERE employee_id IN (101,102);

-- M3
UPDATE hr_emp_backup SET salary = salary + 100 WHERE employee_id = 103;
SAVEPOINT sp1;
UPDATE hr_emp_backup SET salary = salary + 200 WHERE employee_id = 104;
ROLLBACK TO sp1;

-- M4
CREATE ROLE hr_select_role;
GRANT SELECT ON hr.employees TO hr_select_role;

-- M5
REVOKE SELECT ON hr.departments FROM some_user;

-- M6
UPDATE hr_emp_backup SET salary = salary * 1.05 WHERE employee_id = 100;
SAVEPOINT sp1;
UPDATE hr_emp_backup SET salary = salary * 1.10 WHERE employee_id = 101;
ROLLBACK TO sp1;
COMMIT;

-- M7
GRANT INSERT, UPDATE ON hr_emp_backup TO your_role;

-- M8
DECLARE
v_rows NUMBER;
BEGIN
UPDATE hr_emp_backup
SET salary = salary + 300
WHERE department_id = 60;
v_rows := SQL%ROWCOUNT;
ROLLBACK;
END;
/

-- M9
CREATE ROLE hr_report;
GRANT SELECT ON hr.employees TO hr_report;
GRANT SELECT ON hr.departments TO hr_report;

-- M10
DELETE FROM hr_emp_backup WHERE employee_id = 109;

-- M11
UPDATE hr_emp_backup SET salary = salary + 100 WHERE employee_id = 103;
SAVEPOINT a;
UPDATE hr_emp_backup SET salary = salary + 200 WHERE employee_id = 104;
SAVEPOINT b;
UPDATE hr_emp_backup SET salary = salary + 300 WHERE employee_id = 105;
ROLLBACK TO a;
COMMIT;

-- M12
GRANT SELECT ON hr.employees TO user1;
REVOKE SELECT ON hr.employees FROM user1;

-- M13
UPDATE hr_emp_backup SET salary = salary + 500 WHERE department_id = 60;
UPDATE hr_emp_backup SET salary = salary + 300 WHERE department_id = 90;
COMMIT;

-- M14
CREATE ROLE dept_reader;
GRANT SELECT ON hr.departments TO dept_reader;

-- M15
UPDATE hr_emp_backup SET salary = salary + 200 WHERE employee_id = 106;
SELECT * FROM hr_emp_backup WHERE employee_id = 106;
ROLLBACK;

-- M16
UPDATE hr_emp_backup SET salary = salary + 100 WHERE employee_id = 107;
SAVEPOINT sp1;
UPDATE hr_emp_backup SET salary = salary + 200 WHERE employee_id = 108;
SAVEPOINT sp2;
ROLLBACK TO sp1;

-- M17

-- M18

-- M19
GRANT hr_reader TO app_user;

-- M20
DELETE FROM hr_emp_backup
WHERE employee_id IN (103,104,105,106,107);
ROLLBACK;
SELECT COUNT(*) FROM hr_emp_backup;