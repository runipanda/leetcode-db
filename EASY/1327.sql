DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;

Create table If Not Exists Products (product_id int, product_name varchar(40), product_category varchar(40));
Create table If Not Exists Orders (product_id int, order_date date, unit int);
Truncate table Products;
insert into Products (product_id, product_name, product_category) values ('1', 'Leetcode Solutions', 'Book');
insert into Products (product_id, product_name, product_category) values ('2', 'Jewels of Stringology', 'Book');
insert into Products (product_id, product_name, product_category) values ('3', 'HP', 'Laptop');
insert into Products (product_id, product_name, product_category) values ('4', 'Lenovo', 'Laptop');
insert into Products (product_id, product_name, product_category) values ('5', 'Leetcode Kit', 'T-shirt');
Truncate table Orders;
insert into Orders (product_id, order_date, unit) values ('1', '2020-02-05', '60');
insert into Orders (product_id, order_date, unit) values ('1', '2020-02-10', '70');
insert into Orders (product_id, order_date, unit) values ('2', '2020-01-18', '30');
insert into Orders (product_id, order_date, unit) values ('2', '2020-02-11', '80');
insert into Orders (product_id, order_date, unit) values ('3', '2020-02-17', '2');
insert into Orders (product_id, order_date, unit) values ('3', '2020-02-24', '3');
insert into Orders (product_id, order_date, unit) values ('4', '2020-03-01', '20');
insert into Orders (product_id, order_date, unit) values ('4', '2020-03-04', '30');
insert into Orders (product_id, order_date, unit) values ('4', '2020-03-04', '60');
insert into Orders (product_id, order_date, unit) values ('5', '2020-02-25', '50');
insert into Orders (product_id, order_date, unit) values ('5', '2020-02-27', '50');
insert into Orders (product_id, order_date, unit) values ('5', '2020-03-01', '50');

SELECT * FROM Products;
SELECT * FROM Orders;

-- 1327.Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount. 

--1. Join the table
SELECT *
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id;

-- put everything in group by
SELECT *, SUM(unit) AS total_unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_id, o.product_id, product_name, product_category, order_date, unit;

-- 2. filter feb 2020
SELECT *
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29';

-- 3. group rows and count 
SELECT p.product_name, SUM(unit) AS amount
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE order_date BETWEEN '2020-02-02' AND '2020-02-29'
GROUP BY p.product_name;

-- 4. filter out less than 100 units
SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;


-- partition way
-- 1. keep all rows and calculate aggregate for each rows
SELECT p.product_name, SUM(o.unit) OVER(PARTITION BY p.product_id) AS unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29';

-- 2. filter out duplicate name and unit
SELECT DISTINCT product_name, unit
FROM (
    SELECT p.product_name, SUM(o.unit) OVER(PARTITION BY p.product_id) AS unit
    FROM Products p
    JOIN Orders o
    ON p.product_id = o.product_id
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
) cte
WHERE unit >= 100;