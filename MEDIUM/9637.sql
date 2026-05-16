SELECT * FROM airbnb_search_details;
SELECT COUNT(*)
FROM airbnb_search_details;

-- 9637.Calculate Airbnb's annual growth rate using the number of registered hosts as the key metric. The growth rate is determined by:
-- Growth Rate = ((Number of hosts registered in the current year - number of hosts registered in the previous year) / number of hosts registered in the previous year) * 100. 
-- Output the year, number of hosts in the current year,
-- number of hosts in the previous year, and the growth rate. Round the growth
-- rate to the nearest percent. Sort the results in ascending order by year.
-- Assume that the dataset consists only of unique hosts, meaning there are no
-- duplicate hosts listed. 

-- Formulate the Approach
-- Number of hosts registered in the current year
-- Number of hosts registered in the previous year

-- understanding the data
SELECT id, host_since
FROM airbnb_search_details;

-- extract year
WITH cte AS(SELECT *, TO_CHAR(host_since, 'YYYY') AS year
FROM airbnb_search_details)

SELECT year, COUNT(id) AS current_year_hosts
FROM cte
GROUP BY year
ORDER BY year;

-- extract previous year
WITH cte AS (
SELECT *, TO_CHAR(host_since, 'YYYY') AS year
FROM airbnb_search_details),

cte2 AS (
SELECT year, COUNT(id) AS current_year_hosts
FROM cte 
GROUP BY year)

SELECT year, current_year_hosts,
       LAG(current_year_hosts, 1) OVER(ORDER BY year) AS prev_year_hosts
FROM cte2;

-- compute growth rate
ANALYZE airbnb_search_details;
EXPLAIN (ANALYZE, BUFFERS)
WITH cte AS (
SELECT *,  EXTRACT(YEAR FROM host_since) AS year
FROM airbnb_search_details),

cte2 AS (
SELECT year, COUNT(id) AS current_year_hosts
FROM cte 
GROUP BY year),

cte3 AS(SELECT year, current_year_hosts,
       LAG(current_year_hosts, 1) OVER(ORDER BY year) AS prev_year_hosts
FROM cte2)

SELECT year, current_year_hosts, prev_year_hosts,
      ROUND(((current_year_hosts - prev_year_hosts)::NUMERIC / prev_year_hosts :: NUMERIC) * 100) AS growth_rate
FROM cte3
WHERE prev_year_hosts IS NOT NULL;