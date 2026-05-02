DROP TABLE IF EXISTS Product, Sales;

CREATE TABLE Product (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(50),
    unit_price   INT
);

CREATE TABLE Sales (
    seller_id  INT,
    product_id INT,
    buyer_id   INT,
    sale_date  DATE,
    quantity   INT,
    price      INT
);

INSERT INTO Product VALUES
(1, 'S8',     1000),
(2, 'G4',      800),
(3, 'iPhone', 1400);

INSERT INTO Sales VALUES
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1,  800),
(2, 1, 3, '2019-06-02', 1,  800),
(3, 3, 3, '2019-05-13', 2, 2800);

SELECT * FROM Product, Sales;


-- 1083. Buyers who bought S8 but NOT iPhone 
-- first join table

-- not in syntax
WITH cte AS (
SELECT s.*, p.product_name
FROM Sales s
LEFT JOIN Product p
ON s.product_id = p.product_id)

SELECT DISTINCT buyer_id
FROM cte
WHERE product_name = 'S8'
AND buyer_id NOT IN (SELECT DISTINCT buyer_id FROM cte WHERE product_name = 'iPhone');

-- except syntax

SELECT DISTINCT buyer_id
FROM Sales
JOIN Product USING (product_id)
WHERE product_name = 'S8'

EXCEPT

SELECT DISTINCT buyer_id
FROM Sales
JOIN Product USING (product_id)
WHERE product_name = 'iPhone';

-- having syntax

SELECT buyer_id
FROM Sales
JOIN Product USING (product_id)
GROUP BY buyer_id
HAVING MAX(CASE WHEN product_name = 'S8' THEN 1 ELSE 0 END) = 1
   AND MAX(CASE WHEN product_name = 'iPhone' THEN 1 ELSE 0 END) = 0;

-- filter syntax

SELECT buyer_id
FROM Sales
JOIN Product USING (product_id)
GROUP BY buyer_id
HAVING COUNT(*) FILTER(WHERE product_name = 'S8') > 0
   AND COUNT(*) FILTER(WHERE product_name = 'iPhone') = 0;















