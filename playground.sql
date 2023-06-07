-- SELECT * FROM employees WHERE to_char(CURRENT_DATE, 'yyyy')::int - to_char(birth_date, 'yyyy')::INT > 60
-- SELECT COUNT(hire_date) FROM employees WHERE EXTRACT(month FROM hire_date) = 2
-- SELECT COUNT(birth_date) FROM employees WHERE EXTRACT(month FROM birth_date) = 11
-- SELECT * FROM employees WHERE birth_date = (SELECT MAX(birth_date) FROM employees)
-- SELECT COUNT(*) FROM orders WHERE EXTRACT(YEAR FROM orderdate) = 2004 and EXTRACT(MONTH FROM orderdate) = 1
-- SELECT AGE(birth_date), * FROM employees WHERE EXTRACT (YEAR FROM AGE(birth_date)) > 60
-- SELECT * FROM orders WHERE DATE_TRUNC('MONTH', orderdate) = date '2004-01-01'
-- SELECT DISTINCT title FROM titles
-- SELECT COUNT(DISTINCT birth_date) FROM employees
-- SELECT DISTINCT lifeexpectancy FROM country WHERE lifeexpectancy IS NOT null
-- SELECT * FROM orders as OD
-- INNER JOIN customers AS CS ON OD.customerid = CS.customerid
-- WHERE CS.state IN ('OH', 'NY', 'OR')
-- ORDER BY OD.orderid
-- SELECT * FROM products AS PRD
-- INNER JOIN inventory as INV
-- ON PRD.prod_id = INV.prod_id
SELECT EMP.emp_no, DPT.dept_name FROM employees AS EMP
INNER JOIN dept_emp AS DPE ON DPE.emp_no = EMP.emp_no
INNER JOIN departments AS DPT ON DPE.dept_no = DPT.dept_no;

SELECT hire_date, count(hire_date) FROM employees
GROUP BY hire_date;

SELECT hire_date, count( hire_date ) FROM employees
WHERE EXTRACT(YEAR FROM hire_date) >= 1991
GROUP BY hire_date;

-- Creating Views in Databases

SELECT DISTINCT e.emp_no, e.first_name, e.last_name, MAX(s.salary) OVER (PARTITION BY emp_no ORDER BY e.emp_no) AS "Salary" FROM employees AS e
JOIN salaries AS s USING(emp_no)
WHERE Salary > 80000

CREATE VIEW "bigbucks" AS
SELECT e.emp_no, s.salary
FROM employees as e
JOIN salaries as s USING(emp_no)
WHERE s.salary > 80000
ORDER BY s.salary;

SELECT * FROM "bigbucks"
