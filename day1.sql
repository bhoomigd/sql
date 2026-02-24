CREATE TABLE employees (
    employee_id     NUMBER PRIMARY KEY,
    first_name      VARCHAR2(50),
    last_name       VARCHAR2(50),
    email           VARCHAR2(50),
    phone_number    VARCHAR2(20),
    hire_date       DATE,
    job_id          VARCHAR2(20),
    salary          NUMBER(10,2),
    commission_pct  NUMBER(4,2),
    manager_id      NUMBER,
    department_id   NUMBER
);
INSERT INTO employees VALUES 
(100, 'Steven', 'King', 'SKING', '515.123.4567',
 TO_DATE('17-06-2003','DD-MM-YYYY'),
 'AD_PRES', 24000, NULL, NULL, 90);

INSERT INTO employees VALUES 
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568',
 TO_DATE('21-09-2005','DD-MM-YYYY'),
 'AD_VP', 17000, NULL, 100, 90);

INSERT INTO employees VALUES 
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569',
 TO_DATE('13-01-2001','DD-MM-YYYY'),
 'AD_VP', 17000, NULL, 100, 90);

COMMIT;
CREATE TABLE departments (
    department_id   NUMBER PRIMARY KEY,
    department_name VARCHAR2(50),
    manager_id      NUMBER,
    location_id     NUMBER
);
INSERT INTO departments VALUES
(90, 'Executive', 100, 1700);

INSERT INTO departments VALUES
(60, 'IT', 103, 1400);

INSERT INTO departments VALUES
(100, 'Finance', 108, 1700);

COMMIT;
SELECT employee_id, first_name, last_name
FROM employees;
1.
SELECT employee_id, first_name, last_name
FROM hr.employees;

2.
SELECT first_name || ' ' || last_name AS full_name
FROM hr.employees;

3.
SELECT first_name || ' ' || last_name AS full_name
FROM hr.employees;

4.
SELECT employee_id,
       first_name,
       last_name,
       salary,
       salary * 12 AS annual_salary
FROM hr.employees;
