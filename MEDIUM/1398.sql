DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Customers;

CREATE TABLE
  Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
  );

CREATE TABLE
  Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(255)
  );

INSERT INTO
  Customers (customer_id, customer_name)
VALUES
  (1, 'Daniel'),
  (2, 'Alice'),
  (3, 'Elizabeth'),
  (4, 'Jhon');

INSERT INTO
  Orders (order_id, customer_id, product_name)
VALUES
  (10, 1, 'A'),
  (20, 1, 'B'),
  (30, 1, 'D'),
  (40, 1, 'C'),
  (50, 2, 'A'),
  (60, 3, 'A'),
  (70, 3, 'B'),
  (80, 3, 'D'),
  (90, 4, 'C');

-- 1398. Customers Who Bought Products A and B but Not C 
SELECT
  customer_id
FROM
  Orders
GROUP BY
  cutsomer_id
HAVING
  SUM(product_name = 'A') > 0
  AND SUM(product_name = 'B') > 0
  AND SUM(product_name = 'C') = 0
SELECT
  *
FROM
  Customers
WHERE
  customer_id IN (
    SELECT
      customer_id
    FROM
      cte
  )
ORDER BY
  customer_id