DROP TABLE IF EXISTS twitch_sessions;

CREATE TABLE twitch_sessions (
    user_id INT,
    session_start TIMESTAMP,
    session_end TIMESTAMP,
    session_id INT,
    session_type VARCHAR(10)
);

INSERT INTO twitch_sessions (user_id, session_start, session_end, session_id, session_type) VALUES
(101, '2026-01-01 08:00:00', '2026-01-01 09:00:00', 1, 'viewer'),
(101, '2026-01-02 10:00:00', '2026-01-02 11:00:00', 2, 'streamer'),
(102, '2026-01-01 12:00:00', '2026-01-01 13:00:00', 3, 'streamer'),
(102, '2026-01-03 14:00:00', '2026-01-03 15:00:00', 4, 'viewer'),
(103, '2026-01-05 09:00:00', '2026-01-05 10:00:00', 5, 'viewer'),
(103, '2026-01-06 09:00:00', '2026-01-06 10:00:00', 6, 'viewer'),
(104, '2026-01-01 07:00:00', '2026-01-01 08:00:00', 7, 'viewer'),
(104, '2026-01-01 08:30:00', '2026-01-01 09:30:00', 8, 'streamer'),
(105, '2026-01-10 15:00:00', '2026-01-10 16:00:00', 9, 'streamer');

SELECT * FROM twitch_sessions;

-- 2012. Viewers turned streamers

WITH user_first_session AS (
    SELECT 
        user_id, 
        session_type,
        RANK() OVER (PARTITION BY user_id ORDER BY session_start ASC) as session_rank
    FROM twitch_sessions
)

SELECT DISTINCT user_id
FROM twitch_sessions
WHERE session_type = 'streamer'
    AND user_id IN (
    SELECT user_id 
    FROM user_first_session 
    WHERE session_rank = 1 AND session_type = 'viewer'
);