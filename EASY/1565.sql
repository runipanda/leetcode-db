DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    order_id INT,
    order_date DATE,
    customer_id INT,
    invoice INT
);

INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES 
(1, '2020-09-15', 1, 30),
(2, '2020-09-17', 2, 90),
(3, '2020-10-09', 3, 20),
(4, '2020-10-20', 3, 21),
(5, '2020-10-13', 1, 50),
(6, '2020-12-01', 2, 40),
(7, '2020-12-07', 2, 310),
(8, '2020-12-12', 3, 120),
(9, '2020-12-07', 2, 30),
(10, '2020-12-16', 1, 10),
(11, '2021-01-01', 1, 30);

SELECT *
FROM Orders;

-- 1565. Unique Orders and Customers Per Month 
-- 1. Filter out orders greater than 20 
WITH 
    cte AS(
    SELECT *
    FROM Orders
    WHERE invoice > 20),

-- 2. Count orders and customers
    cte2 AS(
    SELECT order_date, 
    COUNT(order_id) AS order_count,
    COUNT(customer_id) AS customer_count
    FROM cte
    GROUP BY order_date)

-- 3. format date - to get month 
SELECT SUBSTRING(order_date::text FROM 1 FOR 7) AS month, order_count, customer_count
FROM cte2
ORDER BY month;