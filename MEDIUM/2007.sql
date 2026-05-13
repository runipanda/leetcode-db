SELECT *
FROM fb_active_users;


SELECT *
FROM fb_comments_count;

-- 2007. Compare the total number of comments made by users in each country during December 2019 and January 2020.
-- For each month, rank countries by their total number of comments in descending order. Countries with the same total should share the same rank, and the next rank should increase by one (without skipping numbers).
-- Return the names of the countries whose rank improved from December to January (that is, their rank number became smaller).
 -- understanding the data - join the table

SELECT *
FROM fb_active_users
LEFT JOIN fb_comments_count USING (user_id);

-- find 2019 data

SELECT *
FROM fb_active_users
LEFT JOIN fb_comments_count USING (user_id)
WHERE created_at <= '2019-12-31'
    AND created_at >= '2019-01-01';

-- find 2019 data per country

SELECT country,
       SUM(number_of_comments) AS total_2019_comments
FROM fb_active_users
LEFT JOIN fb_comments_count USING (user_id)
WHERE created_at BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY country
ORDER BY total_2019_comments;

-- find 2020 data per country

SELECT country,
       SUM(number_of_comments) AS total_2020_comments
FROM fb_active_users
LEFT JOIN fb_comments_count USING (user_id)
WHERE created_at BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY country
ORDER BY total_2020_comments;

-- find all data per country

SELECT t20.country,
       t20.total_2020_comments,
       t19.total_2019_comments
FROM
    (-- cte for 2020
     SELECT country,
        SUM(number_of_comments) AS total_2020_comments
     FROM fb_active_users
     LEFT JOIN fb_comments_count USING (user_id)
     WHERE created_at BETWEEN '2020-01-01' AND '2020-12-31'
     GROUP BY country) t20
FULL OUTER JOIN
    (-- cte for 2019
      SELECT country,
        SUM(number_of_comments) AS total_2019_comments
     FROM fb_active_users
     LEFT JOIN fb_comments_count USING (user_id)
     WHERE created_at BETWEEN '2019-01-01' AND '2019-12-31' AND country IS NOT NULL
     GROUP BY country) t19 USING (country)
ORDER BY country;

-- find 2019 data country wise
 WITH data_2019 AS
    (SELECT country,
            SUM(number_of_comments) AS total_2019_comments
     FROM fb_active_users
     LEFT JOIN fb_comments_count USING (user_id)
     WHERE created_at BETWEEN '2019-12-01' AND '2019-12-31'
     GROUP BY country
     ORDER BY total_2019_comments DESC), 
     
     -- find 2020 data country wise
 data_2020 AS
    (SELECT country,
            SUM(number_of_comments) AS total_2020_comments
     FROM fb_active_users
     LEFT JOIN fb_comments_count USING (user_id)
     WHERE created_at BETWEEN '2020-01-01' AND '2020-01-31'
     GROUP BY country), 
     
     -- give ranking to countries
 ranking_2019 AS
    (SELECT country,
            total_2019_comments,
            DENSE_RANK() OVER(
                              ORDER BY total_2019_comments DESC) AS rank_2019
     FROM data_2019),
 ranking_2020 AS
    (SELECT country,
            total_2020_comments,
            DENSE_RANK() OVER(
                              ORDER BY total_2020_comments DESC) AS rank_2020
     FROM data_2020) 
     
     -- retian records those improved ranking in 2020
SELECT *
FROM ranking_2020 t
LEFT JOIN ranking_2019 n USING (country)
WHERE t.rank_2020 < n.rank_2019;

