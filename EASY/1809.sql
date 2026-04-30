DROP TABLE IF EXISTS Playback;
DROP TABLE IF EXISTS Ads;

CREATE TABLE Playback (
    session_id  INT PRIMARY KEY,
    customer_id INT,
    start_time  INT,
    end_time    INT
);

CREATE TABLE Ads (
    ad_id       INT PRIMARY KEY,
    customer_id INT,
    timestamp   INT
);

INSERT INTO Playback VALUES
(1, 1,  1,  5),
(2, 1, 15, 23),
(3, 2, 10, 12),
(4, 2, 17, 28),
(5, 2,  2,  8);

INSERT INTO Ads VALUES
(1, 1,  5),
(2, 2, 17),
(3, 2, 20);

SELECT * FROM Playback;
SELECT * FROM Ads;

-- 1809. Find Ad - Free Sessions or no adds sessions

-- 1. simple version 
-- find the range of time

SELECT *
FROM Playback p
LEFT JOIN Ads a
ON p.customer_id = a.customer_id
AND a.timestamp BETWEEN p.start_time AND p.end_time;

-- filter out null values

SELECT session_id
FROM Playback p
LEFT JOIN Ads a
ON p.customer_id = a.customer_id
AND a.timestamp BETWEEN p.start_time AND p.end_time
WHERE a.customer_id IS NULL;

-- 2. Find add more than two

SELECT session_id 
FROM Playback p
LEFT JOIN Ads a
ON p.customer_id = a.customer_id 
AND a.timestamp BETWEEN p.start_time AND p.end_time
GROUP BY session_id
HAVING COUNT(*) = 2;