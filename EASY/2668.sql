DROP TABLE IF EXISTS Salary;

CREATE TABLE Salary (
    emp_id        INT,
    firstname     VARCHAR(50),
    lastname      VARCHAR(50),
    salary        INT,
    department_id VARCHAR(10),
    PRIMARY KEY (emp_id, salary)
);

INSERT INTO Salary VALUES
(1, 'Aurora',  'Wilson',  110000, 'D1006'),
(1, 'Aurora',  'Wilson',  106119, 'D1006'),
(2, 'Iris',    'Simon',   128922, 'D1005'),
(2, 'Iris',    'Simon',   130000, 'D1005'),
(3, 'Claire',  'Rosario',  42689, 'D1002'),
(4, 'Hazel',   'Powell',  162825, 'D1004'),
(4, 'Hazel',   'Powell',  170000, 'D1004'),
(5, 'Elise',   'Golden',   44101, 'D1002'),
(6, 'Ashley',  'Swanson',  79632, 'D1005'),
(6, 'Ashley',  'Swanson',  90000, 'D1005');

SELECT * FROM Salary;

-- 2668. Find Max Salaries

SELECT emp_id, firstName, lastName, department_id, MAX(salary) AS salary
FROM salary
GROUP BY emp_id, firstName, lastName, department_id
ORDER BY emp_id;

-- latest cte

WITH latest AS (
SELECT emp_id, MAX(salary) salary
FROM salary
GROUP BY emp_id) 

SELECT s.emp_id, s.firstName, s.lastName, s.department_id, l.salary
FROM Salary s
JOIN latest l USING(emp_id, salary)
ORDER BY emp_id, salary