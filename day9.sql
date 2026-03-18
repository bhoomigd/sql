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
SELECT SUM(salary) AS total_salary
FROM hr.employees;

-- M2
SELECT job_id, COUNT(*) AS employee_count
FROM hr.employees
GROUP BY job_id;

-- M3
SELECT department_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id;

-- M4
SELECT department_id,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary
FROM hr.employees
GROUP BY department_id;

-- M5
SELECT department_id, COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id;

-- M6
SELECT job_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id;

-- M7
SELECT department_id, COUNT(commission_pct) AS employees_with_commission
FROM hr.employees
GROUP BY department_id;

-- M8
SELECT job_id,
       MIN(hire_date) AS earliest_hire,
       MAX(hire_date) AS latest_hire
FROM hr.employees
GROUP BY job_id;

-- M9
SELECT COUNT(*) AS total_employees
FROM hr.employees;

-- M10
SELECT department_id,
       AVG(salary) AS avg_salary,
       COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id;

-- M11
SELECT job_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;

-- M12
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
WHERE department_id IN (50, 60, 80)
GROUP BY department_id;

-- M13
SELECT manager_id, COUNT(*) AS employee_count
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- M14
SELECT job_id, MIN(salary) AS min_salary
FROM hr.employees
GROUP BY job_id;

-- M15
SELECT department_id, MAX(hire_date) AS latest_hire
FROM hr.employees
GROUP BY department_id;

-- M16
SELECT SUM(salary) AS total_salary_dept90
FROM hr.employees
WHERE department_id = 90;

-- M17
SELECT COUNT(DISTINCT job_id) AS distinct_jobs
FROM hr.employees;

-- M18
SELECT department_id, job_id, COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id, job_id;

-- M19


-- M20
SELECT job_id, COUNT(*) AS employee_count
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) >= 2;