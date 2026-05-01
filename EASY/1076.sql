DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    employee_id      INT PRIMARY KEY,
    name             VARCHAR(50),
    experience_years INT
);

CREATE TABLE Project (
    project_id  INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

INSERT INTO Employee VALUES
(1, 'Khaled', 3),
(2, 'Ali',    2),
(3, 'John',   1),
(4, 'Doe',    2);

INSERT INTO Project VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 4), (2, 3),
(3, 1), (3, 4);

SELECT * FROM Employee;
SELECT * FROM Project;

-- 1076. Report all projects that have the most employees — not just one, but all of them in case of a tie.

-- intuitive approach
-- in case of tie it fails

SELECT project_id, COUNT(DISTINCT employee_id) AS emp_count
FROM Project
GROUP BY project_id
ORDER BY emp_count DESC
LIMIT 1;

--  it will returns all max id

WITH cte AS (
SELECT project_id, COUNT(DISTINCT employee_id) AS emp_count
FROM Project
GROUP BY project_id)

SELECT project_id
FROM cte
WHERE emp_count = (SELECT MAX(emp_count) FROM cte)   -- 3 get the max