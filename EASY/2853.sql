DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
    emp_name   VARCHAR(50),
    department VARCHAR(50),
    salary     INT,
    PRIMARY KEY (emp_name, department)
);

INSERT INTO Salaries VALUES
('Claire',  'Engineering', 50000),
('Hazel',   'Marketing',   30000),
('Aurora',  'Engineering', 45000),
('Iris',    'Engineering', 85000),
('Elise',   'Marketing',   34000),
('Ashley',  'Marketing',   42000),
('Edward',  'Engineering', 102000),
('Terry',   'Engineering', 44000),
('Evelyn',  'Marketing',   53000),
('Arthur',  'Engineering', 32000);

SELECT * FROM Salaries;

-- 2853. Max Salary Difference

-- subquery
SELECT ABS((SELECT MAX(salary)
FROM Salaries
WHERE department = 'Engineering')
-
(SELECT MAX(salary)
FROM Salaries
WHERE department = 'Marketing')) AS dept_salary_diff;

-- with cte table

WITH cte AS(
SELECT department, MAX(salary) AS salary
FROM Salaries
GROUP BY department)

SELECT MAX(salary) - MIN(salary) AS dept_salary_diff
FROM cte