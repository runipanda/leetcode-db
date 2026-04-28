DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    employee_id INT,
    department_id INT,
    primary_flag VARCHAR(1) CHECK (primary_flag IN ('Y', 'N')),
    PRIMARY KEY (employee_id, department_id)
);

INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES
(1, 1, 'N'),
(2, 1, 'N'),
(2, 2, 'Y'),
(3, 3, 'N'),
(4, 2, 'N'),
(4, 3, 'N'),
(4, 4, 'Y');

SELECT * FROM Employee;

-- 1789. Primary Department for Each Employee
-- group by

SELECT employee_id, COUNT(department_id) AS dept_count
FROM Employee
GROUP BY employee_id
ORDER BY employee_id;


-- final query
SELECT employee_id, 
    CASE WHEN COUNT(department_id) = 1 THEN SUM(department_id)
         WHEN COUNT(department_id) > 1 THEN SUM((primary_flag = 'Y')::INTEGER * department_id::INTEGER)
         END AS department_id
FROM Employee
GROUP BY employee_id
ORDER BY employee_id;


-- another union way

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM (
SELECT *, COUNT(*) OVER(PARTITION BY employee_id) AS dept_count
FROM Employee ) cte
WHERE dept_count = 1
ORDER BY employee_id
