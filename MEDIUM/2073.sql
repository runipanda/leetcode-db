DROP TABLE IF EXISTS user_sessions, post_views;
CREATE TABLE user_sessions (
    session_id BIGINT,    -- bigint
    user_id VARCHAR(50),
    session_starttime TIMESTAMP WITHOUT TIME ZONE,
    session_endtime TIMESTAMP WITHOUT TIME ZONE,
    platform VARCHAR(255)
);

CREATE TABLE post_views (
    perc_viewed DOUBLE PRECISION, -- double precision
    post_id     BIGINT,
    session_id  BIGINT    -- bigint
);


INSERT INTO user_sessions(
    session_id,
    user_id,
    session_starttime,
    session_endtime,
    platform
) VALUES 

(1,	'U1',	'2020-01-01 12:14:28',	'2020-01-01 12:16:08',	'Windows'),
(2,	'U1',	'2020-01-01 18:23:50',	'2020-01-01 18:24:00',	'Windows'),
(3,	'U1',	'2020-01-01 08:15:00',	'2020-01-01 08:20:00',	'IPhone'),
(4,	'U2',	'2020-01-01 10:53:10',	'2020-01-01 10:53:30',	'IPhone'),
(5,	'U2',	'2020-01-01 18:25:14',	'2020-01-01 18:27:53',	'IPhone'),
(6,	'U2',	'2020-01-01 11:28:13',	'2020-01-01 11:31:33',	'Windows'),
(7,	'U3',	'2020-01-01 06:46:20',	'2020-01-01 06:58:13',	'Android'),
(8,	'U3',	'2020-01-01 10:53:10',	'2020-01-01 10:53:50',	'Android'),
(9,	'U3',	'2020-01-01 13:13:13',	'2020-01-01 13:34:34',	'Windows'),
(10,'U4',	'2020-01-01 08:12:00',	'2020-01-01 12:23:11',	'Windows'),
(11,'U4',	'2020-01-01 21:54:03',	'2020-01-01 21:54:04',	'IPad');

INSERT INTO post_views (
    session_id,
    post_id,
    perc_viewed
) VALUES 

(1,	1,	2),
(1,	2,	4),
(1,	3,	1),
(2,	1,	20),
(2,	2,	10),
(2,	3,	10),
(2,	4,	21),
(3,	2,	1),
(3,	4,	1),
(4,	2,	50),
(4,	3,	10),
(6,	2,	2),
(8,	2,	5),
(8,	3,	2.5);

SELECT * FROM user_sessions;
SELECT * FROM post_views;

-- 2073.The column 'perc_viewed' in the table 'post_views' denotes the percentage of the session duration time the user spent viewing a post. Using it, calculate the total time that each post was viewed by users. Output post ID and the total viewing time in seconds, but only for posts with a total viewing time of over 5 seconds 


-- 1. filter out total viewing time greater than 5
-- viewing time -  starttime - endtime * perc_viewed / 100 
-- total viewing time - SUM(viewingtime) 

WITH perUserDuration AS(
    SELECT session_id,
       EXTRACT(EPOCH FROM (session_endtime - session_starttime)) AS duration
    FROM user_sessions),

    totalDuration AS(
    SELECT p.post_id,
           SUM((t.duration * p.perc_viewed)/ 100)::float AS total_duration
    FROM post_views p
    JOIN perUserDuration t ON p.session_id = t.session_id
    GROUP BY p.post_id)

    SELECT post_id
    FROM totalDuration
    WHERE total_duration > 5