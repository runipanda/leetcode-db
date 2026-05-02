
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    order_id          INT PRIMARY KEY,
    item_count        INT,
    order_occurrences INT
);

INSERT INTO Orders VALUES
(10, 1, 500),
(11, 2, 1000),
(12, 3, 800),
(13, 4, 1000);

SELECT * FROM Orders;

-- 2985. Calculate Compressed Mean


SELECT ROUND(SUM(item_count * order_occurrences)::NUMERIC / SUM(order_occurrences), 2) AS avg_item
FROM Orders
