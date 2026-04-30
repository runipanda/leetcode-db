DROP TABLE IF EXISTS Employees;

Create table If Not Exists Employees(employee_id int, name varchar(20), reports_to int, age int);
Truncate table Employees;
insert into Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', NULL, '43');
insert into Employees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41');
insert into Employees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36');
insert into Employees (employee_id, name, reports_to, age) values ('2', 'Winston', NULL, '37');

SELECT * FROM Employees;

-- 1731. No of Employees which report to each employee
-- group not null duplicate rows
-- get the count, age, employee

WITH cte AS (
SELECT reports_to, 
        COUNT(employee_id) AS reports_count,
        ROUND(AVG(age):: NUMERIC) AS average_age
FROM Employees
WHERE reports_to IS NOT NULL
GROUP BY reports_to)

-- get the name
SELECT e.employee_id, e.name, c.reports_count, c.average_age
FROM cte c
LEFT JOIN Employees e
ON c.reports_to = e.employee_id
ORDER BY e.employee_id