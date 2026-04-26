DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    customer_id INT,
    year INT,
    revenue INT
);

INSERT INTO Customers (customer_id, year, revenue) VALUES 
(1, 2018, 50),
(1, 2021, 30),
(1, 2020, 70),
(2, 2021, -50),
(3, 2018, 10),
(3, 2016, 50),
(4, 2021, 20);

SELECT *
FROM Customers;

-- 1821. Find Customers With Positive Revenue this Year

-- 1. filter out 2021 customers

SELECT customer_id
FROM Customers
WHERE year = 2021;

-- 2. revenue in positive

SELECT customer_id, revenue
FROM Customers
WHERE year = 2021
AND revenue > 0