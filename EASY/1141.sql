DROP TABLE IF EXISTS Activity;
DROP TYPE IF EXISTS activity_enum;

CREATE TYPE activity_enum AS ENUM ('open_session', 'end_session', 'scroll_down', 'send_message');

CREATE TABLE Activity (
user_id INT,
session_id INT,
activity_date DATE,
activity_type activity_enum
);

INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down'),
(1, 1, '2019-07-20', 'end_session'),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session'),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session'),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-27', 'open_session'),
(4, 3, '2019-06-28', 'open_session'),
(4, 3, '2019-06-27', 'open_session');

SELECT * FROM Activity;

-- 1141 - User Activity Past 30 Days 
-- currrent date - 30 days that would be 31 days cuz current day included

-- filter date
SELECT *
FROM Activity
WHERE activity_date BETWEEN 
            DATE '2019-07-27' - INTERVAL '29 days' AND DATE '2019-07-27';


-- remove duplicates

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN
            DATE '2019-07-27' - INTERVAL '29 days' AND DATE '2019-07-27'
GROUP BY activity_date
 


