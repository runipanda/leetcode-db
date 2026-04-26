DROP TABLE IF EXISTS Warehouse;
DROP TABLE IF EXISTS Products;

CREATE TABLE Warehouse (
    name VARCHAR(50),
    product_id INT,
    units INT
);

CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    Width INT,
    Length INT,
    Height INT
);

INSERT INTO Warehouse (name, product_id, units) VALUES 
('LCHouse1', 1, 1),
('LCHouse1', 2, 10),
('LCHouse1', 3, 5),
('LCHouse2', 1, 2),
('LCHouse2', 2, 2),
('LCHouse3', 4, 1);

INSERT INTO Products (product_id, product_name, Width, Length, Height) VALUES 
(1, 'LC-TV', 5, 50, 40),
(2, 'LC-KeyChain', 5, 5, 5),
(3, 'LC-Phone', 2, 10, 10),
(4, 'LC-T-Shirt', 4, 10, 2);

SELECT *
FROM Warehouse;
SELECT *
FROM Products;

-- 1571. Volume of each warehouse
-- 1. Join Table
SELECT *
FROM Warehouse w
LEFT JOIN Products p
ON w.product_id = p.product_id

-- 2. find each product volume
SELECT name, units * width * length * height AS volumes
FROM Warehouse w
LEFT JOIN Products p
ON w.product_id = p.product_id

-- 3. find each warehouse volume
SELECT w.name AS warehouse, 
    SUM(units * width * length * height)
FROM Warehouse w
LEFT JOIN Products p
ON w.product_id = p.product_id
GROUP BY w.name
ORDER BY warehouse;
