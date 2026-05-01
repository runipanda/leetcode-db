DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Prices;

CREATE TABLE Prices (
    product_id INT PRIMARY KEY,
    price      INT NOT NULL
);

CREATE TABLE Sales (
    sale_id    INT PRIMARY KEY,
    product_id INT NOT NULL REFERENCES Prices(product_id),
    user_id    INT NOT NULL,
    quantity   INT NOT NULL
);

INSERT INTO Prices (product_id, price) VALUES
(1, 100),
(2, 200),
(3, 300);

INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES
(1, 1, 1, 6),
(2, 2, 1, 1),
(3, 3, 2, 2),
(4, 3, 3, 3),
(5, 2, 3, 1),
(6, 1, 4, 3);

SELECT * FROM Prices;
SELECT * FROM Sales;

-- 2329. product sales analyses

-- inner join

SELECT *
FROM Prices p
JOIN Sales  s
ON p.product_id = s.product_id;

-- remove duplicate rows

SELECT s.user_id, SUM(p.price * s.quantity) AS total_spending
FROM Prices p 
JOIN Sales s
ON p.product_id = s.product_id
GROUP BY s.user_id
ORDER BY total_spending DESC, s.user_id 