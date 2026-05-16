SELECT * FROM twitter_employee;

-- 9898. Distinct Salaries
-- Find the top three distinct salaries for each department. Output the
-- department name and the top 3 distinct salaries by each department. Order
-- your results alphabetically by department and then by highest salary to
-- lowest.

WITH cte AS (
SELECT department, salary
FROM twitter_employee
GROUP BY department, salary), 

cte2 AS (
SELECT department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank
FROM cte)

SELECT department, salary
FROM cte2
WHERE rank < 4
ORDER BY department

