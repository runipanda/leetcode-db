DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    product_id INT,
    store      VARCHAR(50),
    price      INT
);

INSERT INTO Products VALUES
(0, 'store1', 95),
(0, 'store2', 100),
(0, 'store3', 105),
(1, 'store1', 70),
(1, 'store3', 80);

-- 1777. Rearrange Products Table (product's price for each store) 
-- Group By

SELECT product_id,
       MAX(CASE WHEN store = 'store1' THEN price ELSE NULL END) AS store1,
       MAX(CASE WHEN store = 'store2' THEN price ELSE NULL END) AS store2,
       MAX(CASE WHEN store = 'store3' THEN price ELSE NULL END) AS store3
FROM Products
GROUP BY product_id





