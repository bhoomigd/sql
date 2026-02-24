CREATE TABLE hr_departments (
    department_id   NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(30) NOT NULL,
    manager_id      NUMBER(6),
    location_id     NUMBER(4)
);
INSERT INTO hr_departments VALUES (10, 'Administration', 200, 1700);
INSERT INTO hr_departments VALUES (20, 'Marketing', 201, 1800);
INSERT INTO hr_departments VALUES (30, 'Purchasing', 114, 1700);
INSERT INTO hr_departments VALUES (40, 'Human Resources', 203, 2400);
INSERT INTO hr_departments VALUES (50, 'Shipping', 121, 1500);
INSERT INTO hr_departments VALUES (60, 'IT', 103, 1400);
INSERT INTO hr_departments VALUES (80, 'Sales', 145, 2500);

COMMIT;
CREATE TABLE hr_employees (
    employee_id    NUMBER(6) PRIMARY KEY,
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(25) NOT NULL,
    email          VARCHAR2(25) NOT NULL,
    phone_number   VARCHAR2(20),
    hire_date      DATE NOT NULL,
    job_id         VARCHAR2(10) NOT NULL,
    salary         NUMBER(8,2),
    commission_pct NUMBER(2,2),
    manager_id     NUMBER(6),
    department_id  NUMBER(4),
    CONSTRAINT fk_dept
    FOREIGN KEY (department_id)
    REFERENCES hr_departments(department_id)
);
INSERT INTO hr_employees VALUES
(100, 'Steven', 'King', 'SKING', '515.123.4567',
 TO_DATE('17-JUN-2003','DD-MON-YYYY'),
 'AD_PRES', 24000, NULL, NULL, 10);

INSERT INTO hr_employees VALUES
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568',
 TO_DATE('21-SEP-2005','DD-MON-YYYY'),
 'AD_VP', 17000, NULL, 100, 20);

INSERT INTO hr_employees VALUES
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569',
 TO_DATE('13-JAN-2001','DD-MON-YYYY'),
 'AD_VP', 17000, NULL, 100, 30);

INSERT INTO hr_employees VALUES
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567',
 TO_DATE('03-JAN-2006','DD-MON-YYYY'),
 'IT_PROG', 9000, NULL, 102, 60);

INSERT INTO hr_employees VALUES
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568',
 TO_DATE('21-MAY-2007','DD-MON-YYYY'),
 'IT_PROG', 6000, NULL, 103, 60);

INSERT INTO hr_employees VALUES
(145, 'John', 'Russell', 'JRUSSELL', '650.507.9876',
 TO_DATE('01-OCT-2004','DD-MON-YYYY'),
 'SA_MAN', 14000, 0.40, 100, 80);

INSERT INTO hr_employees VALUES
(146, 'Karen', 'Partners', 'KPARTNER', '650.507.9877',
 TO_DATE('05-JAN-2005','DD-MON-YYYY'),
 'SA_REP', 10000, 0.30, 145, 80);

COMMIT;

CREATE TABLE hr_emp_backup AS
SELECT * FROM hr_employees;

CREATE TABLE hr_dept_backup AS
SELECT * FROM hr_departments;

M1.CREATE TABLE hr_dept_backup AS
SELECT * FROM hr.departments;

M2.ALTER TABLE hr_emp_backup
ADD notes VARCHAR2(100);

M3.CREATE TABLE emp_50 AS
SELECT * FROM hr.employees
WHERE department_id = 50;

M4.ALTER TABLE hr_emp_backup
ADD updated_at DATE DEFAULT SYSDATE;

M5.CREATE TABLE dept_names AS
SELECT department_id, department_name
FROM hr.departments;

M6.ALTER TABLE hr_emp_backup
MODIFY notes VARCHAR2(500);

M7.CREATE TABLE emp_structure AS
SELECT * FROM hr.employees WHERE 1=0;

M8.RENAME hr_emp_backup TO hr_employees_archive;

M9.ALTER TABLE hr_employees_archive
ADD (created_by VARCHAR2(50),
     created_date DATE);
     
M10.CREATE TABLE high_earners AS
SELECT * FROM hr.employees
WHERE salary > 10000;

M11.ALTER TABLE hr_employees_archive
DROP COLUMN notes;

M12.CREATE TABLE emp_salary_dept AS
SELECT employee_id, salary, department_id
FROM hr.employees;

M13.TRUNCATE TABLE emp_50;

M14.ALTER TABLE hr_employees_archive
RENAME COLUMN remarks TO comments;

M15.CREATE TABLE dept_emp_count AS
SELECT department_id, 0 AS emp_count
FROM hr.departments;