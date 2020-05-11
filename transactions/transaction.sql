-- transaction

use employees;
    
set autocommit=0;

begin;

insert into employees select max(emp_no) + 1, '1979-11-08', 'Sandra', 'Jones', 'F', '2018-02-01' from employees;

insert into titles select max(emp_no), 'Manager', '2018-02-01', '9999-01-01' from employees;

insert into dept_emp select max(emp_no), 'd002', '2018-02-01', '9999-01-01' from employees;

insert into salaries select max(emp_no), 185500, '2018-02-01', '9999-01-01' from employees;

commit;

rollback;

select * from employees where first_name = 'Sandra' and last_name = 'Jones';
select * from titles where emp_no = 500002;
select * from dept_emp where emp_no = 500002;
select * from salaries where emp_no = 500002;