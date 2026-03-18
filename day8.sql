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
CREATE TABLE hr.departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50)
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
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;

-- M2
SELECT e.first_name, e.last_name,
       m.first_name AS manager_first_name,
       m.last_name AS manager_last_name
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;

-- M3
SELECT d.department_id, d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- M4
SELECT e.employee_id, e.first_name, e.last_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- M5
SELECT e.first_name, e.last_name,
       COALESCE(d.department_name, 'No Dept') AS department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;

-- M6
SELECT d.department_id, d.department_name,
       SUM(e.salary) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- M7
SELECT e.first_name, e.last_name,
       m.first_name AS manager_first_name,
       m.last_name AS manager_last_name
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;

-- M8
SELECT d.department_id, d.department_name
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- M9
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;

-- M10
SELECT d.department_id, d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- M11
SELECT e.first_name, e.last_name,
       m.first_name AS mgr_first_name,
       m.last_name AS mgr_last_name
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;

-- M12
SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;

-- M13
SELECT d.department_id, d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- M14
SELECT e.employee_id, e.salary,
       NVL(d.department_name, 'Unassigned') AS department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;

-- M15
SELECT e.employee_id, e.first_name, e.last_name,
       m.employee_id AS mgr_emp_id,
       m.last_name AS mgr_last_name
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;

-- M16
SELECT d.department_name,
       MIN(e.salary) AS min_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- M17
SELECT e.employee_id, e.first_name,
       m.first_name AS manager_first_name
FROM hr.employees e
INNER JOIN hr.employees m
ON e.manager_id = m.employee_id;

-- M18
SELECT e.employee_id, e.first_name, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;

-- M19
SELECT d.department_id, d.department_name,
       AVG(e.salary) AS avg_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- M20
SELECT e.first_name, e.last_name,
       COALESCE(d.department_name, 'N/A') AS department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;