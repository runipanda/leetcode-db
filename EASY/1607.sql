DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Seller;

CREATE TABLE Customer (
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Seller (
    seller_id   INT PRIMARY KEY,
    seller_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id    INT PRIMARY KEY,
    sale_date   DATE,
    order_cost  INT,
    customer_id INT,
    seller_id   INT
);

INSERT INTO Customer VALUES
(101, 'Alice'),
(102, 'Bob'),
(103, 'Charlie');

INSERT INTO Seller VALUES
(1, 'Daniel'),
(2, 'Elizabeth'),
(3, 'Frank');

INSERT INTO Orders VALUES
(1, '2020-03-01', 1500, 101, 1),
(2, '2020-05-25', 2400, 102, 2),
(3, '2019-05-25',  800, 101, 3),
(4, '2020-09-13', 1000, 103, 2),
(5, '2019-02-11',  700, 101, 2);

SELECT * FROM Customer;
SELECT * FROM Seller;
SELECT * FROM Orders;

-- 1607. Sellers With No Sales

SELECT *
FROM Orders o
LEFT JOIN Seller s
ON o.seller_id = s.seller_id;

-- 1. first find all in 2020
    SELECT *
    FROM Orders
    WHERE EXTRACT(YEAR FROM sale_date) = 2020;

-- 2. filter out 2020
WITH cte AS(
    SELECT *
    FROM Orders
    WHERE EXTRACT(YEAR FROM sale_date) = 2020)

    SELECT seller_id
    FROM Orders 
    WHERE seller_id NOT IN (SELECT seller_id FROM cte);

-- 3. use join to find out name

WITH cte AS(
    SELECT seller_id
    FROM Orders
    WHERE EXTRACT(YEAR FROM sale_date) = 2020)

    SELECT o.seller_id, s.seller_name
    FROM Orders o
    JOIN Seller s
    ON o.seller_id = s.seller_id
    WHERE o.seller_id NOT IN (SELECT seller_id FROM cte)