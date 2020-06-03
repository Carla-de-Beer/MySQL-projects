-- user-defined variables with transactions

use employees;
    
SET autocommit=0;

BEGIN;

SELECT (@employee_no:= (max(emp_no)+1)) FROM employees;

INSERT INTO employees VALUES (@employee_no, '1985-10-15', 'Sam', 'Axe', 'M', '2015-09-01');

INSERT INTO titles VALUES (@employee_no, 'Manager', '2018-02-01', '9999-01-01');

INSERT INTO dept_emp VALUES (@employee_no, 'd002', '2018-02-01', '9999-01-01');

INSERT INTO salaries VALUES (@employee_no, 185500, '2018-02-01', '9999-01-01');

COMMIT;

ROLLBACK;

SELECT * FROM employees WHERE first_name = 'Sam' AND last_name = 'Axe';
SELECT * FROM titles WHERE emp_no = @employee_no;
SELECT * FROM dept_emp WHERE emp_no = @employee_no;
SELECT * FROM salaries WHERE emp_no = @employee_no;