DROP TABLE IF EXISTS Store;

CREATE TABLE Store (
    row_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

INSERT INTO Store (row_id, customer_id, amount) VALUES
(1, 6, 303),
(2, 1, 31),
(3, 4, 351),
(4, 1, 102),
(5, 4, 679),
(6, 3, 337),
(7, 3, 937),
(8, 3, 737),
(9, 3, 637),
(10,4, 937);

SELECT * FROM Store;

-- 2082. The Number of Rich Customers
--1. find each customer
SELECT *
FROM Store
WHERE amount > 500;

--2. find total customer
SELECT customer_id, COUNT(*) AS total_customers
FROM Store
WHERE amount > 500
GROUP BY customer_id
