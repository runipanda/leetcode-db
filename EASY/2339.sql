DROP TABLE IF EXISTS Teams;

CREATE TABLE Teams (
    team_name VARCHAR(100) PRIMARY KEY
);

INSERT INTO Teams (team_name) VALUES
('Aurora FC'),
('Hazel SC'),
('Claire United');

SELECT * FROM Teams;

-- 2339. All the Matches of the League

-- cross join 
SELECT 
    a.team_name AS home_team,
    b.team_name AS away_team
FROM Teams a, Teams b
WHERE a.team_name <> b.team_name;


-- cross join explicit

SELECT
    a.team_name AS home_team,
    b.team_name AS away_team
FROM Teams a
CROSS JOIN Teams b
WHERE a.team_name <> b.team_name