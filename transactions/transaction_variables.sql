-- user-defined variables with transactions

use employees;
    
set autocommit=0;

begin;

select (@employee_no:= (max(emp_no)+1)) from employees;

insert into employees values (@employee_no, '1985-10-15', 'Sam', 'Axe', 'M', '2015-09-01');

insert into titles values (@employee_no, 'Manager', '2018-02-01', '9999-01-01');

insert into dept_emp values (@employee_no, 'd002', '2018-02-01', '9999-01-01');

insert into salaries values (@employee_no, 185500, '2018-02-01', '9999-01-01');

commit;

rollback;

select * from employees where first_name = 'Sam' and last_name = 'Axe';
select * from titles where emp_no = @employee_no;
select * from dept_emp where emp_no = @employee_no;
select * from salaries where emp_no = @employee_no;