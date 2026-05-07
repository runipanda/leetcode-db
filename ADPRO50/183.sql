DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;

CREATE TABLE Customers (
    id   INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Orders (
    id         INT PRIMARY KEY,
    customerId INT
);

INSERT INTO Customers (id, name) VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

INSERT INTO Orders (id, customerId) VALUES
(1, 3),
(2, 1);


SELECT * FROM Customers;
SELECT * FROM Orders;

-- 183. Customers Who never orders
-- not in

SELECT id, name
FROM Customers 
WHERE id NOT IN (SELECT customerId FROM Orders);

--  not exists

SELECT c.id, c.name
FROM Customers c
WHERE NOT EXISTS (SELECT 1 FROM Orders o WHERE c.id = o.customerId);

-- left join

SELECT c.id, c.name
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;