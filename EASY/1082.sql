DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Product;

CREATE TABLE Product (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(50),
    unit_price   INT
);

CREATE TABLE Sales (
    seller_id   INT,
    product_id  INT,
    buyer_id    INT,
    sale_date   DATE,
    quantity    INT,
    price       INT
);

INSERT INTO Product VALUES
(1, 'S8',     1000),
(2, 'G4',     800),
(3, 'iPhone', 1400);

INSERT INTO Sales VALUES
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 1, 3, '2019-06-02', 2, 2000),
(3, 3, 4, '2019-05-13', 2, 2800),
(4, 2, 5, '2019-03-01', 1, 800);

SELECT * FROM Sales;
SELECT * FROM Product;

--1082. Sales Analysis
--1. Find Max Price
SELECT SUM(price) AS max_price
FROM Sales 
GROUP BY seller_id
ORDER BY max_price DESC
LIMIT 1;

-- 2. Find Total Price
SELECT seller_id, SUM(price) AS total_price
FROM Sales
GROUP BY seller_id
ORDER BY total_price DESC;

-- 3. Keep rows who is equal to max
SELECT seller_id, SUM(price) AS total_price
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = (SELECT SUM(price) AS max_price
                     FROM Sales 
                     GROUP BY seller_id
                     ORDER BY max_price DESC
                     LIMIT 1) 
ORDER BY seller_id
