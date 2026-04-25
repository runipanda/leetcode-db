CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT,
    team_id INT
);

TRUNCATE TABLE Employee;

INSERT INTO Employee (employee_id, team_id) VALUES
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 7),
(6, 6);

SELECT *
FROM Employee;

-- 1303 - Find team size

--1. Window Function - Partition - Group By - remove duplicates
SELECT employee_id, team_id, COUNT(*) OVER(PARTITION BY team_id) AS team_size
FROM Employee;

-- 2. Sort it
SELECT employee_id, team_id, COUNT(*) OVER(PARTITION BY team_id ORDER BY team_id DESC) AS team_size
FROM Employee