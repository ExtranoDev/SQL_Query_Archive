-- Using Windows Function and Framing

--SELECT emp_no, salary,
--    COUNT(salary) OVER
--    (PARTITION BY emp_no ORDER BY salary
--    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
--FROM salaries

-- SELECT DISTINCT e.emp_no,
--    e.first_name,
--    d.dept_name,
--    LAST_VALUE(s.salary) OVER (
--        PARTITION BY e.emp_no
--        ORDER BY s.from_date
--        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
--    ) AS "Current Salary"

-- FROM salaries AS s

-- JOIN employees as e USING(emp_no)
-- JOIN dept_emp AS de USING (emp_no)
-- JOIN departments as d USING (dept_no)

-- ORDER BY e.emp_no;

SELECT 
    o.orderid,
    o.customerid,
    o.netamount, 
    SUM(o.netamount) OVER (
        PARTITION BY o.customerid
        ORDER BY o.orderid
    ) AS "Cum Sum"
FROM orders AS o
ORDER BY o.customerid