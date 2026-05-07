DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    employee_id   INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id    INT
);

INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES
(1,  'Ashley',  1),
(2,  'Iris',    1),
(3,  'Hazel',   10),
(4,  'Claire',  2),
(7,  'Aurora',  4),
(77, 'Elise',   1),
(8,  'Thomas',  78),
(9,  'William', 78),
(10, 'Henry',   150),
(150,'James',   11);

SELECT * FROM Employees;

-- 1270. All People Report to the Given Manager

SELECT DISTINCT e1.employee_id
FROM Employees e1
JOIN Employees e2 ON e1.manager_id = e2.employee_id
JOIN Employees e3 ON e3.manager_id = e2.employee_id
WHERE e3.manager_id = 1
AND e1.employee_id <> 1;

-- 

SELECT DISTINCT e1.employee_id
FROM Employees e1
JOIN Employees e2 ON e1.manager_id = e2.employee_id
JOIN Employees e3 ON e2.manager_id = e3.employee_id
WHERE e3.manager_id = 1
AND e1.employee_id <> e1.manager_id