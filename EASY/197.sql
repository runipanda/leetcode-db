DROP TABLE IF EXISTS Weather;

Create table If Not Exists Weather (id int, recordDate date, temperature int);
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30');

SELECT * FROM Weather;

-- 197. Rising Temperature


-- 1. self join
SELECT *
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = w2.recordDate;

-- 2. filter out greater
SELECT w1.id AS id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = w2.recordDate + INTERVAL '1 day'
WHERE w1.temperature > w2.temperature