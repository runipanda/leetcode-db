DROP TABLE IF EXISTS TeamStats;

CREATE TABLE TeamStats (
    team_id        INT PRIMARY KEY,
    team_name      VARCHAR(100),
    matches_played INT,
    wins           INT,
    draws          INT,
    losses         INT
);

INSERT INTO TeamStats VALUES
    (1, 'Manchester City', 10, 6, 2, 2),
    (2, 'Liverpool',       10, 6, 2, 2),
    (3, 'Chelsea',         10, 5, 3, 2),
    (4, 'Arsenal',         10, 4, 4, 2),
    (5, 'Tottenham',       10, 3, 5, 2);

SELECT * FROM TeamStats;

-- 3246. Premier League Table Ranking

-- rank - skiping

SELECT team_id, team_name, 
        wins * 3 + draws * 1 + losses * 0 AS points, 
        RANK() OVER(ORDER BY wins * 3 + draws * 1 + losses * 0 DESC) AS rank
FROM TeamStats
ORDER BY points DESC, team_name;


-- dense rank - no skipping 

SELECT team_id, team_name, 
        wins * 3 + draws * 1 + losses * 0 AS points,
        DENSE_RANK() OVER(ORDER BY wins * 3 + draws * 1 + losses * 0 DESC) AS rank 
FROM TeamStats
ORDER BY points DESC, team_name