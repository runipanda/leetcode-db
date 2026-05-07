DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    order_type  INT
);

INSERT INTO Orders (order_id, customer_id, order_type) VALUES
(1, 1, 0),
(2, 1, 1),
(11, 2, 0),
(12, 2, 1),
(21, 3, 1),
(22, 3, 0),
(31, 4, 1),
(32, 4, 1);

SELECT * FROM Orders;

-- 2084. Drop Type 1 Orders for Customers with Type 0 Orders
-- find min customers

-- min order type
SELECT *,
MIN(order_type) OVER(PARTITION BY customer_id) AS min_order_type
FROM Orders;

-- find min order basically that would be 0
WITH cte AS(
    SELECT *,
    MIN(order_type) OVER(PARTITION BY customer_id) AS min_order_type
    FROM Orders
)

--  find other than 1
SELECT order_id, customer_id, order_type, order_type + min_order_type AS total
FROM cte
WHERE (order_type + min_order_type <> 1)