DROP TABLE IF EXISTS Confirmations;
DROP TABLE IF EXISTS Signups;

CREATE TABLE Signups (
    user_id    INT PRIMARY KEY,
    time_stamp TIMESTAMP NOT NULL
);

CREATE TABLE Confirmations (
    user_id    INT       NOT NULL REFERENCES Signups(user_id),
    time_stamp TIMESTAMP NOT NULL,
    action     VARCHAR(10) NOT NULL CHECK (action IN ('confirmed','timeout')),
    PRIMARY KEY (user_id, time_stamp)
);

INSERT INTO Signups VALUES
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');

INSERT INTO Confirmations VALUES
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-01-06 03:37:45', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 11:57:30', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-01-23 00:00:00', 'timeout'),
(6, '2021-10-23 14:14:14', 'confirmed'),
(6, '2021-10-24 14:14:13', 'timeout');

SELECT * FROM Signups;
SELECT * FROM Confirmations;

-- 1939. Users that Actively Request Confirmations Messages
-- within 24 hours time frame

SELECT DISTINCT *
FROM Confirmations c
JOIN Confirmations e
ON c.user_id = e.user_id
ORDER BY c.user_id;


SELECT DISTINCT c.user_id
FROM Confirmations c
JOIN Confirmations e
ON c.user_id = e.user_id
AND c.time_stamp > e.time_stamp
AND c.time_stamp - e.time_stamp <= INTERVAL '24 hours'
ORDER BY c.user_id;

-- using window functions

SELECT *,
    lead(time_stamp) over(PARTITION BY user_id ORDER BY time_stamp) AS next_time
FROM Confirmations;

WITH cte AS(
SELECT *, 
    lead(time_stamp)  over(PARTITION BY user_id ORDER BY time_stamp) as next_time
FROM Confirmations 
)

SELECT user_id
FROM cte 
WHERE next_time BETWEEN time_stamp AND time_stamp + INTERVAL '24 HOURS';