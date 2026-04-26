DROP TABLE IF EXISTS Employees;
Create table If Not Exists Employees(emp_id int, event_day date, in_time int, out_time int);
Truncate table Employees;
insert into Employees (emp_id, event_day, in_time, out_time) values ('1', '2020-11-28', '4', '32');
insert into Employees (emp_id, event_day, in_time, out_time) values ('1', '2020-11-28', '55', '200');
insert into Employees (emp_id, event_day, in_time, out_time) values ('1', '2020-12-3', '1', '42');
insert into Employees (emp_id, event_day, in_time, out_time) values ('2', '2020-11-28', '3', '33');
insert into Employees (emp_id, event_day, in_time, out_time) values ('2', '2020-12-9', '47', '74');

SELECT *
FROM Employees;

-- group by variations
SELECT emp_id
FROM Employees
GROUP BY emp_id;

SELECT emp_id, COUNT(*)
FROM Employees
GROUP BY emp_id;

SELECT event_day
FROM Employees
GROUP BY event_day;

SELECT emp_id, event_day
FROM Employees
GROUP BY event_day, emp_id;

SELECT event_day, emp_id, in_time
FROM Employees
GROUP BY event_day, emp_id, in_time;

SELECT event_day, emp_id, in_time, out_time
FROM Employees
GROUP BY event_day, emp_id, in_time, out_time;

--1741. Find total time spent by each employee 
-- 1. total time 

SELECT *, out_time - in_time AS total_time
FROM Employees;

-- 2. each day total time - final query
SELECT event_day AS day, emp_id, SUM(out_time - in_time) AS total_time
FROM Employees
GROUP BY event_day, emp_id
ORDER BY day;