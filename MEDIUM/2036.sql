SELECT * FROM doordash_delivery;

-- Lowest Revenue Generated Restaurants
-- Write a query that returns a list of the bottom 2% revenue generating restaurants. Return a list of restaurant IDs and their total revenue from when customers placed orders in May 2020.
-- You can calculate the total revenue by summing the order_total column. And you should calculate the bottom 2% by partitioning the total revenue into evenly distributed buckets. 

-- for evenly distributed buckets use NTILE


-- filter only may month data
SELECT *
FROM doordash_delivery
WHERE customer_placed_order_datetime BETWEEN '2020-05-01' AND '2020-05-31';

-- groups restaurant
SELECT restaurant_id
FROM doordash_delivery
WHERE customer_placed_order_datetime BETWEEN '2020-05-01' AND '2020-05-31'
GROUP BY restaurant_id
ORDER BY restaurant_id;

-- find total orders per restaurant
SELECT restaurant_id,
       SUM(order_total) AS total_order
FROM doordash_delivery
WHERE customer_placed_order_datetime BETWEEN '2020-05-01' AND '2020-05-31'
GROUP BY restaurant_id
ORDER BY 2;

-- distribute evenly - use NTILE
SELECT restaurant_id,
       SUM(order_total) AS total_order,
       NTILE(50) OVER(ORDER BY SUM(order_total)) 
FROM doordash_delivery
WHERE customer_placed_order_datetime BETWEEN '2020-05-01' AND '2020-05-31'
GROUP BY restaurant_id
ORDER BY 2;

-- bottom 2% means ntile is 1 at start
WITH cte AS (
    SELECT restaurant_id,
       SUM(order_total) AS total_order,
       NTILE(50) OVER(ORDER BY SUM(order_total)) 
    FROM doordash_delivery
    WHERE customer_placed_order_datetime BETWEEN '2020-05-01' AND '2020-05-31'
    GROUP BY restaurant_id)

SELECT restaurant_id, total_order
FROM cte
WHERE ntile = 1
ORDER BY 2 DESC