DROP TABLE IF EXISTS NewYork;
DROP TABLE IF EXISTS California;

CREATE TABLE NewYork (
    student_id INT PRIMARY KEY,
    score      INT
);

CREATE TABLE California (
    student_id INT PRIMARY KEY,
    score      INT
);

INSERT INTO NewYork VALUES
(1, 90),
(2, 87);

INSERT INTO California VALUES
(2, 89),
(3, 88);

-- 2072. University Winner
-- Excellent student who scores more than 90

WITH ny AS(
    SELECT 'NewYork' AS university, COUNT(student_id) AS std
    FROM NewYork
    WHERE score >= 90),

   cal AS(
    SELECT 'California' AS university, COUNT(student_id) AS std
    FROM California
    WHERE score >= 90
)

SELECT CASE WHEN n.std > c.std THEN n.university ELSE c.university END AS university,
       CASE WHEN n.std > c.std THEN n.std ELSE c.std END AS students
FROM ny n
CROSS JOIN cal c

-- SELECT * FROM n
-- UNION ALL
-- SELECT * FROM cal;