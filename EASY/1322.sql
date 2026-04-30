DROP TABLE IF EXISTS Ads;

CREATE TABLE Ads (
    ad_id   INT,
    user_id INT,
    action  VARCHAR(10) CHECK (action IN ('Clicked', 'Viewed', 'Ignored')),
    PRIMARY KEY (ad_id, user_id)
);

INSERT INTO Ads (ad_id, user_id, action) VALUES
(1,  1,  'Clicked'),
(2,  2,  'Clicked'),
(3,  3,  'Viewed'),
(5,  5,  'Ignored'),
(1,  7,  'Ignored'),
(2,  7,  'Viewed'),
(3,  5,  'Clicked'),
(1,  4,  'Viewed'),
(2,  11, 'Viewed'),
(1,  2,  'Clicked');

SELECT * FROM Ads;

-- 1322. Ads Performance
-- 1. Group duplicate rows

SELECT ad_id
FROM Ads
GROUP BY ad_id;

-- 2. calculate each action clicked or viewed as 1 and no action 0
-- for decimal value cast it to numeric

WITH cte AS (
    SELECT ad_id, 
        SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) AS Clicked,
        SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) AS Viewed
FROM Ads
GROUP BY ad_id)

SELECT ad_id, 
        CASE WHEN Clicked + Viewed = 0 THEN 0.00
        ELSE ROUND((Clicked::NUMERIC/ (Clicked + Viewed)) * 100, 2) END AS ctr
FROM cte
ORDER BY ctr DESC, ad_id