DROP TABLE IF EXISTS download;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS acc;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    acc_id INT
);

CREATE TABLE acc (
    acc_id INT PRIMARY KEY,
    paying_customer VARCHAR(10)
);

CREATE TABLE download (
    date DATE,
    user_id INT,
    downloads INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO acc (acc_id, paying_customer) VALUES 
(1, 'no'), 
(2, 'yes'), 
(3, 'no'), 
(4, 'yes');

INSERT INTO users (user_id, acc_id) VALUES 
(101, 1), 
(102, 2), 
(103, 3), 
(104, 4), 
(105, 1);

INSERT INTO download (date, user_id, downloads) VALUES 
('2020-08-16', 101, 10), 
('2020-08-16', 102, 5), 
('2020-08-16', 105, 8),
('2020-08-17', 101, 2), 
('2020-08-17', 102, 15), 
('2020-08-17', 103, 5),
('2020-08-18', 101, 20), 
('2020-08-18', 104, 10),
('2020-08-19', 102, 25), 
('2020-08-19', 103, 10);

-- SELECT * FROM acc;
-- SELECT * FROM users;
-- SELECT * FROM download;

-- 10300.Premium vs Freemium

-- Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads. 

-- 1. total downloading for paying and non paying users by date
-- 2. filter records where non paying customers has more downloads than paying records
-- 3. Sort by date, output - date, total non-paying downloads and total paying download

-- total downloads
SELECT SUM(downloads)
FROM acc a
JOIN users u USING(acc_id) 
JOIN download d USING (user_id);

-- USING partiton By
-- paying customers
WITH paying AS (
    SELECT *, SUM(downloads) OVER(PARTITION BY date) AS total
    FROM acc a
    JOIN users u USING(acc_id)
    JOIN download d USING(user_id)
    WHERE paying_customer = 'yes'),
-- SELECT * FROM paying;

--  non paying customers
    non_paying AS (
    SELECT *, SUM(downloads) OVER(PARTITION BY date) AS total
    FROM acc a
    JOIN users u USING(acc_id)
    JOIN download d USING(user_id)
    WHERE paying_customer = 'no')
-- SELECT * FROM non_paying;

SELECT n.date, 
       n.total AS non_paying,
       p.total AS paying
FROM non_paying n
LEFT JOIN paying p USING(date)
WHERE n.total > p.total;

-- using group by
-- paying
   WITH paying_cus AS (
    SELECT date, SUM(downloads) AS paying_total
    FROM acc a
    JOIN users u USING(acc_id)
    JOIN download d USING(user_id)
    WHERE paying_customer = 'yes'
    GROUP BY date),

-- non paying
    non_paying_cus AS (
    SELECT date, SUM(downloads) AS non_paying_total
    FROM acc a
    JOIN users u USING(acc_id)
    JOIN download d USING(user_id)
    WHERE paying_customer = 'no'
    GROUP BY date)

-- combing two cte tables
   SELECT n.date,
          n.non_paying_total,
          p.paying_total
   FROM non_paying_cus n
   LEFT JOIN paying_cus p USING(date)
   WHERE n.non_paying_total - p.paying_total > 0;


-- only one cte
WITH cte AS (SELECT date, 
        SUM(CASE WHEN paying_customer = 'yes' THEN downloads END) AS paying,
        SUM(CASE WHEN paying_customer = 'no' THEN downloads END) AS non_paying
FROM acc a
JOIN users u USING(acc_id)
JOIN download d USING(user_id) 
GROUP BY date)

SELECT date, non_paying, paying
FROM cte
WHERE non_paying > paying
ORDER BY date