drop table if exists employee;
create table if not exists employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

INSERT INTO employee VALUES(101, 'Ashley', 'Admin', 4000);
INSERT INTO employee VALUES(102, 'Claire', 'HR', 3000);
INSERT INTO employee VALUES(103, 'Iris', 'IT', 4000);
INSERT INTO employee VALUES(104, 'Hazel', 'Finance', 6500);
INSERT INTO employee VALUES(105, 'Aurora', 'HR', 3000);
INSERT INTO employee VALUES(106, 'Elise', 'Finance', 5000);
INSERT INTO employee VALUES(107, 'Rose', 'HR', 7000);
INSERT INTO employee VALUES(108, 'Vivienne', 'Admin', 4000);
INSERT INTO employee VALUES(109, 'Julian', 'IT', 6500);
INSERT INTO employee VALUES(110, 'Dorian', 'IT', 7000);
INSERT INTO employee VALUES(111, 'Celeste', 'IT', 8000);
INSERT INTO employee VALUES(112, 'Edmund', 'IT', 10000);
INSERT INTO employee VALUES(113, 'Alistair', 'Admin', 2000);
INSERT INTO employee VALUES(114, 'Sylvia', 'HR', 3000);
INSERT INTO employee VALUES(115, 'Leonora', 'IT', 4500);
INSERT INTO employee VALUES(116, 'Sebastian', 'Finance', 6500);
INSERT INTO employee VALUES(117, 'Alaric', 'HR', 3500);
INSERT INTO employee VALUES(118, 'Evangeline', 'Finance', 5500);
INSERT INTO employee VALUES(119, 'Crispin', 'HR', 8000);
INSERT INTO employee VALUES(120, 'Isadora', 'Admin', 5000);
INSERT INTO employee VALUES(121, 'Rosalind', 'IT', 6000);
INSERT INTO employee VALUES(122, 'Ambrose', 'IT', 8000);
INSERT INTO employee VALUES(123, 'Leander', 'IT', 8000);
INSERT INTO employee VALUES(124, 'Thaddeus', 'IT', 11000);

SELECT * FROM employee;

RETURN;
-- 1. max salary
-- group by

SELECT dept_name, max(salary) AS salary
FROM employee
GROUP BY dept_name;

-- window functions - over

SELECT *,
    max(salary) over() as max_salary
FROM employee;

-- partition by

SELECT *,
    max(salary) over(partition by dept_name) AS max_salary
FROM employee;

-- row number

SELECT *,
    row_number() over() AS row_nums
FROM employee;

-- partition by

SELECT *,
    row_number() over(partition by dept_name) AS row_nums
FROM employee;

-- 2. fetch the first two employees from each department who join the company

SELECT * FROM (
SELECT *,
    row_number() over(partition by dept_name ORDER BY emp_id) AS row_nums
FROM employee ) AS cte
WHERE row_nums < 3;

-- 3. Fetch top 3 employees from each department who earns maximum
-- rank - skip rows

SELECT *,
    rank() over() AS rank 
FROM employee;

SELECT *,
    rank() over(partition by dept_name ORDER BY salary DESC) AS rank
FROM employee;

SELECT * FROM (
SELECT *,
    rank() over(partition by dept_name ORDER BY salary DESC) AS rank
    FROM employee
) cte
WHERE rank < 4;

-- dense_rank - don't skip rows

SELECT * FROM (
SELECT *,
    rank() over(partition by dept_name ORDER BY salary DESC) AS rank,
    dense_rank() over(partition by dept_name ORDER BY salary DESC) AS dense_rank 
    FROM employee
) cte
WHERE rank < 5;


-- rank, dense_rank, row_number

SELECT * FROM (
SELECT *,
    rank() over(partition by dept_name ORDER BY salary DESC) AS rank,
    dense_rank() over(partition by dept_name ORDER BY salary DESC) AS dense_rank,
    row_number() over(partition by dept_name ORDER BY salary DESC) AS row_nums 
    FROM employee
) cte
WHERE rank < 5;

--  LEAD and LAG  - comparision with prev or next

SELECT *,
    lag(salary) over() AS prev,
    lead(salary) over() AS next
FROM employee;

SELECT *,
    lag(salary) over(partition by dept_name ORDER BY salary) AS prev
FROM employee;

-- prev 2 records

SELECT *,
    lag(salary, 2) over(partition by dept_name ORDER BY salary) AS prev
FROM employee;

-- set as default value

SELECT *,
    lag(salary, 2, 0) over(partition by dept_name ORDER BY salary) AS prev
FROM employee;

-- lead

SELECT *,
    lag(salary) over(partition by dept_name ORDER BY salary) AS prev,
    lead(salary) over(partition by dept_name ORDER BY salary) AS next
FROM employee;

--4. fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.

SELECT *,
    lag(salary) over(partition by dept_name ORDER BY salary) AS prev,
    CASE WHEN salary > lag(salary) over(partition by dept_name ORDER BY salary) THEN 'Higher than previous employee salary'
         WHEN salary < lag(salary) over(partition by dept_name ORDER BY salary) THEN 'Lower than previous employee salary'
         WHEN salary = lag(salary) over(partition by dept_name ORDER BY salary) THEN 'Same as previous employee salary' END AS salary_comparision
FROM employee;

