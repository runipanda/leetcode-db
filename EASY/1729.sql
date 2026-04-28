DROP TABLE IF EXISTS Followers;
Create table If Not Exists Followers(user_id int, follower_id int);
Truncate table Followers;
insert into Followers (user_id, follower_id) values ('0', '1');
insert into Followers (user_id, follower_id) values ('1', '0');
insert into Followers (user_id, follower_id) values ('2', '0');
insert into Followers (user_id, follower_id) values ('2', '1');

SELECT * FROM Followers;

-- 1729. Find Followers Count

-- 1. Group by
SELECT user_id, COUNT(*)
FROM Followers
GROUP BY user_id;

-- 2. order by
SELECT user_id, COUNT(*)
FROM Followers
GROUP BY user_id
ORDER BY user_id