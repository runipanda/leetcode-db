DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    person_id  INT PRIMARY KEY,
    name       VARCHAR(50),
    profession VARCHAR(20) CHECK (profession IN
                ('Doctor','Singer','Actor','Player','Engineer','Lawyer'))
);

INSERT INTO Person VALUES
(1, 'Aurora',  'Engineer'),
(2, 'Iris',    'Doctor'),
(3, 'Hazel',   'Singer'),
(4, 'Claire',  'Lawyer'),
(5, 'Elise',   'Actor'),
(6, 'Ashley',  'Player');

SELECT * FROM Person;

-- 2504 Concatenate Proffesion and Name
-- Write an SQL query to report each person's name followed by the first letter of their profession in parentheses (no spaces)

-- using concat,substring

SELECT person_id,
    CONCAT(name, '(', SUBSTRING(profession, 1, 1), ')' ) AS name
FROM Person 
ORDER BY person_id DESC;

-- using || and Left

SELECT person_id,
     name || '(' || LEFT(profession,1) || ')' AS name
FROM Person
ORDER BY person_id DESC;

-- using format and substring

SELECT person_id,
    FORMAT('%s(%s)', name, LEFT(profession, 1)) AS name
FROM Person
ORDER BY person_id DESC;
