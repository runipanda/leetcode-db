
DROP TABLE IF EXISTS Users;

Create table If Not Exists Users (user_id int, name varchar(40));
Truncate table Users;
insert into Users (user_id, name) values ('1', 'aLice');
insert into Users (user_id, name) values ('2', 'bOB');

SELECT * FROM Users;

-- 1667. Fix the name

SELECT user_id, 
       CONCAT(UPPER(SUBSTRING(name,1,1)), 
              LOWER(SUBSTRING(name, 2, LENGTH(name) - 1))) AS name
FROM Users