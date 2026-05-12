-- SELECT * FROM amazon_purchases ORDER BY created_at;

-- 10314. REVENUE OVER TIME
-- Find the 3-month rolling average of total revenue from purchases given a table with users, their purchase amount, and date purchased. Do not include returns which are represented by negative purchase values. Output the year-month (YYYY-MM) and 3-month rolling average of revenue, sorted from earliest month to latest month.
-- A 3-month rolling average is defined by calculating the average total revenue from all user purchases for the current month and previous two months. The first two months will not be a true 3-month rolling average since we are not given data from last year. Assume each month has at least one purchase.

-- 1. total revenue per month
-- 2. extract date like month and year
-- 3. filter out negative numbers
-- 4.  


-- UISNG WINDOW FUNCTION
-- 1.
SELECT SUM(purchase_amt) AS revenue_month
FROM amazon_purchases;

SELECT  TO_CHAR(created_at::date, 'YYYY-MM') AS month_year
FROM amazon_purchases;

-- 2. extract date like month and year
SELECT  TO_CHAR(created_at::date, 'YYYY-MM') AS month_year,
        SUM(purchase_amt) AS revenue_month
FROM amazon_purchases
GROUP BY month_year;

-- 3. positive numbers
SELECT  TO_CHAR(created_at::date, 'YYYY-MM') AS month_year,
        SUM(purchase_amt) AS revenue_month
FROM amazon_purchases
WHERE purchase_amt >= 0
GROUP BY month_year
ORDER BY month_year;

-- 4. calculate las 3 months average
WITH cte AS(
    SELECT  TO_CHAR(created_at::date, 'YYYY-MM') AS month_year,
        SUM(purchase_amt) AS revenue_month
    FROM amazon_purchases
    WHERE purchase_amt >= 0
    GROUP BY month_year)

    SELECT month_year,
          AVG(revenue_month) OVER(ORDER BY month_year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_avg 
    FROM cte;


-- SELF JOIN CTEs Tables
-- extract month and create a total revenue
SELECT TO_CHAR(created_at::date, 'YYYY-MM') AS month_year,
       SUM(purchase_amt) AS revenue_month
FROM amazon_purchases
GROUP BY month_year
ORDER BY month_year;


-- create a date starting from 1st of every month
SELECT to_date(TO_CHAR(created_at::date, 'YYYY-MM'), 'YYYY-MM-01') AS month_year,
      SUM(purchase_amt) AS revenue_month
      FROM amazon_purchases
      GROUP BY month_year
      ORDER BY month_year;

--  positive amount
SELECT to_date(TO_CHAR(created_at::date, 'YYYY-MM'), 'YYYY-MM-01') AS month_year, 
      SUM(purchase_amt) AS revenue_month
      FROM amazon_purchases
      WHERE purchase_amt >= 0
      GROUP BY month_year
      ORDER BY month_year;

-- strucure the month
WITH revenue AS (
      SELECT to_date(TO_CHAR(created_at::date, 'YYYY-MM'), 'YYYY-MM-01') AS month_year, 
      SUM(purchase_amt) AS revenue_month
      FROM amazon_purchases
      WHERE purchase_amt >= 0
      GROUP BY month_year)

    SELECT TO_CHAR(month_year, 'YYYY-MM') AS month
    FROM revenue;

-- joining ctes to get back previous 2 months + current month averages
WITH revenue AS (
      SELECT to_date(TO_CHAR(created_at::date, 'YYYY-MM'), 'YYYY-MM-01') AS month_year, 
      SUM(purchase_amt) AS revenue_month
      FROM amazon_purchases
      WHERE purchase_amt >= 0
      GROUP BY month_year)

    SELECT *, TO_CHAR(m1.month_year, 'YYYY-MM') AS month
    FROM revenue m1       
    JOIN revenue m2 ON m2.month_year = m1.month_year - INTERVAL '1 month'
    JOIN revenue m3 ON m3.month_year = m1.month_year - INTERVAL '2 months';

-- calculate average 0f last 3 months
WITH revenue AS (
      SELECT to_date(TO_CHAR(created_at::date, 'YYYY-MM'), 'YYYY-MM-01') AS month_year, 
      SUM(purchase_amt) AS revenue_month
      FROM amazon_purchases
      WHERE purchase_amt >= 0
      GROUP BY month_year)

    SELECT TO_CHAR(m1.month_year, 'YYYY-MM') AS month,
           (m1.revenue_month + m2.revenue_month + m3.revenue_month)/3 AS rolling_avg
    FROM revenue m1       
    JOIN revenue m2 ON m2.month_year = m1.month_year - INTERVAL '1 month'
    JOIN revenue m3 ON m3.month_year = m1.month_year - INTERVAL '2 months'














































