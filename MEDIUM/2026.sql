SELECT * FROM fact_events;

-- 2026.Bottom 2 Companies By Mobile Usage
-- Write a query to identify all companies (customer_id) whose mobile usage ranks in the bottom two positions. Mobile usage is the count of events where client_id = 'mobile'. 
-- Companies with the same usage count should share the same rank, and
-- all companies in the bottom two ranks should be included. Return the customer_id
-- and event count, sorted in ascending order by the number of events.
 
-- filter mobile
SELECT *
FROM fact_events
WHERE client_id = 'mobile';

-- group customers - count their mobile usage
SELECT COUNT(client_id)
FROM fact_events
WHERE client_id = 'mobile'
GROUP BY customer_id;

-- count their mobile usage
SELECT customer_id,
       COUNT(*)  AS mobile_usage
FROM fact_events
WHERE client_id = 'mobile'
GROUP BY customer_id;

-- dense_rank 
SELECT customer_id,
       COUNT(*) AS mobile_usage, 
       DENSE_RANK() OVER(ORDER BY COUNT(*)) AS rank
FROM fact_events
WHERE client_id = 'mobile'
GROUP BY customer_id;

--  get the companies whosr rank is less than 2
WITH cte AS (
    SELECT customer_id,
       COUNT(*) AS mobile_usage,
       DENSE_RANK() OVER(ORDER BY COUNT(*)) AS rank
    FROM fact_events
    WHERE client_id = 'mobile'
    GROUP BY customer_id)

SELECT customer_id,
        mobile_usage
FROM cte
WHERE rank <= 2
ORDER BY mobile_usage;
