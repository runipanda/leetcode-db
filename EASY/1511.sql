DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(30),
    country VARCHAR(30)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    description VARCHAR(30),
    price INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

INSERT INTO Customers VALUES (1, 'Winston', 'USA'), (2, 'Jonathan', 'Peru');
INSERT INTO Product VALUES (10, 'LC Book', 10), (20, 'LC T-Shirt', 15), (30, 'LC Keychain', 450);
INSERT INTO Orders VALUES 
(1, 1, 10, '2020-06-10', 1), (2, 1, 20, '2020-07-01', 1), 
(3, 1, 30, '2020-07-08', 1), (4, 2, 10, '2020-06-08', 10), 
(5, 2, 20, '2020-07-21', 5);

SELECT * FROM Orders;
SELECT * FROM Product;
SELECT * FROM Customers;

--1511. Customer Order Frequency
-- 1.  Join Three Tables

SELECT *
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Product p
ON o.product_id = p.product_id;

-- 2.group duplicate rows 

SELECT c.customer_id, c.name
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Product p
ON o.product_id = p.product_id
GROUP BY c.customer_id, c.name;

-- 3. filter out more than 100 spending in the month june and july

SELECT c.customer_id, c.name
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Product p
ON o.product_id = p.product_id
GROUP BY c.customer_id, c.name
HAVING 
        SUM(CASE WHEN TO_CHAR(o.order_date, 'YYYY-MM') = '2020-06'
            THEN p.price * o.quantity ELSE 0 END) >= 1
AND 
        SUM(CASE WHEN TO_CHAR(o.order_date, 'YYYY-MM') = '2020-07'
            THEN p.price * o.quantity ELSE 0 END) >= 1
ORDER BY c.customer_id;










































































































