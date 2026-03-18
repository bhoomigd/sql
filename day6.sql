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

-- Q1
SELECT employee_id, first_name, LENGTH(last_name) AS last_name_length
FROM hr.employees;

-- Q2
SELECT employee_id, first_name, hire_date
FROM hr.employees
WHERE EXTRACT(YEAR FROM hire_date) = 2004;

-- Q3
SELECT employee_id, job_id,
CASE
WHEN job_id LIKE 'SA%' THEN 'Sales'
ELSE 'Other'
END AS job_type
FROM hr.employees;

-- Q4
SELECT first_name, last_name,
MONTHS_BETWEEN(SYSDATE, hire_date) AS tenure_months
FROM hr.employees;

-- Q5
SELECT employee_id, salary, department_id
FROM hr.employees
WHERE salary BETWEEN 4000 AND 8000
AND (department_id = 50 OR department_id = 60);

-- Q6
SELECT employee_id, salary,
CASE
WHEN salary < 5000 THEN 'Tier1'
WHEN salary < 10000 THEN 'Tier2'
ELSE 'Tier3'
END AS salary_level
FROM hr.employees;

-- Q7
SELECT last_name, INITCAP(last_name) AS formatted_name
FROM hr.employees;

-- Q8
SELECT employee_id, first_name, department_id
FROM hr.employees
WHERE department_id IN
(SELECT department_id FROM hr.departments
WHERE department_id IN (10,20,30));

-- Q9
SELECT employee_id, hire_date,
EXTRACT(MONTH FROM hire_date) AS hire_month
FROM hr.employees;

-- Q10
SELECT employee_id,
COALESCE(phone_number, 'No Phone') AS contact
FROM hr.employees;

-- Q11
SELECT employee_id, salary, department_id
FROM hr.employees
WHERE (department_id = 50 AND salary > 5000)
OR department_id = 60;

-- Q12
SELECT employee_id, hire_date,
ADD_MONTHS(hire_date, 12) AS one_year_later
FROM hr.employees;

-- Q13
SELECT first_name, last_name,
SUBSTR(first_name,1,1) || SUBSTR(last_name,1,1) AS initials
FROM hr.employees;

-- Q14
SELECT employee_id, first_name, hire_date
FROM hr.employees
WHERE hire_date > DATE '2006-01-01';

-- Q15
SELECT employee_id, commission_pct,
NVL2(commission_pct,'Yes','No') AS has_commission
FROM hr.employees;

-- Q16
SELECT employee_id, salary,
ROUND(salary, -2) AS salary_rounded
FROM hr.employees;

-- Q17
SELECT employee_id, job_id, salary
FROM hr.employees
WHERE job_id IN ('SA_REP','SA_MAN')
AND salary > 8000;

-- Q18
SELECT employee_id, hire_date,
TRUNC(hire_date) AS hire_day
FROM hr.employees;

-- Q19
SELECT last_name,
LOWER(last_name) AS last_lower
FROM hr.employees;

-- Q20
SELECT employee_id, first_name, hire_date
FROM hr.employees
WHERE MONTHS_BETWEEN(SYSDATE, hire_date)/12 >= 10;