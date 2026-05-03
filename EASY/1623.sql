DROP TABLE IF EXISTS SchoolA;
DROP TABLE IF EXISTS SchoolB;
DROP TABLE IF EXISTS SchoolC;

CREATE TABLE SchoolA (
    student_id   INT PRIMARY KEY,
    student_name VARCHAR(20)
);

CREATE TABLE SchoolB (
    student_id   INT PRIMARY KEY,
    student_name VARCHAR(20)
);

CREATE TABLE SchoolC (
    student_id   INT PRIMARY KEY,
    student_name VARCHAR(20)
);

INSERT INTO SchoolA VALUES (1, 'Alice'), (2, 'Bob');
INSERT INTO SchoolB VALUES (3, 'Tom');
INSERT INTO SchoolC VALUES (3, 'Tom'), (2, 'Jerry'), (10, 'Alice');

SELECT * FROM SchoolA, SchoolB, SchoolC;

-- 1623. All Valid Triplets That Can Represent a Country
-- cross join

SELECT a.student_name AS member_A, b.student_name AS member_B, c.student_name AS member_C
FROM SchoolA a
CROSS JOIN  SchoolB b
CROSS JOIN  SchoolC c
WHERE a.student_id  <>   b.student_id
AND a.student_name  <>   b.student_name
AND b.student_id    <>   c.student_id
AND b.student_name  <>   c.student_name
AND c.student_id    <>   a.student_id
AND c.student_name  <>   a.student_name;

-- inner join

SELECT a.student_name AS member_A, b.student_name AS member_B, c.student_name AS member_C
FROM SchoolA a
INNER JOIN SchoolB b
ON a.student_id     <> b.student_id
AND a.student_name  <> b.student_name
INNER JOIN SchoolC c
ON b.student_id     <> c.student_id
AND b.student_name  <> c.student_name
AND a.student_id    <> c.student_id
AND a.student_name  <> c.student_name