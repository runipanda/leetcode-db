DROP TABLE IF EXISTS worker;

CREATE TABLE worker (
    worker_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary INT,
    joining_date TIMESTAMP,
    department VARCHAR(50)
);

INSERT INTO worker (worker_id, first_name, last_name, salary, joining_date, department) VALUES
(1, 'Mateo', 'Garcia', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Amara', 'Okonkwo', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Siobhan', 'O''Sullivan', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Ji-Hoon', 'Kim', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Fatima', 'Al-Farsi', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Lukas', 'Schmidt', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Yuki', 'Tanaka', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Elena', 'Petrova', 90000, '2014-04-11 09:00:00', 'Admin'),
(9, 'Hiroshi', 'Nakamura', 95000, '2015-03-12 09:00:00', 'IT'),
(10, 'Anya', 'Ivanova', 110000, '2016-07-22 09:00:00', 'Legal');

SELECT * FROM Worker;

-- Find information on employees who do not have the first names 'Amara' or 'Yuki' or a last name that contains a 'a'.

SELECT * FROM Worker
WHERE first_name NOT IN ('Amara', 'Yuki')
AND lower(last_name) NOT LIKE '%a%';