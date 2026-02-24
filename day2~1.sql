
Error starting at line : 1 in command -
CREATE TABLE employees (
    employee_id     NUMBER PRIMARY KEY,
    first_name      VARCHAR2(50),
    last_name       VARCHAR2(50),
    email           VARCHAR2(50),
    hire_date       DATE,
    job_id          VARCHAR2(20),
    salary          NUMBER(10,2),
    commission_pct  NUMBER(4,2),
    manager_id      NUMBER,
    department_id   NUMBER
);
INSERT INTO employees VALUES
(100, 'Steven', 'King', 'SKING',
 TO_DATE('17-06-2003','DD-MM-YYYY'),
 'AD_PRES', 24000, NULL, NULL, 90);

INSERT INTO employees VALUES
(101, 'Neena', 'Kochhar', 'NKOCHHAR',
 TO_DATE('21-09-2005','DD-MM-YYYY'),
 'AD_VP', 17000, NULL, 100, 90);

INSERT INTO employees VALUES
(102, 'Lex', 'De Haan', 'LDEHAAN',
 TO_DATE('13-01-2001','DD-MM-YYYY'),
 'AD_VP', 17000, NULL, 100, 90);

INSERT INTO employees VALUES
(103, 'Alexander', 'Hunold', 'AHUNOLD',
 TO_DATE('03-01-2006','DD-MM-YYYY'),
 'IT_PROG', 9000, NULL, 102, 60);

INSERT INTO employees VALUES
(104, 'Bruce', 'Ernst', 'BERNST',
 TO_DATE('21-05-2007','DD-MM-YYYY'),
 'IT_PROG', 6000, NULL, 103, 60);

INSERT INTO employees VALUES
(105, 'David', 'Austin', 'DAUSTIN',
 TO_DATE('25-06-2005','DD-MM-YYYY'),
 'SA_REP', 4800, 0.10, 101, 80);

INSERT INTO employees VALUES
(106, 'Diana', 'Lorentz', 'DLORENTZ',
 TO_DATE('07-02-2007','DD-MM-YYYY'),
 'SA_MAN', 14000, 0.20, 101, 80);

INSERT INTO employees VALUES
(107, 'Nancy', 'Greenberg', 'NGREENBE',
 TO_DATE('17-08-2002','DD-MM-YYYY'),
 'FI_MGR', 12000, NULL, 100, 100);

COMMIT;
CREATE TABLE departments (
    department_id   NUMBER PRIMARY KEY,
    department_name VARCHAR2(50),
    manager_id      NUMBER,
    location_id     NUMBER
);
INSERT INTO departments VALUES (90, 'Executive', 100, 1700);
INSERT INTO departments VALUES (60, 'IT', 103, 1400);
INSERT INTO departments VALUES (80, 'Sales', 106, 1500);
INSERT INTO departments VALUES (100, 'Finance', 107, 1700);

COMMIT;
SELECT * FROM employees;

SELECT * FROM employees
WHERE department_id = 80;

-- M1. List employees in department_id 80 with salary greater than 8000.
SELECT employee_id, first_name, last_name, salary
FROM hr.employees
WHERE department_id = 80
AND salary > 8000;

-- M2. Find employees whose last_name ends with 'n'.
SELECT employee_id, first_name, last_name
FROM hr.employees
WHERE last_name LIKE '%n';

-- M3. List employees hired after January 1, 2005.
SELECT employee_id, first_name, hire_date
FROM hr.employees
WHERE hire_date > DATE '2005-01-01';

-- M4. Get employees whose job_id is either 'SA_REP' or 'SA_MAN'.
SELECT employee_id, first_name, job_id
FROM hr.employees
WHERE job_id IN ('SA_REP', 'SA_MAN');

-- M5. List employees with salary between 4000 and 7000 (inclusive).
SELECT employee_id, salary
FROM hr.employees
WHERE salary BETWEEN 4000 AND 7000;

-- M6. Find employees who have a manager (manager_id is not null).
SELECT employee_id, first_name, manager_id
FROM hr.employees
WHERE manager_id IS NOT NULL;

-- M7. List departments with department_id 10, 20, or 30.
SELECT department_id, department_name
FROM hr.departments
WHERE department_id IN (10, 20, 30);

-- M8. Get the top 3 employees by hire_date (oldest first).
SELECT employee_id, first_name, hire_date
FROM hr.employees
ORDER BY hire_date ASC
FETCH FIRST 3 ROWS ONLY;

-- M9. List employees in department 50, ordered by last_name ascending.
SELECT employee_id, first_name, last_name
FROM hr.employees
WHERE department_id = 50
ORDER BY last_name ASC;

-- M10. Find employees whose first_name starts with 'J'.
SELECT employee_id, first_name
FROM hr.employees
WHERE first_name LIKE 'J%';

-- M11. List employees with salary not in the range 5000 to 10000.
SELECT employee_id, salary
FROM hr.employees
WHERE salary NOT BETWEEN 5000 AND 10000;

-- M12. Get employees whose job_id contains 'CLERK'.
SELECT employee_id, job_id
FROM hr.employees
WHERE job_id LIKE '%CLERK%';

-- M13. List employees with commission_pct greater than 0.2.
SELECT employee_id, commission_pct
FROM hr.employees
WHERE commission_pct > 0.2;

-- M14. Find the 10 most recently hired employees.
SELECT employee_id, first_name, hire_date
FROM hr.employees
ORDER BY hire_date DESC
FETCH FIRST 10 ROWS ONLY;

-- M15. List employees in departments 50 or 60, ordered by department_id then salary descending.
SELECT employee_id, department_id, salary
FROM hr.employees
WHERE department_id IN (50, 60)
ORDER BY department_id ASC, salary DESC;

-- M16. Get employees whose last_name has exactly 5 characters.
SELECT employee_id, last_name
FROM hr.employees
WHERE last_name LIKE '_____';

-- M17. List departments where manager_id is not null.
SELECT department_id, department_name, manager_id
FROM hr.departments
WHERE manager_id IS NOT NULL;

-- M18. Find employees with salary >= 10000, ordered by salary ascending.
SELECT employee_id, salary
FROM hr.employees
WHERE salary >= 10000
ORDER BY salary ASC;

-- M19. List employees whose email ends with '.com' or contains 'example'.
SELECT employee_id, email
FROM hr.employees
WHERE email LIKE '%.com'
OR email LIKE '%example%';

-- M20. Get distinct job_id values from employees in department 50.
SELECT DISTINCT job_id
FROM hr.employees
WHERE department_id = 50;