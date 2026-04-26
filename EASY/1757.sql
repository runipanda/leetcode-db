DROP TABLE IF EXISTS Products;
CREATE TABLE IF NOT EXISTS Products (
    product_id int, 
    low_fats VARCHAR(1) CHECK (low_fats IN ('Y', 'N')), 
    recyclable VARCHAR(1) CHECK (recyclable IN ('Y', 'N'))
);
Truncate table Products;
insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N');
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N');

SELECT *
FROM Products;

-- 1757. Write a solution to find the ids of products that are both low fat and recyclable 

-- 1. all low fats
SELECT *
FROM Products
WHERE low_fats = 'Y';

-- 2. all recyclable
SELECT *
FROM Products
WHERE recyclable = 'Y';

-- 3. all low fats and recyclable 
SELECT *
FROM Products
WHERE low_fats = 'Y'
AND recyclable = 'Y';
