DROP TABLE IF EXISTS Calls;

CREATE TABLE Calls (
    from_id   INT,
    to_id     INT,
    duration  INT
);

INSERT INTO Calls (from_id, to_id, duration) VALUES
(1, 2,  59),
(2, 1,  11),
(1, 3,  20),
(3, 4, 100),
(3, 4, 200),
(3, 4, 200),
(4, 3, 499);

SELECT * FROM Calls;

-- 1699. Number of Calls Between Two Persons
-- case when  

WITH cte AS (SELECT duration,
    CASE WHEN from_id < to_id THEN from_id ELSE to_id END AS person1,
    CASE WHEN from_id < to_id THEN to_id   ELSE from_id END AS person2
FROM Calls)

SELECT person1, person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM cte
GROUP BY person1, person2
ORDER BY person1, person2;

-- least, greatest

SELECT 
    LEAST(from_id, to_id) AS person1,
    GREATEST(from_id, to_id) AS person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM Calls
GROUP BY LEAST(from_id, to_id), GREATEST(from_id, to_id)
ORDER BY person1, person2