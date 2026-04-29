DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    sale_id      INT PRIMARY KEY,
    product_name VARCHAR(50),
    sale_date    DATE
);

INSERT INTO Sales VALUES
(1, 'LCPHONE',     '2000-01-16'),
(2, 'LCPhone',     '2000-01-17'),
(3, 'LcPhOnE',     '2000-02-18'),
(4, 'LCKeyCHAiN',  '2000-02-19'),
(5, 'LCKeyChain',  '2000-02-28'),
(6, 'Matryoshka',  '2000-03-31');

SELECT * FROM Sales;

-- trim spaces from both ends
    SELECT 
            LOWER(TRIM(product_name))               AS product_name,
            TO_CHAR(sale_date::DATE, 'YYYY-MM')     AS sale_date,
            COUNT(sale_id)
    FROM Sales
    GROUP BY 
        LOWER(TRIM(product_name)),
        TO_CHAR(sale_date::DATE, 'YYYY-MM')
    ORDER BY product_name, sale_date;


-- trim syntax
SELECT
    LOWER(TRIM(BOTH ' ' FROM product_name))  AS product_name,
    TO_CHAR(sale_date::DATE, 'YYYY-MM')      AS sale_date,
    COUNT(sale_id)                           AS total
FROM Sales
GROUP BY
    LOWER(TRIM(BOTH ' ' FROM product_name)),
    TO_CHAR(sale_date::DATE, 'YYYY-MM')
ORDER BY product_name, sale_date;