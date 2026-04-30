DROP TABLE IF EXISTS Activity;

CREATE TABLE Activity (
    player_id    INT,
    device_id    INT,
    event_date   DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

INSERT INTO Activity VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

SELECT * FROM Activity;

-- 512. Game Play Analysis
-- 1. simple group by
SELECT player_id, MIN(event_date) AS event_date
FROM Activity
GROUP BY player_id
ORDER BY player_id;

-- 2. group by - subquery
SELECT player_id, event_date
FROM Activity
WHERE (player_id, event_date) IN (SELECT player_id, MIN(event_date) AS event_date
                                  FROM Activity
                                  GROUP BY player_id)
ORDER BY player_id;

-- 2. partition + cte
WITH cte AS(
    SELECT *, ROW_NUMBER() OVER(PARTITION BY player_id) AS row_no
    FROM Activity)

SELECT player_id, event_date
FROM cte
WHERE row_no = 1;