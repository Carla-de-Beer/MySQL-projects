use employees;

-- arithmetic operators
SELECT 
    emp_no, COUNT(*) AS emp_count
FROM
    employees
WHERE
    emp_no > 1
GROUP BY emp_no
HAVING emp_count > 0
ORDER BY emp_no
LIMIT 5 , 10;


SELECT 
    salary * 0.1 AS 'weekly',
    salary * 0.1 * 4 AS 'monthly',
    salary * 0.1 * 52 AS 'annual'
FROM
    salaries;


SELECT 
    *
FROM
    salaries;
    
SELECT DATE_FORMAT('2018-05-18', '%M %d %Y');

SELECT 
    from_date AS original, DATE_FORMAT(from_date, '%d %M %Y')
FROM
    salaries;


SELECT 
    first_name,
    last_name,
    CONCAT(LEFT(first_name, 1), LEFT(last_name, 1)) AS initials
FROM
    employees;


SELECT 
    COUNT(*)
FROM
    employees
WHERE
    first_name = 'Elvis';


SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Elvis' , 'Berni', 'Sumant', 'Lillian');


SELECT 
    COUNT(*)
FROM
    employees
WHERE
    first_name NOT IN ('Elvis' , 'Berni', 'Sumant', 'Lillian');


SELECT 
    *
FROM
    employees.titles;


SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE 'E%'
        AND last_name LIKE 'P_a%';


SELECT 
    *
FROM
    salaries
ORDER BY salary DESC;


SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis'
ORDER BY gender, birth_date DESC;


SELECT 
    *
FROM
    employees
LIMIT 20;


SELECT DISTINCT
    first_name
FROM
    employees;


SELECT count(DISTINCT
    first_name)
FROM
    employees;


SELECT 
    *
FROM
    employees
WHERE
    first_name IN (SELECT DISTINCT
            first_name
        FROM
            employees
        WHERE
            first_name LIKE 'E%');


SELECT 
    first_name, COUNT(*) AS emp_count
FROM
    employees
GROUP BY first_name
HAVING emp_count > 250;


SELECT salary, count(*) AS sal_count FROM salaries 
WHERE from_date > '1994-01-01'
GROUP BY salary HAVING sal_count > 100 ORDER BY sal_count ASC;

SELECT date_format(from_date, '%Y') AS year, sum(salary) FROM salaries GROUP BY year ORDER BY year;


SELECT 
    salary_year, max_salary, min_salary, max_salary - min_salary as delta
FROM
    (SELECT 
        DATE_FORMAT(from_date, '%Y') AS salary_year,
            MIN(salary) AS min_salary,
            MAX(salary) AS max_salary
    FROM
        salaries
    GROUP BY salary_year
    ORDER BY salary_year) AS sub_select;


SELECT 
    avg_salary, sum_salary / total_records AS calc_avg
FROM
    (SELECT 
        DATE_FORMAT(from_date, '%Y') AS salary_year,
            AVG(salary) AS avg_salary,
            SUM(salary) AS sum_salary,
            COUNT(*) AS total_records
    FROM
        salaries
    GROUP BY salary_year
    ORDER BY salary_year) AS sub_select;


SELECT 
    salary_year, avg_salary, sum_salary as total, max_salary, min_salary
FROM
    (SELECT 
        DATE_FORMAT(from_date, '%Y') AS salary_year,
            AVG(salary) AS avg_salary,
            SUM(salary) AS sum_salary,
            MIN(salary) as min_salary,
            MAX(salary) as max_salary,
            COUNT(*) AS total_records
    FROM
        salaries WHERE
    emp_no NOT IN (SELECT 
            emp_no
        FROM
            dept_manager)
    GROUP BY salary_year
    ORDER BY salary_year) AS sub_select;