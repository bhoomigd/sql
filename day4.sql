CREATE TABLE hr_employees(
    employee_id    NUMBER PRIMARY KEY,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    email          VARCHAR2(50),
    hire_date      DATE,
    job_id         VARCHAR2(20),
    salary         NUMBER(10,2),
    commission_pct NUMBER(5,2),
    manager_id     NUMBER,
    department_id  NUMBER
);
INSERT INTO hr_employees VALUES (100,'Steven','King','SKING',DATE '2003-06-17','AD_PRES',24000,NULL,NULL,10);
INSERT INTO hr_employees VALUES (101,'Neena','Kochhar','NKOCHHAR',DATE '2005-09-21','AD_VP',17000,NULL,100,20);
INSERT INTO hr_employees VALUES (102,'Lex','De Haan','LDEHAAN',DATE '2001-01-13','AD_VP',17000,NULL,100,30);
INSERT INTO hr_employees VALUES (103,'Alexander','Hunold','AHUNOLD',DATE '2006-01-03','IT_PROG',9000,NULL,102,60);
INSERT INTO hr_employees VALUES (104,'Bruce','Ernst','BERNST',DATE '2007-05-21','IT_PROG',6000,NULL,103,60);
INSERT INTO hr_employees VALUES (105,'David','Austin','DAUSTIN',DATE '2005-06-25','IT_PROG',4800,NULL,103,60);
INSERT INTO hr_employees VALUES (145,'John','Russell','JRUSSELL',DATE '2004-10-01','SA_MAN',14000,0.40,100,80);
INSERT INTO hr_employees VALUES (146,'Karen','Partners','KPARTNER',DATE '2005-01-05','SA_REP',10000,0.30,145,80);
INSERT INTO hr_employees VALUES (147,'Alberto','Errazuriz','AERRAZUR',DATE '2005-03-10','SA_REP',12000,0.30,145,80);
COMMIT;
CREATE TABLE hr_emp_backup AS SELECT * FROM hr_employees WHERE 1=0;

M1.
INSERT INTO hr_emp_backup (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id)
VALUES (999,'John','Doe','JDOE',SYSDATE,'SA_REP',5000,50);

M2.
UPDATE hr_emp_backup
SET salary = salary * 1.10
WHERE department_id = 60;

M3.
DELETE FROM hr_emp_backup
WHERE department_id IS NULL;

M4.
INSERT INTO hr_emp_backup (employee_id, first_name, last_name, salary, department_id)
VALUES (990,'Test','User',4000,50);

M5.
UPDATE hr_emp_backup SET salary = 6000 WHERE employee_id = 990;

M6.
DELETE FROM hr_emp_backup WHERE employee_id = 990;

M7.
INSERT INTO hr_emp_backup SELECT * FROM hr_employees WHERE department_id = 80;

M8.
UPDATE hr_emp_backup SET first_name = 'Updated' WHERE employee_id = 100;

M9.
DELETE FROM hr_emp_backup WHERE department_id = 90;

M10.
INSERT INTO hr_emp_backup VALUES (991,'A','One','AONE',SYSDATE,'IT_PROG',5000,NULL,NULL,60);
INSERT INTO hr_emp_backup VALUES (992,'B','Two','BTWO',SYSDATE,'IT_PROG',5500,NULL,NULL,60);

M11.
UPDATE hr_emp_backup SET salary = salary * 1.05 WHERE department_id = 50;

M12.
DELETE FROM hr_emp_backup WHERE salary IS NULL;

M13.
INSERT INTO hr_emp_backup SELECT * FROM hr_employees WHERE job_id = 'SA_REP';

M14.
UPDATE hr_emp_backup SET department_id = 60 WHERE employee_id = 105;

M15.
DELETE FROM hr_emp_backup WHERE employee_id = 999;

M16.
INSERT INTO hr_emp_backup (employee_id,last_name,first_name,salary,department_id)
VALUES (993,'Lee','Amy',5500,60);

M17.
UPDATE hr_emp_backup SET last_name='Smith' WHERE first_name='John';

M18.
DELETE FROM hr_emp_backup WHERE hire_date < DATE '2000-01-01';

M19.
INSERT INTO hr_emp_backup SELECT * FROM hr_employees WHERE salary BETWEEN 5000 AND 7000;

M20.
UPDATE hr_emp_backup SET job_id='IT_PROG' WHERE employee_id=200;

DELETE FROM hr_emp_backup WHERE commission_pct IS NOT NULL;

INSERT INTO hr_emp_backup VALUES (994,'New','Emp','NEMP',SYSDATE,'IT_PROG',6000,NULL,NULL,60);

UPDATE hr_emp_backup
SET salary = 10000
WHERE employee_id = (SELECT MAX(employee_id) FROM hr_emp_backup);