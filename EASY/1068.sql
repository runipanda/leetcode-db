Create table If Not Exists Sales (sale_id int, product_id int, year int, quantity int, price int);
Create table If Not Exists Products (product_id int, product_name varchar(10));
Truncate table Sales;
insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000');
Truncate table Products;
insert into Products (product_id, product_name) values ('100', 'Nokia');
insert into Products (product_id, product_name) values ('200', 'Apple');
insert into Products (product_id, product_name) values ('300', 'Samsung');

SELECT * FROM Products;
SELECT * FROM Sales;

-- 1068. Product Sales Analyses
SELECT p.product_id, p.product_name, s.price, s.quantity
FROM Products p
JOIN Sales s
ON p.product_id = s.product_id;

-- total products worth
SELECT p.product_id, p.product_name, SUM(price * quantity) AS total_worth
FROM Products p
JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
ORDER BY p.product_id
