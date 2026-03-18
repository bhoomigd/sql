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
SELECT department_id
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) > 8000;

-- M2
SELECT job_id
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) > 3;

-- M3
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- M4
SELECT department_id
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) > 150000;

-- M5
SELECT job_id
FROM hr.employees
GROUP BY job_id
HAVING MIN(salary) < 4000;

-- M6
SELECT department_id, COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- M7
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- M8
SELECT job_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) > 2;

-- M9
SELECT department_id
FROM hr.employees
GROUP BY department_id
HAVING MAX(salary) > 12000;

-- M10
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM hr.departments d
JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 3;

-- M11
SELECT job_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
HAVING SUM(salary) > 50000;

-- M12
SELECT department_id
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) BETWEEN 6000 AND 10000;

-- M13
SELECT d.department_name,
       MIN(e.salary) AS min_salary,
       MAX(e.salary) AS max_salary
FROM hr.employees e

-- M14
SELECT job_id
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) = 2;

-- M15
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) < 7000;

-- M16
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) > 10;

-- M17
SELECT job_id, COUNT(*) AS employee_count
FROM hr.employees
WHERE job_id LIKE 'SA%'
GROUP BY job_id;

-- M18
SELECT department_id
FROM hr.employees
GROUP BY department_id
HAVING MIN(hire_date) > DATE '2005-01-01';

-- M19


-- M20
SELECT job_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) >= 1
ORDER BY AVG(salary) DESC;