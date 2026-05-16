SELECT * FROM facebook_friends;

-- 10284. Popularity Percentage 

-- Find the popularity percentage for each user on Meta/Facebook. The dataset
-- contains two columns, user1 and user2, which represent pairs of friends. Each
-- row indicates a mutual friendship between user1 and user2, meaning both users
-- are friends with each other. A user's popularity percentage is calculated as
-- the total number of friends they have (counting connections from both user1
-- and user2 columns) divided by the total number of unique users on the
-- platform. Multiply this value by 100 to express it as a percentage.  Output
-- each user along with their calculated popularity percentage. The results
-- should be ordered by user ID in ascending order. 

-- total_users
SELECT DISTINCT user1 AS total_user
FROM facebook_friends
UNION ALL
SELECT DISTINCT user2
FROM facebook_friends
ORDER BY total_user;

-- find unique_users
WITH cte AS (
SELECT DISTINCT user1 AS total_user
FROM facebook_friends
UNION ALL
SELECT DISTINCT user2
FROM facebook_friends
ORDER BY total_user)

SELECT COUNT(DISTINCT total_user) AS unique_users
FROM cte;

-- cross join results
WITH cte AS (
SELECT DISTINCT user1 AS total_user
FROM facebook_friends
UNION ALL
SELECT DISTINCT user2
FROM facebook_friends
ORDER BY total_user),

unique_users AS (
SELECT COUNT(DISTINCT total_user) AS total_unique_users
FROM cte
),

cte2 AS (
SELECT DISTINCT user1,user2 
FROM facebook_friends
UNION ALL
SELECT DISTINCT user2,user1
FROM facebook_friends)

SELECT *
FROM unique_users u
JOIN cte2 c
ON 1 = 1;

--  total users friends
WITH cte AS (
SELECT DISTINCT user1 AS total_user
FROM facebook_friends
UNION ALL
SELECT DISTINCT user2
FROM facebook_friends
ORDER BY total_user),

unique_users AS (
SELECT COUNT(DISTINCT total_user) AS unique_users
FROM cte
),

cte2 AS (
SELECT DISTINCT user1,user2 
FROM facebook_friends
UNION ALL
SELECT DISTINCT user2,user1
FROM facebook_friends)

-- implicit cross join 
SELECT user1,
       ROUND(COUNT(*) / u.unique_users::FLOAT * 100) AS popularity_percentage
FROM unique_users u
JOIN cte2 c
ON 1 = 1
GROUP BY user1, u.unique_users
ORDER BY user1;

--  another way explicit cross join
WITH total_connections AS (
    SELECT user1 AS user_id, user2 AS friend_id FROM facebook_friends
    UNION
    SELECT user2 AS user_id, user1 AS friend_id FROM facebook_friends
),
platform_stats AS (
    SELECT COUNT(DISTINCT user_id)::float AS total_users 
    FROM total_connections
)
SELECT 
    c.user_id,
    ROUND((COUNT(c.friend_id) / p.total_users) * 100) AS popularity_percentage
FROM total_connections c
CROSS JOIN platform_stats p
GROUP BY c.user_id, p.total_users
ORDER BY c.user_id ASC;