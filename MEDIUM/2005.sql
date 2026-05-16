SELECT * FROM fb_active_users; 

-- 2005. Calculate the percentage of users who are both from the US and have an 'open' status, as indicated in the fb_active_users table.

-- filter USA

SELECT *
FROM fb_active_users
WHERE country = 'USA';

-- count all users
SELECT COUNT(*) AS total_users
FROM fb_active_users
WHERE country = 'USA';


-- filter open

SELECT *
FROM fb_active_users
WHERE country = 'USA'
AND status = 'open';

-- count users as active users when status is open
SELECT COUNT(CASE WHEN status = 'open' THEN user_id ELSE NULL END) AS active_users
FROM fb_active_users
WHERE country = 'USA';

-- find ratio of active users in total USA 
SELECT COUNT(CASE WHEN status = 'open' THEN user_id ELSE NULL END) / COUNT(*):: FLOAT * 100 AS percentage_of_active_users
FROM fb_active_users
WHERE country = 'USA';

-- only USA active share out total share

SELECT COUNT(CASE WHEN status = 'open' AND country = 'USA' THEN user_id ELSE NULL END) / COUNT(*):: FLOAT * 100 AS percentage_of_usa_active_users
FROM fb_active_users;
