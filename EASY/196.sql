DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

INSERT INTO Person (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

SELECT * FROM Person;


-- 196. Delete Duplicate Emails
-- 1. self join

SELECT *
FROM Person p1
JOIN Person p2
ON p1.email = p2.email;

-- 2. filter out greater id
SELECT *
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
WHERE p1.id > p2.id;

-- 3. delete greater 

SELECT p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
WHERE p1.id > p2.id;

-- verbose delete
DELETE FROM Person p1
USING Person p2
WHERE p1.email = p2.email
AND p1.id > p2.id;

-- NOT IN syntax
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);

SELECT p1
FROM Person p1, Person p2
WHERE p1.email = p2.email
AND p1.id > p2.id;