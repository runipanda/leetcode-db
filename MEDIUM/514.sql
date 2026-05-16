SELECT * 
FROM marketing_campaign
ORDER BY user_id;

-- 514. Marketing Campaign Success [Advanced]
-- You have the marketing_campaign table, which records in-app purchases by
-- users. Users making their first in-app purchase enter a marketing campaign,
-- where they see call-to-actions for more purchases. Find how many users made
-- additional purchases due to the campaign's success.  The campaign starts one
-- day after the first purchase. Users with only one or multiple purchases on
-- the first day do not count, nor do users who later buy only the same products
-- from their first day. 

-- Find user having mutiple purchases, multiple days, different products and Except DAY 1 (find product not bought in DAY 1)

-- user_id 49 - same day buys different products (not eligible for marketing)
-- user_id 50, 55 - different days but buys same products (not eligible for marketing)
-- user_id 25 - diffrent days buys diffrent products but buys same prodcuts as day 1(not eligible for marketing)
-- user_id 10 - diffrent days buys diffrent products -> eligible

-- exploring the data

-- SELECT * 
-- FROM marketing_campaign
-- WHERE user_id = 25;

--  Find different product bought in different days

SELECT user_id,
       COUNT(product_id) AS different_products,
       COUNT(created_at) AS different_days
FROM marketing_campaign
GROUP BY user_id
HAVING COUNT(DISTINCT product_id) > 1
AND    COUNT(DISTINCT created_at) > 1;

-- find product bought in DAY 1 as rank 1

WITH cte AS(
SELECT *,
    RANK() OVER(PARTITION BY user_id ORDER BY created_at) AS rank,
    CONCAT((user_id), '_', (product_id)) AS user_product
FROM marketing_campaign)
SELECT *
FROM cte
WHERE rank = 1;

-- count users who bought -
-- include diffrent days and diffrent products 
-- but exclude day 1

WITH multiple_days_and_products AS(
    SELECT user_id
    FROM marketing_campaign
    GROUP BY user_id
    HAVING COUNT(DISTINCT product_id) > 1
       AND COUNT(DISTINCT created_at) > 1),

    ranked_user AS(
        SELECT *,
        RANK() OVER(PARTITION BY user_id ORDER BY created_at) AS rank
        -- CONCAT((user_id), '_', (product_id)) AS user_product
        FROM marketing_campaign
    ),

    day_1 AS(
        SELECT *
        FROM ranked_user
        WHERE rank = 1
    )

SELECT COUNT(DISTINCT user_id)
FROM marketing_campaign
-- choose user
WHERE user_id IN (
    SELECT user_id
    FROM multiple_days_and_products
)
-- AND CONCAT((user_id), '_', (product_id)) NOT IN (
--     SELECT user_product
--     FROM day_1
-- )

-- verify product_id
AND (user_id, product_id) NOT IN (
    SELECT user_id, product_id
    FROM day_1
)