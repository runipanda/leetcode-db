Create table If Not Exists Students (student_id int, student_name varchar(20));
Create table If Not Exists Subjects (subject_name varchar(20));
Create table If Not Exists Examinations (student_id int, subject_name varchar(20));
Truncate table Students;
insert into Students (student_id, student_name) values ('1', 'Alice');
insert into Students (student_id, student_name) values ('2', 'Bob');
insert into Students (student_id, student_name) values ('13', 'John');
insert into Students (student_id, student_name) values ('6', 'Alex');
Truncate table Subjects;
insert into Subjects (subject_name) values ('Math');
insert into Subjects (subject_name) values ('Physics');
insert into Subjects (subject_name) values ('Programming');
Truncate table Examinations;
insert into Examinations (student_id, subject_name) values ('1', 'Math');
insert into Examinations (student_id, subject_name) values ('1', 'Physics');
insert into Examinations (student_id, subject_name) values ('1', 'Programming');
insert into Examinations (student_id, subject_name) values ('2', 'Programming');
insert into Examinations (student_id, subject_name) values ('1', 'Physics');
insert into Examinations (student_id, subject_name) values ('1', 'Math');
insert into Examinations (student_id, subject_name) values ('13', 'Math');
insert into Examinations (student_id, subject_name) values ('13', 'Programming');
insert into Examinations (student_id, subject_name) values ('13', 'Physics');
insert into Examinations (student_id, subject_name) values ('2', 'Math');
insert into Examinations (student_id, subject_name) values ('1', 'Math');

SELECT *
FROM Students;
SELECT * 
FROM Subjects;
SELECT * 
FROM Examinations;

-- 1280. Find students and no of times attended exams with respectives subjects
-- cross join - students and subjects in one table
WITH 
    cte AS(
    SELECT *
    FROM Students
    CROSS JOIN Subjects
),

-- group students with respective no of exams taken
    cte2 AS(
    SELECT student_id, subject_name, COUNT(subject_name) AS count
    FROM Examinations
    GROUP BY student_id, subject_name
)

SELECT s.student_id, s.student_name, s.subject_name, 
       CASE WHEN count IS NOT NULL THEN count
       ELSE 0 END AS attended_exams
FROM cte s
LEFT JOIN cte2 c
ON s.student_id = c.student_id
AND s.subject_name = c.subject_name
ORDER BY c.student_id, c.subject_name