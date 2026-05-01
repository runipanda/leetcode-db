DROP TABLE IF EXISTS TVProgram;
DROP TABLE IF EXISTS Content;

CREATE TABLE TVProgram (
    program_date TIMESTAMP,
    content_id   INT,
    channel      VARCHAR(50),
    PRIMARY KEY (program_date, content_id)
);

CREATE TABLE Content (
    content_id   INT PRIMARY KEY,
    title        VARCHAR(100),
    Kids_content CHAR(1),
    content_type VARCHAR(50)
);

INSERT INTO TVProgram VALUES
('2020-06-10 08:00', 1, 'LC-Channel'),
('2020-05-11 12:00', 2, 'LC-Channel'),
('2020-05-12 12:00', 3, 'LC-Channel'),
('2020-05-13 14:00', 4, 'Disney Ch'),
('2020-06-18 14:00', 4, 'Disney Ch'),
('2020-07-15 16:00', 5, 'Disney Ch');

INSERT INTO Content VALUES
(1, 'Leetcode Movie', 'N', 'Movies'),
(2, 'Alg. for Kids',  'Y', 'Series'),
(3, 'Database Sols',  'N', 'Series'),
(4, 'Aladdin',        'Y', 'Movies'),
(5, 'Cinderella',     'Y', 'Movies');


SELECT * FROM TVProgram;
SELECT * FROM Content;

-- 1495. Friendly movies streamed last month
-- Find kid movies streamed in june 2020

SELECT DISTINCT(c.title)
FROM TVProgram t
LEFT JOIN Content c
ON t.content_id = c.content_id
WHERE c.Kids_content = 'Y'
AND c.content_type = 'Movies'
AND EXTRACT(YEAR FROM program_date)  = 2020
AND EXTRACT(MONTH FROM program_date) = 6