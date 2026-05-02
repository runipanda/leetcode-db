DROP TABLE IF EXISTS Product, Invoice;

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY,
    product_id INT,
    rest INT,
    paid INT,
    canceled INT,
    refunded INT
);

INSERT INTO Product VALUES
(0, 'paneer'),
(1, 'dal');

INSERT INTO Invoice VALUES
(23, 0, 2, 0, 5, 0),
(12, 0, 0, 4, 0, 3),
(1,  1, 1, 1, 0, 1),
(2,  1, 1, 0, 1, 1),
(3,  1, 0, 1, 1, 1),
(4,  1, 1, 1, 1, 0);

SELECT * FROM Product;
SELECT * FROM Invoice;

-- 1677. Product's worth over invoices

SELECT p.name, 
        COALESCE(SUM(i.rest), 0) AS rest,
        COALESCE(SUM(i.paid), 0) AS paid,
        COALESCE(SUM(i.canceled), 0) AS cancelled,
        COALESCE(SUM(i.refunded), 0) AS refunded
FROM Product p
LEFT JOIN Invoice i
ON p.product_id = i.product_id
GROUP BY p.name
ORDER BY p.name