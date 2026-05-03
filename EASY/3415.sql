DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name       VARCHAR(100)
);

INSERT INTO Products VALUES
    (1, 'ABC123XYZ'),
    (2, 'Item1234X'),
    (3, 'NoDigitsHere'),
    (4, 'only12here'),
    (5, '789Product'),
    (6, 'Item003Description');

SELECT * FROM Products;

-- 3415. Find Products with Three Consecutive Digits

SELECT product_id, "name"
FROM Products 
WHERE "name" ~ '(^|[^0-9])[0-9]{3}([^0-9]|$)'
ORDER BY product_id;

-- 
SELECT product_id, "name"
FROM Products
WHERE REGEXP_LIKE(name, '[0-9]{3}')
AND NOT REGEXP_LIKE(name, '[0-9]{4,}')
ORDER BY product_id;