
SELECT * FROM fb_eu_energy;
SELECT * FROM fb_na_energy;
SELECT * FROM fb_asia_energy;

-- join all rows
-- group by dates and so the total_sum
-- find max sum
-- match max with sum

WITH cte AS (
SELECT *
FROM fb_eu_energy
UNION ALL
SELECT *
FROM fb_na_energy
UNION ALL
SELECT *
FROM fb_asia_energy
)

-- total energy by date
SELECT date,
      SUM(consumption) AS total_energy
FROM cte
GROUP BY date;

-- 
WITH cte AS (
SELECT *
FROM fb_eu_energy
UNION ALL
SELECT *
FROM fb_na_energy
UNION ALL
SELECT *
FROM fb_asia_energy
),

-- 
grouped_date AS (
SELECT date,
      SUM(consumption) AS total_energy
FROM cte
GROUP BY date),

max_energy AS (
SELECT MAX(total_energy) AS max_energy
FROM grouped_date)

SELECT *
FROM grouped_date g
JOIN max_energy m
ON g.total_energy = m.max_energy