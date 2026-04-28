DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

SELECT * FROM Products;
SELECT * FROM Sales;

-- 1069. Product Sales Analysis
--1. join tabl
SELECT *
FROM Products p
INNER JOIN Sales s
ON p.product_id = s.product_id;

--2. find out total quantity
SELECT s.product_id, SUM(s.quantity) AS total_quantity
FROM Products p
INNER JOIN Sales s
ON p.product_id = s.product_id
WHERE s.price > 0
GROUP BY s.product_id;