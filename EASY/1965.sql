DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Salaries;

Create table If Not Exists Employees (employee_id int, name varchar(30));
Create table If Not Exists Salaries (employee_id int, salary int);
Truncate table Employees;
insert into Employees (employee_id, name) values ('2', 'Crew');
insert into Employees (employee_id, name) values ('4', 'Haven');
insert into Employees (employee_id, name) values ('5', 'Kristian');
Truncate table Salaries;
insert into Salaries (employee_id, salary) values ('5', '76071');
insert into Salaries (employee_id, salary) values ('1', '22517');
insert into Salaries (employee_id, salary) values ('4', '63539');

SELECT * FROM Employees;
SELECT * FROM Salaries;

--1965. Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:
-- The employee's name is missing, or
-- The employee's salary is missing.
-- Return the result table ordered by employee_id in ascending order

-- 1. Full Outer join Way
SELECT *
FROM Employees e
FULL OUTER JOIN Salaries s
    ON e.employee_id = s.employee_id;

-- 2. Filter out 
SELECT *
FROM Employees e
FULL OUTER JOIN Salaries s
    ON e.employee_id = s.employee_id
WHERE e.employee_id IS NULL 
OR s.salary IS NULL;

-- 3. show employee id only
SELECT CASE 
        WHEN e.employee_id IS NOT NULL THEN e.employee_id 
        ELSE s.employee_id END AS employee_id
FROM employees e
FULL OUTER JOIN Salaries s
    ON e.employee_id = s.employee_id
WHERE e.employee_id IS NULL
OR s.salary IS NULL
ORDER BY employee_id;

-- Simple Union Way 
SELECT e.employee_id
FROM Employees e
WHERE e.employee_id NOT IN (SELECT employee_id FROM Salaries)

UNION

SELECT s.employee_id
FROM Salaries s
WHERE s.employee_id NOT IN (SELECT employee_id FROM Employees)

ORDER BY employee_id;

-- Left Join Union Way
SELECT e.employee_id
FROM Employees e
LEFT JOIN Salaries s
ON e.employee_id = s.employee_id
WHERE s.salary IS NULL

UNION 

SELECT s.employee_id
FROM Salaries s
LEFT JOIN Employees e
ON e.employee_id = s.employee_id 
WHERE e.name is NULL    

ORDER BY employee_id