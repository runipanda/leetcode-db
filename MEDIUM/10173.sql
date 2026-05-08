DROP TABLE IF EXISTS us_featured_playlists;
DROP TABLE IF EXISTS worldwide_featured_playlists;

CREATE TABLE us_featured_playlists (
    id INT PRIMARY KEY,
    track_id VARCHAR(50),
    user_id VARCHAR(50),
    playlist_id VARCHAR(50),
    position INT,
    date DATE
);

CREATE TABLE worldwide_featured_playlists (
    id INT PRIMARY KEY,
    track_id VARCHAR(50),
    user_id VARCHAR(50),
    playlist_id VARCHAR(50),
    position INT,
    date DATE
);

INSERT INTO us_featured_playlists (id, track_id, user_id, playlist_id, position, date) VALUES 
(1, 't1', 'u1', 'p1', 1, '2022-01-01'),
(2, 't1', 'u1', 'p1', 1, '2022-01-02'),
(3, 't2', 'u2', 'p2', 1, '2022-01-01'),
(4, 't3', 'u3', 'p3', 2, '2022-01-01'),
(5, 't1', 'u1', 'p1', 2, '2022-01-03');

INSERT INTO worldwide_featured_playlists (id, track_id, user_id, playlist_id, position, date) VALUES 
(1, 't1', 'u1', 'p1', 1, '2022-01-01'),
(2, 't1', 'u1', 'p1', 1, '2022-01-02'),
(3, 't2', 'u2', 'p2', 2, '2022-01-01'),
(4, 't4', 'u4', 'p4', 1, '2022-01-01'),
(5, 't1', 'u1', 'p1', 1, '2022-01-03');

SELECT * FROM us_featured_playlists;
SELECT * FROM worldwide_featured_playlists;

-- 10173. Days At Number One

-- get no of playlist among usa and world
SELECT *
FROM us_featured_playlists usa
JOIN worldwide_featured_playlists world
ON usa.track_id = world.track_id
AND usa.date = world.date
WHERE usa.position = 1;

-- total no of times world position is no 1
WITH no1playlistUsaNWorld AS(
    SELECT  usa.playlist_id AS us_playlist,
        SUM(CASE WHEN world.position = 1 THEN 1 ELSE 0 END)
        OVER(PARTITION BY usa.playlist_id) AS no_days_usa_position1
    FROM us_featured_playlists usa
    JOIN worldwide_featured_playlists world
    ON usa.track_id = world.track_id
    AND usa.date = world.date
    WHERE usa.position = 1)

-- find playlist which is both no 1 in USA and WORLD

SELECT us_playlist, MAX(no_days_usa_position1) AS no_of_days_usa_position_no_1
FROM no1playlistUsaNWorld
WHERE no_days_usa_position1 <> 0
GROUP BY us_playlist
ORDER BY us_playlist 