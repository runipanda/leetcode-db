DROP TABLE IF EXISTS Candidates;

CREATE TABLE Candidates (
    candidate_id INT,
    skill        VARCHAR(50),
    PRIMARY KEY (candidate_id, skill)
);

INSERT INTO Candidates VALUES
(123, 'Python'),
(234, 'R'),
(123, 'Tableau'),
(123, 'PostgreSQL'),
(234, 'PowerBI'),
(234, 'SQL Server'),
(147, 'Python'),
(147, 'Tableau'),
(147, 'Java'),
(147, 'PostgreSQL'),
(256, 'Tableau'),
(102, 'DataAnalysis');

SELECT * FROM Candidates;

--3051. Find Candidates for Data Science Position

SELECT *
FROM Candidates
ORDER BY candidate_id;

-- count
SELECT candidate_id
FROM Candidates
WHERE skill IN ('Python', 'PostgreSQL', 'Tableau')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;

-- filter
SELECT candidate_id
FROM Candidates
GROUP BY candidate_id
HAVING COUNT(*) FILTER(WHERE skill = 'Python') > 0
AND    COUNT(*) FILTER(WHERE skill = 'PostgreSQL') > 0
AND    COUNT(*) FILTER(WHERE skill = 'Tableau') > 0
ORDER BY candidate_id;

-- intersection
SELECT candidate_id FROM Candidates WHERE skill = 'Python'
INTERSECT
SELECT candidate_id FROM Candidates WHERE skill = 'PostgreSQL'
INTERSECT
SELECT candidate_id FROM Candidates WHERE skill = 'Tableau'
ORDER BY candidate_id;