DROP TABLE IF EXISTS facebook_web_log;

CREATE TABLE facebook_web_log (
    user_id INT,
    timestamp TIMESTAMP,
    action VARCHAR(50)
);

INSERT INTO facebook_web_log (user_id, timestamp, action) VALUES 
(0, '2019-04-25 13:30:15', 'page_load'),
(0, '2019-04-25 13:30:18', 'page_load'),
(0, '2019-04-25 13:30:40', 'page_exit'),
(1, '2019-04-25 13:40:00', 'page_load'),
(1, '2019-04-25 13:40:10', 'page_exit'),
(1, '2019-04-26 11:15:00', 'page_load'),
(1, '2019-04-26 11:15:20', 'page_exit'),
(2, '2019-04-25 10:30:00', 'page_load'),
(2, '2019-04-25 10:30:15', 'page_load'),
(2, '2019-04-25 10:30:45', 'page_exit'),
(0, '2019-04-28 14:00:00', 'page_load'),
(0, '2019-04-28 14:00:10', 'page_exit'),
(3, '2019-04-25 15:00:00', 'page_load'),
(3, '2019-04-25 15:00:30', 'page_exit'),
(4, '2019-04-25 12:00:00', 'page_exit'),
(4, '2019-04-25 12:00:15', 'page_load');

SELECT * FROM facebook_web_log;

-- 10352. Users By Average Session Time 

WITH cte AS (
    SELECT user_id,
           timestamp,
           action
    FROM  facebook_web_log
    WHERE action IN('page_load', 'page_exit')
),

    cte2 AS (
    SELECT user_id,
           action,
           timestamp,
    LAG(action, 1) OVER(PARTITION BY user_id ORDER BY timestamp) AS prev_action,
    LAG(timestamp, 1) OVER(PARTITION BY user_id ORDER BY timestamp) AS prev_timestamp
    FROM cte
    )

    SELECT user_id,
        AVG(timestamp - prev_timestamp) AS average_session_time
    FROM cte2
    WHERE action = 'page_exit' AND prev_action = 'page_load'
    GROUP BY user_id;