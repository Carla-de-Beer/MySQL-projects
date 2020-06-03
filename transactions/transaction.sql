-- transaction

use employees;
    
SET autocommit=0;

BEGIN;

INSERT INTO employees SELECT max(emp_no) + 1, '1979-11-08', 'Sandra', 'Jones', 'F', '2018-02-01' FROM employees;

INSERT INTO titles SELECT max(emp_no), 'Manager', '2018-02-01', '9999-01-01' FROM employees;

INSERT INTO dept_emp SELECT max(emp_no), 'd002', '2018-02-01', '9999-01-01' FROM employees;

INSERT INTO salaries SELECT max(emp_no), 185500, '2018-02-01', '9999-01-01' FROM employees;

COMMIT;

ROLLBACK;

SELECT * FROM employees WHERE first_name = 'Sandra' AND last_name = 'Jones';
SELECT * FROM titles WHERE emp_no = 500002;
SELECT * FROM dept_emp WHERE emp_no = 500002;
SELECT * FROM salaries WHERE emp_no = 500002;