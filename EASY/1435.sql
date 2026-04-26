DROP TABLE IF EXISTS Sessions;

CREATE TABLE Sessions (
    session_id INT PRIMARY KEY,
    duration INT
);

INSERT INTO Sessions (session_id, duration) VALUES
(1, 30),
(2, 199),
(3, 299),
(4, 580),
(5, 1000);

SELECT *
FROM Sessions;

-- 1435. Create a Session Bar Chart

-- 1. find out types of sessions
WITH cte AS(
SELECT *, 
    CASE 
        WHEN duration/60 < 5 THEN '[0-5>'
        WHEN duration/60 >= 5 AND duration/60 < 10 THEN '[5-10>'
        WHEN duration/60 >= 10 AND duration/60 < 15 THEN '[10-15>'
        ELSE '15 or more' 
    END AS sessions_bin
FROM Sessions),

--  2. count no of sessions
cte2 AS(
SELECT sessions_bin, COUNT(*) AS total
FROM cte 
GROUP BY sessions_bin),

-- 3. make a table of different sessions
cte3 AS(
SELECT '[0-5>' AS bin
UNION
SELECT '[5-10>'
UNION 
SELECT '[10-15>'
UNION
SELECT '15 or more')

-- 4. join - final query
SELECT cte3.bin, COALESCE(cte2.total, 0) AS total
FROM cte3
LEFT JOIN cte2
ON cte3.bin = cte2.sessions_bin;

-- single query no cte
SELECT '[0-5>' AS bin, COUNT(*) AS total 
FROM Sessions 
WHERE duration/60 < 5
UNION
SELECT '[5-10>' AS bin, COUNT(*) AS total 
FROM Sessions 
WHERE duration/60 >= 5 AND duration/60 < 10
UNION
SELECT '[10-15>' AS bin, COUNT(*) AS total 
FROM Sessions 
WHERE duration/60 >= 10 AND duration/60 < 15
UNION
SELECT '15 or more' AS bin, COUNT(*) AS total 
FROM Sessions 
WHERE duration/60 >= 15;