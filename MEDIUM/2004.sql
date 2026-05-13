SELECT * FROM fb_comments_count;

-- 2004.Number of Comments Per User in 30 days before 2020-02-10
-- Return the total number of comments received for each user in the 30-day period
-- up to and including 2020-02-10. Don't output users who haven't received any
-- comment in the defined time period. 

-- direced labeled date

SELECT user_id,
       SUM(number_of_comments) AS total_comments
FROM fb_comments_count
WHERE created_at BETWEEN ('2020-02-10'::date -  INTERVAL '1 month') AND '2020-02-10'
GROUP BY user_id;

--  USING CAST

SELECT user_id,
       SUM(number_of_comments) AS total_comments
FROM fb_comments_count
WHERE created_at BETWEEN (CAST('2020-02-10' AS DATE) -  INTERVAL '1 month') AND CAST('2020-02-10' AS DATE)
GROUP BY user_id;

-- created At and Cast it to date

SELECT user_id,
    SUM(number_of_comments) AS total_comments
FROM fb_comments_count
WHERE created_at >= (CAST('2020-02-10' AS DATE) - INTERVAL '1 month') AND created_at <= CAST('2020-02-10' AS DATE)
GROUP BY user_id;