DROP TABLE IF EXISTS Activity;

CREATE TABLE Activity (
    user_id       INT,
    session_id    INT,
    activity_date DATE,
    activity_type VARCHAR(20)
);

INSERT INTO Activity VALUES
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down'),
(1, 1, '2019-07-20', 'end_session'),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session'),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session'),
(3, 5, '2019-07-21', 'open_session'),
(3, 5, '2019-07-21', 'scroll_down'),
(3, 5, '2019-07-21', 'end_session'),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-25', 'end_session');

SELECT * FROM Activity;

-- 1142. Average user activity in the past 30 days

SELECT COALESCE(ROUND(COUNT(DISTINCT session_id::NUMERIC)/ COUNT(DISTINCT user_id), 2), 0.00) AS avg_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN DATE '2019-07-27' - INTERVAL '29 days' AND '2019-07-27';