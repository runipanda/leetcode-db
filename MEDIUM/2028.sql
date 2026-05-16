SELECT * FROM fact_events;

-- 2028. New And Existing Users
-- Calculate the share of new and existing users for each month in the table. Output the month, share of new users, and share of existing users as a ratio.
-- New users are defined as users who started using services in the current month (there is no usage history in previous months). Existing users are users who used services in the current month, and who also used services in any prior month of 2020.
-- Assume that the dates are all from the year 2020 and that users are contained in user_id column. 

-- extract the date and time
-- SELECT DATE_TRUNC('month', time_id) AS month
-- FROM fact_events;

-- -- extract both numeric and strings month 
-- SELECT to_char(time_id, 'MM') AS month_numeric,
--        to_char(time_id, 'Month') AS month_name
-- FROM fact_events;

-- -- extract the numeric month
-- SELECT EXTRACT(MONTH FROM time_id) AS month
-- FROM fact_events;

-- -- extract the numeric month 
-- SELECT DATE_PART('month', time_id) AS month
-- FROM fact_events;

-- find new user start date
SELECT user_id,
       MIN(time_id) AS new_user_start_date
FROM fact_events
GROUP BY user_id;

-- find new users start time
WITH cte AS (
SELECT user_id,
       MIN(time_id) AS new_user_start_date
FROM fact_events
GROUP BY user_id),

    cte2 AS (
SELECT user_id,
      EXTRACT(MONTH FROM new_user_start_date) AS month
FROM cte)

SELECT month,
      COUNT(DISTINCT user_id) AS new_users
FROM cte2
GROUP BY month;

--  

WITH new_users_date AS (
SELECT user_id,
       EXTRACT(MONTH FROM MIN(time_id)) AS month
FROM fact_events
GROUP BY user_id),

new_users AS (
    SELECT month, 
       COUNT(distinct user_id) AS total_new_users
FROM new_users_date
GROUP BY month),

all_users AS (SELECT EXTRACT(MONTH FROM time_id) AS month,
       COUNT(DISTINCT user_id) AS total_users
FROM fact_events
GROUP BY month)

SELECT a.month,
       ROUND(total_new_users/ total_users :: DECIMAL, 2) AS share_new_users,
       ROUND(1 - (total_new_users) / total_users :: DECIMAL, 2) AS share_existing_users
FROM all_users a
JOIN new_users n  USING(month)