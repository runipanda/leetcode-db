DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Register;

Create table If Not Exists Users (user_id int, user_name varchar(20));
Create table If Not Exists Register (contest_id int, user_id int);
Truncate table Users;
insert into Users (user_id, user_name) values ('6', 'Alice');
insert into Users (user_id, user_name) values ('2', 'Bob');
insert into Users (user_id, user_name) values ('7', 'Alex');
Truncate table Register;
insert into Register (contest_id, user_id) values ('215', '6');
insert into Register (contest_id, user_id) values ('209', '2');
insert into Register (contest_id, user_id) values ('208', '2');
insert into Register (contest_id, user_id) values ('210', '6');
insert into Register (contest_id, user_id) values ('208', '6');
insert into Register (contest_id, user_id) values ('209', '7');
insert into Register (contest_id, user_id) values ('209', '7');
insert into Register (contest_id, user_id) values ('215', '7');
insert into Register (contest_id, user_id) values ('208', '7');
insert into Register (contest_id, user_id) values ('210', '2');
insert into Register (contest_id, user_id) values ('207', '2');
insert into Register (contest_id, user_id) values ('210', '7');
insert into Register (contest_id, user_id) values ('210', '6');

SELECT * FROM Users;
SELECT * FROM Register;

-- 1633. Percentage of Users Ateended a contest

--1.Group rows to find user attended a contest
SELECT contest_id, COUNT(*)
FROM Register
GROUP BY contest_id;

--2. find total count
SELECT COUNT(*) AS total
FROM Users;

-- 3. calculate percentage
SELECT contest_id, ROUND(COUNT(*):: NUMERIC / (SELECT COUNT(*) FROM Users) * 100, 2) AS percen
FROM Register
GROUP BY contest_id
ORDER BY percen DESC, contest_id 