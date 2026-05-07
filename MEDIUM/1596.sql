DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT
);

INSERT INTO Customers (customer_id, name) VALUES 
(1, 'Alice'), (2, 'Bob'), (3, 'Tom'), (4, 'Jerry'), (5, 'John');

INSERT INTO Products (product_id, product_name, price) VALUES 
(1, 'keyboard', 120), (2, 'mouse', 80), (3, 'screen', 600), (4, 'hard disk', 450), (5, 'laptop', 1000);

INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES 
(1, '2020-07-31', 1, 1), (2, '2020-07-30', 2, 2), (3, '2020-08-29', 3, 3), 
(4, '2020-08-29', 4, 1), (5, '2020-09-13', 5, 2), (6, '2020-08-07', 1, 2), 
(7, '2020-08-01', 3, 1), (8, '2020-12-18', 1, 4), (9, '2020-12-08', 2, 3), 
(10, '2020-09-23', 5, 1), (11, '2020-11-10', 1, 2), (12, '2020-12-07', 2, 3), 
(13, '2020-04-19', 1, 2), (14, '2020-08-16', 3, 3), (15, '2020-09-19', 5, 2), 
(16, '2020-10-21', 4, 4), (17, '2020-11-30', 4, 3), (18, '2020-10-24', 4, 1), 
(19, '2020-12-20', 5, 2), (20, '2020-08-07', 2, 3), (21, '2020-12-15', 3, 4), 
(22, '2020-12-01', 1, 1), (23, '2020-12-07', 2, 3), (24, '2020-04-19', 1, 2);

-- 1596. The Most Frequently Ordered Products for Each Customer

WITH cte AS (
    SELECT customer_id, product_id, 
       COUNT(*) AS num_ordered
    FROM Orders
    GROUP BY customer_id, product_id),

    cte2 AS (
    SELECT *,
    FIRST_VALUE(num_ordered) OVER(PARTITION BY customer_id ORDER BY num_ordered DESC) 
    AS most_frequent
    FROM cte
    )

    SELECT c.customer_id, c.product_id, p.product_name
    FROM cte2 c
    LEFT JOIN Products p
    ON c.product_id = p.product_id
    WHERE c.num_ordered = c.most_frequent