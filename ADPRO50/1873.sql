Drop Table If Exists Employees;
Create table If Not Exists Employees (employee_id int, name varchar(30), salary int);
Truncate table Employees;
insert into Employees (employee_id, name, salary) values ('2', 'Meir', '3000');
insert into Employees (employee_id, name, salary) values ('3', 'Michael', '3800');
insert into Employees (employee_id, name, salary) values ('7', 'Addilyn', '7400');
insert into Employees (employee_id, name, salary) values ('8', 'Juan', '6100');
insert into Employees (employee_id, name, salary) values ('9', 'Kannon', '7700');

Select * From Employees;

-- 1873. Calculate the special bonus

SELECT employee_id,
        CASE WHEN employee_id % 2 = 1 AND LOWER(name) NOT LIKE 'm%' THEN salary
        ELSE 0 END AS bonus
FROM Employees
ORDER BY employee_id