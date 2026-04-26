DROP TABLE IF EXISTS Activities;
CREATE TABLE Activities (
    sell_date  DATE,
    product    VARCHAR(255)
);
INSERT INTO Activities (sell_date, product) VALUES
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');

SELECT *
FROM Activities;

-- 1484. Group Sold Products By the Date

--1. aggregate and count no of products sold
SELECT sell_date, COUNT(product) AS sold
FROM Activities
GROUP BY sell_date;

--2. aggregate string products
SELECT sell_date, COUNT(product) AS sold,
STRING_AGG(product, ', ') AS product
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;