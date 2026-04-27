DROP TABLE IF EXISTS Logins;

CREATE TABLE IF NOT EXISTS Logins (
    user_id INT,
    time_stamp TIMESTAMP
);

TRUNCATE TABLE Logins;

INSERT INTO Logins (user_id, time_stamp) 
VALUES 
    (6, '2020-06-30 15:06:07'),
    (6, '2021-04-21 14:06:06'),
    (6, '2019-03-07 00:18:15'),
    (8, '2020-02-01 05:10:53'),
    (8, '2020-12-30 00:46:50'),
    (2, '2020-01-16 02:49:50'),
    (2, '2019-08-25 07:59:08'),
    (14, '2019-07-14 09:00:00'),
    (14, '2021-01-06 11:59:59');

SELECT * FROM Logins;

-- 1890. Write a solution to report the latest login for all users in the year 2020. Do not include the users who did not login in 2020

-- 1. all 2020 logins

SELECT user_id, time_stamp
FROM Logins
WHERE EXTRACT(YEAR FROM time_stamp) = 2020;

-- 2. latest 2020 logins

SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins
WHERE time_stamp >= '2020-01-01 00:00:00'
AND   time_stamp <  '2021-01-01 00:00:00'
GROUP BY user_id