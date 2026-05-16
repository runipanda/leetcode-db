SELECT * FROM orders;
SELECT * FROM customers;

--9899. Proportion Of Total Spend
-- Calculate the ratio of the total spend a customer spent on each order. Output
-- the customer’s first name, order details, and ratio of the order cost to their
-- total spend across all orders.  Assume each customer has a unique first name
-- (i.e., there is only 1 customer named Karen in the dataset) and that customers
-- place at most only 1 order a day.  Percentages should be represented as
-- decimals. 

-- formulate the approach
-- join the orders with customers using an inner join
-- sum the total amount spent by each customer 
-- find the % total spent(order cost / SUM(order cost)) by customer
-- round(*100)

-- join
SELECT *
FROM orders o
JOIN customers c 
ON o.cust_id = c.id;

-- order_details
SELECT first_name, order_details, SUM(total_order_cost) AS order_total
FROM orders o
JOIN customers c 
ON o.cust_id = c.id
GROUP BY c.first_name, order_details
ORDER BY c.first_name;

-- find total amount spent by each customer
WITH cte AS (
SELECT first_name, order_details, SUM(total_order_cost) AS order_total
FROM orders o
JOIN customers c 
ON o.cust_id = c.id
GROUP BY c.first_name, order_details
ORDER BY c.first_name),

cte2 AS (
SELECT first_name, SUM(total_order_cost) AS total_amount
FROM orders o
JOIN customers c 
ON o.cust_id = c.id
GROUP BY c.first_name
ORDER BY c.first_name)

SELECT c.first_name, c.order_details, order_total, total_amount,
       ROUND((c.order_total::NUMERIC / t.total_amount) * 100) AS percentage_of_total_spend
FROM cte c
JOIN cte2 t USING (first_name);

-- partition by
SELECT 
    c.first_name,
    o.order_details,
    ROUND((o.total_order_cost::numeric / SUM(o.total_order_cost) OVER (PARTITION BY o.cust_id)) * 100) AS proportion_of_total_spend
FROM orders o
JOIN customers c 
  ON o.cust_id = c.id
ORDER BY c.first_name;