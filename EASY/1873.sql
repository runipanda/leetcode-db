DROP TABLE IF EXISTS Employees;
Create table If Not Exists Employees (employee_id int, name varchar(30), salary int);
Truncate table Employees;
insert into Employees (employee_id, name, salary) values ('2', 'Meir', '3000');
insert into Employees (employee_id, name, salary) values ('3', 'Michael', '3800');
insert into Employees (employee_id, name, salary) values ('7', 'Addilyn', '7400');
insert into Employees (employee_id, name, salary) values ('8', 'Juan', '6100');
insert into Employees (employee_id, name, salary) values ('9', 'Kannon', '7700');

SELECT *
FROM Employees;

-- 1873.Write a solution to calculate the bonus of each employee. The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee's name does not start with the character 'M'. The bonus of an employee is 0 otherwise. 

-- 1. odd employee
SELECT *
FROM Employees 
WHERE employee_id % 2 <> 0;

-- 2. except m

SELECT *,
   CASE WHEN SUBSTRING(name, 1, 1) <> 'M' THEN salary 
   ELSE 0 END AS bonus
FROM Employees;

--3. final query - odd employee and except m

SELECT employee_id, name ,
    CASE WHEN name NOT LIKE 'M%' AND employee_id % 2 <> 0 THEN salary
    ELSE 0 END AS bonus
FROM Employees;