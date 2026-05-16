SELECT * FROM uber_request_logs;

-- distance per dollar
-- avg cost per month
-- mean variance -> distance per dollar - avg per month

-- 1. distance per dollar
SELECT *, distance_to_travel / monetary_cost :: DOUBLE PRECISION AS distance_per_dollar
FROM uber_request_logs;

-- 2. Avg per month
-- extract month
-- group month and find avg of distance_per_dollar

WITH cte AS (
SELECT *, distance_to_travel / monetary_cost :: DOUBLE PRECISION AS distance_per_dollar,
         TO_CHAR(request_date::DATE, 'YYYY-MM') AS month
FROM uber_request_logs)

SELECT *, AVG(distance_per_dollar) OVER(PARTITION BY month) AS avg_per_month
FROM cte;

-- 3. Mean Variance
-- distance_per_dollar - avg_per_dollar

WITH cte AS (
SELECT *, distance_to_travel / monetary_cost :: DOUBLE PRECISION AS distance_per_dollar,
         TO_CHAR(request_date::DATE, 'YYYY-MM') AS month
FROM uber_request_logs),

    cte2 AS (
SELECT *, AVG(distance_per_dollar) OVER(PARTITION BY month) AS avg_per_month
FROM cte)

SELECT request_date,
      ABS(distance_per_dollar - avg_per_month) AS Mean_Variance
FROM cte2
ORDER BY request_date;