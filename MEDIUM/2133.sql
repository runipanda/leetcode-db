DROP TABLE IF EXISTS videos_watched;

CREATE TABLE videos_watched(
    user_id VARCHAR(50),
    video_id VARCHAR(50),
    watched_at TIMESTAMP WITHOUT TIME ZONE
);

INSERT INTO videos_watched(user_id, video_id, watched_at) VALUES
('uid01',	'vid004',	'2022-08-01 07:00:00'),
('uid02',	'vid002',	'2022-08-01 07:00:00'),
('uid03',	'vid003',	'2022-08-01 07:00:00'),
('uid05',	'vid005',	'2022-08-01 07:00:00'),
('uid02',	'vid004',	'2022-08-01 09:00:00'),
('uid03',	'vid002',	'2022-08-01 10:00:00'),
('uid02',	'vid003',	'2022-08-01 12:00:00'),
('uid03',	'vid004',	'2022-08-01 13:00:00'),
('uid04',	'vid001',	'2022-08-01 17:00:00'),
('uid07',	'vid002',	'2022-08-01 20:00:00'),
('uid08',	'vid003',	'2022-08-02 07:00:00'),
('uid10',	'vid002',	'2022-08-02 07:00:00'),
('uid08',	'vid005',	'2022-08-02 10:00:00'),
('uid06',	'vid004',	'2022-08-02 14:00:00'),
('uid09',	'vid002',	'2022-08-02 16:00:00'),
('uid08',	'vid004',	'2022-08-02 17:00:00'),
('uid10',	'vid003',	'2022-08-02 18:00:00'),
('uid10',	'vid004',	'2022-08-02 22:00:00'),
('uid01',	'vid002',	'2022-08-03 09:00:00'),
('uid01',	'vid005',	'2022-08-03 10:00:00'),
('uid01',	'vid001',	'2022-08-03 12:00:00'),
('uid04',	'vid003',	'2022-08-04 07:00:00'),
('uid05',	'vid004',	'2022-08-04 09:00:00'),
('uid04',	'vid001',	'2022-08-04 13:00:00'),
('uid05',	'vid003',	'2022-08-04 22:00:00'),
('uid09',	'vid004',	'2022-08-05 07:00:00'),
('uid07',	'vid002',	'2022-08-05 10:00:00'),
('uid09',	'vid005',	'2022-08-05 10:00:00'),
('uid07',	'vid003',	'2022-08-05 17:00:00'),
('uid04',	'vid005',	'2022-08-10 06:00:00'),
('uid03',	'vid001',	'2022-08-10 07:00:00'),
('uid02',	'vid006',	'2022-08-10 10:00:00'),
('uid03',	'vid005',	'2022-08-10 10:00:00'),
('uid02',	'vid001',	'2022-08-10 12:30:00'),
('uid01',	'vid003',	'2022-08-10 14:30:00'),
('uid01',	'vid005',	'2022-08-10 17:00:00'),
('uid01',	'vid006',	'2022-08-12 07:00:00'),
('uid02',	'vid005',	'2022-08-12 07:00:00'),
('uid05',	'vid003',	'2022-08-12 12:00:00'),
('uid03',	'vid006',	'2022-08-12 13:00:00'),
('uid04',	'vid002',	'2022-08-12 22:00:00'),
('uid09',	'vid001',	'2022-08-13 07:00:00'),
('uid10',	'vid002',	'2022-08-13 08:00:00'),
('uid09',	'vid005',	'2022-08-13 15:00:00'),
('uid10',	'vid004',	'2022-08-13 19:00:00'),
('uid04',	'vid004',	'2022-08-13 22:00:00'),
('uid08',	'vid002',	'2022-08-14 07:00:00'),
('uid09',	'vid006',	'2022-08-15 07:00:00'),
('uid03',	'vid007',	'2022-08-15 08:00:00'),
('uid07',	'vid003',	'2022-08-15 14:00:00'),
('uid10',	'vid001',	'2022-08-15 20:00:00');

SELECT * FROM videos_watched;

-- 2133. First Three Most Watched Videos.  
-- After a new user creates an account and starts watching videos, the user ID, video ID, and date watched are captured in the database. Find the top 3 videos most users have watched as their first 3 videos. Output the video ID and the number of times it has been watched as the users' first 3 videos. In the event of a tie, output all the videos in the top 3 that users watched as their first 3 videos.

-- user_id, video_id, date watched - find each user top 3 videos and number of times videos watched


SELECT TO_CHAR(order_placed_time, 'YYYY-MM') AS YEAR_MONTH,
delivery
