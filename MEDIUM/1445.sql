DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    sale_date DATE,
    fruit     VARCHAR(10),
    sold_num  INT,
    PRIMARY KEY (sale_date, fruit)
);

INSERT INTO Sales (sale_date, fruit, sold_num) VALUES
('2020-05-01', 'apples',  5),
('2020-05-01', 'oranges', 8),
('2020-05-02', 'apples',  15),
('2020-05-02', 'oranges', 15),
('2020-05-03', 'apples',  20),
('2020-05-03', 'oranges', 7),
('2020-05-04', 'apples',  15),
('2020-05-04', 'oranges', 16);

SELECT * FROM Sales;

-- 1445. Apples and Oranges

WITH cte AS (
    SELECT *
    FROM Sales
    ORDER BY sale_date, fruit),

    cte2 AS (
    SELECT *, LEAD(sold_num, 1) OVER(PARTITION BY sale_date) AS average_num
    FROM cte)

    SELECT sale_date, (sold_num - average_num) AS diff
    FROM cte2
    WHERE average_num IS NOT NULL
    ORDER BY sale_date;

-- specifically apples

SELECT sale_date,
      SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE -sold_num END) AS diff
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;