-- 1. Drop the table if it exists to start fresh
DROP TABLE IF EXISTS Problems;

-- 2. Create the table structure
CREATE TABLE Problems (
    problem_id INT PRIMARY KEY,
    likes INT,
    dislikes INT
);

-- 3. Insert sample data
INSERT INTO Problems (problem_id, likes, dislikes) VALUES
(6, 1290, 425),
(11, 2677, 8659),
(1, 4446, 2760),
(7, 8569, 6086),
(13, 2050, 4164),
(10, 9002, 7446);

SELECT * FROM Problems;

-- 2026. Quality Posts

SELECT problem_id
FROM Problems
WHERE (likes::float/(likes + dislikes)) * 100 < 60