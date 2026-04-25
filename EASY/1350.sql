SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

CREATE TABLE IF NOT EXISTS Students (
    id INT,
    name VARCHAR(50),
    department_id INT
);

CREATE TABLE IF NOT EXISTS Departments (
    id INT,
    name VARCHAR(50)
);

TRUNCATE TABLE Students;
TRUNCATE TABLE Departments;

INSERT INTO Students (id, name, department_id) VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3),
(4, 'David', 99),   -- invalid department
(5, 'Eve', NULL);   -- invalid / missing

INSERT INTO Departments (id, name) VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Marketing');

SELECT *
FROM Students;
SELECT * 
FROM Departments;

--1350. only show students whose departments are null 

-- show all students info
SELECT s.id, s.name, d.id, d.name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.id;

-- show only students whose dept are null
SELECT s.id, s.name, d.id, d.name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.id
WHERE d.name IS NULL