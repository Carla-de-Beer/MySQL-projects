-- INNER JOIN
SELECT 
    empl.emp_no,
    empl.first_name,
    empl.last_name,
    dm.from_date,
    dm.to_date,
    depts.dept_no,
    depts.dept_name
FROM
    employees AS empl
        INNER JOIN
    dept_manager AS dm ON empl.emp_no = dm.emp_no
        INNER JOIN
    departments AS depts ON depts.dept_no = dm.dept_no
ORDER BY dept_name , last_name;


-- INNER JOIN
SELECT 
    depts.dept_name,
    empl.first_name,
    empl.last_name,
    titles.title
FROM
    employees AS empl
        INNER JOIN
    dept_emp ON empl.emp_no = dept_emp.emp_no
        INNER JOIN
    titles ON empl.emp_no = titles.emp_no
        INNER JOIN
    departments AS depts ON depts.dept_no = dept_emp.dept_no
WHERE
    titles.to_date = '9999-01-01'
        AND dept_emp.to_date = '9999-01-01'
ORDER BY dept_name, last_name;


-- NATURAL JOIN
SELECT 
    depts.dept_name,
    empl.first_name,
    empl.last_name,
    titles.title
FROM
    employees AS empl
        NATURAL JOIN
    dept_emp
        NATURAL JOIN
    titles
        NATURAL JOIN
    departments AS depts
WHERE
    titles.to_date = '9999-01-01'
        AND dept_emp.to_date = '9999-01-01'
ORDER BY dept_name , last_name;


-- EQUI-JOIN
SELECT 
    empl.emp_no,
    empl.first_name,
    empl.last_name,
    dm.from_date,
    dm.to_date,
    depts.dept_no,
    depts.dept_name
FROM
    employees AS empl,
    dept_manager AS dm,
    departments AS depts
WHERE
    empl.emp_no = dm.emp_no
        AND depts.dept_no = dm.dept_no
        AND dm.to_date = '9999-01-01'
        AND empl.gender = 'F'
ORDER BY dept_name , last_name;


-- UNION
SELECT 
    depts.dept_name,
    empl.first_name,
    empl.last_name,
    'Manager' AS emp_type
FROM
    employees AS empl
        INNER JOIN
    dept_manager AS dm ON empl.emp_no = dm.emp_no
        INNER JOIN
    departments AS depts ON depts.dept_no = dm.dept_no 
UNION SELECT 
    depts.dept_name,
    empl.first_name,
    empl.last_name,
    'Staff' AS emp_type
FROM
    employees AS empl
        INNER JOIN
    dept_emp ON empl.emp_no = dept_emp.emp_no
        INNER JOIN
    titles ON empl.emp_no = titles.emp_no
        INNER JOIN
    departments AS depts ON depts.dept_no = dept_emp.dept_no
WHERE
    titles.to_date = '9999-01-01'
        AND dept_emp.to_date = '9999-01-01'
ORDER BY emp_type , dept_name , last_name;


-- LEFT JOIN
SELECT 
    *
FROM
    employees AS empl
        LEFT JOIN
    dept_manager AS dm ON empl.emp_no = dm.emp_no;
    
SELECT 
     empl.emp_no, dm.emp_no, first_name, last_name
FROM
    employees AS empl
        LEFT JOIN
    dept_manager AS dm ON empl.emp_no = dm.emp_no;
    
SELECT 
    empl.emp_no, dm.emp_no, first_name, last_name
FROM
    employees AS empl
        LEFT JOIN
    dept_manager AS dm ON empl.emp_no = dm.emp_no
WHERE
    dm.emp_no IS NOT NULL;


-- LEFT OUTER JOIN
SELECT 
     *
FROM
    employees AS empl
WHERE
    empl.emp_no NOT IN (SELECT 
            emp_no
        FROM
            titles
        WHERE
            titles.to_date = '9999-01-01');


SELECT 
    *
FROM
    employees AS empl
        LEFT JOIN
    titles ON empl.emp_no = titles.emp_no
        AND titles.to_date = '9999-01-01'
WHERE
    titles.emp_no IS NULL;


-- INSERT
INSERT INTO departments VALUES ('d999', 'Awesome Coders');

INSERT INTO departments (dept_no, dept_name) VALUES ('d999', 'Awesome Coders');
    
INSERT INTO employees SELECT max(emp_no) + 1, '1976-01-01', 'Joe', 'Edwards', 'M', '2018-06-18' FROM employees;