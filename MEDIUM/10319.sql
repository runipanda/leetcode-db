SELECT * FROM sf_transactions;

-- 10319.Monthly Percentage Difference
-- Given a table of purchases by date, calculate the month-over-month percentage change in revenue. 
-- The output should include the year-month date (YYYY-MM) and percentage change, 
-- rounded to the 2nd decimal point, and sorted from the beginning of
-- the year to the end of the year.  The percentage change column will be
-- populated from the 2nd month forward and can be calculated as ((this month's
-- revenue - last month's revenue) / last month's revenue) * 100. 

SELECT created_at FROM sf_transactions;

-- cast it AS date
SELECT created_at::DATE 
FROM sf_transactions;

-- cast it AS date
SELECT CAST(created_at AS DATE)
FROM sf_transactions;

-- extract month and year
SELECT TO_CHAR(created_at::DATE, 'YYYY-MM') AS date
FROM sf_transactions;

-- get the sum of values
SELECT  TO_CHAR(created_at, 'YYYY-MM') AS month,
        SUM(value) AS current_revenue
FROM sf_transactions
GROUP BY month;

-- calculate prev month revenue
SELECT  TO_CHAR(created_at, 'YYYY-MM') AS month,
        SUM(value) AS current_revenue,
        LAG(SUM(value), 1) OVER() AS last_month_revenue 
FROM sf_transactions
GROUP BY month;

-- get the column month from cte to sort it in window function 
WITH cte AS (
SELECT  TO_CHAR(created_at, 'YYYY-MM') AS month,
        SUM(value) AS current_revenue
FROM sf_transactions
GROUP BY month)

SELECT month, 
      current_revenue,
      LAG(current_revenue, 1) OVER(ORDER BY month) AS last_month_revenue
FROM cte;

-- sort it accrodig to date 
SELECT  TO_CHAR(created_at, 'YYYY-MM') AS month,
        SUM(value) AS current_revenue,
        LAG(SUM(value), 1) OVER(ORDER BY TO_CHAR(created_at, 'YYYY-MM')) AS last_month_revenue 
FROM sf_transactions
GROUP BY month;

-- find difference between current_revenue and last_month_revenue
WITH cte AS (
SELECT  TO_CHAR(created_at, 'YYYY-MM') AS month,
        SUM(value) AS current_revenue
FROM sf_transactions
GROUP BY month),

cte2 AS(
SELECT month, 
      current_revenue,
      LAG(current_revenue, 1) OVER(ORDER BY month) AS last_month_revenue
FROM cte)

SELECT month, current_revenue, last_month_revenue,
        ROUND(((current_revenue - last_month_revenue) / last_month_revenue)::NUMERIC * 100, 2) AS revenue_diff
FROM cte2;

-- find diffrence between current revenue and prev_revenue
SELECT  TO_CHAR(created_at, 'YYYY-MM') AS month,
        SUM(value) AS current_revenue,
        LAG(SUM(value), 1) OVER(ORDER BY TO_CHAR(created_at, 'YYYY-MM')) AS last_month_revenue,
        ROUND(((SUM(value) - LAG(SUM(value), 1) OVER(ORDER BY TO_CHAR(created_at, 'YYYY-MM')))/LAG(SUM(value), 1) OVER(ORDER BY TO_CHAR(created_at, 'YYYY-MM'))::NUMERIC) * 100, 2)  AS revenue_diff
FROM sf_transactions
GROUP BY month;

-- using window variable
-- find diffrence between current revenue and prev_revenue
SELECT  TO_CHAR(created_at, 'YYYY-MM') AS month,
        SUM(value) AS current_revenue,
        LAG(SUM(value), 1) OVER(w) AS last_month_revenue,
        ROUND(((SUM(value) - LAG(SUM(value), 1) OVER(w))/LAG(SUM(value), 1) OVER(w)::NUMERIC) * 100, 2)  AS revenue_diff
FROM sf_transactions
GROUP BY month
WINDOW w AS (ORDER BY TO_CHAR(created_at, 'YYYY-MM'))
