CREATE TABLE hr.departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50)
);
CREATE TABLE hr.employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(50),
    phone_number VARCHAR2(20),
    hire_date DATE,
    job_id VARCHAR2(20),
    salary NUMBER(10,2),
    commission_pct NUMBER(5,2),
    manager_id NUMBER,
    department_id NUMBER
);
INSERT INTO hr.departments VALUES (10, 'Administration');
INSERT INTO hr.departments VALUES (20, 'Marketing');
INSERT INTO hr.departments VALUES (30, 'Purchasing');
INSERT INTO hr.departments VALUES (40, 'Human Resources');
INSERT INTO hr.departments VALUES (50, 'Shipping');
INSERT INTO hr.departments VALUES (60, 'IT');
INSERT INTO hr.employees VALUES
(100,'Steven','King','SKING','515.123.4567',DATE '2003-06-17','AD_PRES',24000,NULL,NULL,10);

INSERT INTO hr.employees VALUES
(101,'Neena','Kochhar','NKOCHHAR','515.123.4568',DATE '2005-09-21','AD_VP',17000,NULL,100,20);

INSERT INTO hr.employees VALUES
(102,'Lex','De Haan','LDEHAAN','515.123.4569',DATE '2001-01-13','AD_VP',17000,NULL,100,30);

INSERT INTO hr.employees VALUES
(103,'Alexander','Hunold','AHUNOLD','590.423.4567',DATE '2006-01-03','IT_PROG',9000,NULL,102,60);

INSERT INTO hr.employees VALUES
(104,'Bruce','Ernst','BERNST','590.423.4568',DATE '2007-05-21','IT_PROG',6000,NULL,103,60);

INSERT INTO hr.employees VALUES
(105,'David','Austin','DAUSTIN','590.423.4569',DATE '2005-06-25','IT_PROG',4800,NULL,103,60);
-- M1
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;

-- M2
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

-- M3
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- M4
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.department_id = 50;

-- M5
SELECT e.employee_id, e.salary, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;

-- M6
SELECT DISTINCT d.department_id, d.department_name
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id;

-- M7
SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.salary > 8000;

-- M8
SELECT e.employee_id, e.job_id, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;

-- M9
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- M10
SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Sales';

-- M11
SELECT d.department_id, d.department_name, SUM(e.salary) AS total_salary
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- M12
SELECT e.employee_id, e.hire_date, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;

-- M13
SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
ORDER BY d.department_name, e.last_name;

-- M14
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- M15
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.job_id = 'SA_REP';

-- M16
SELECT d.department_name, MIN(e.salary) AS min_salary
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- M17
SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.department_id IN (80, 90);

-- M18
SELECT e.employee_id, e.salary, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
ORDER BY e.salary DESC
FETCH FIRST 5 ROWS ONLY;

-- M19
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 5;

-- M20
SELECT e.first_name, e.last_name, d.department_name, e.hire_date
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;