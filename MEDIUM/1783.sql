DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Championships;

CREATE TABLE Players (
    player_id   INT PRIMARY KEY,
    player_name VARCHAR(20)
);

CREATE TABLE Championships (
    year      INT PRIMARY KEY,
    Wimbledon INT,
    Fr_open   INT,
    US_open   INT,
    Au_open   INT
);

INSERT INTO Players (player_id, player_name) VALUES
(1, 'Hazel'),
(2, 'Aurora'),
(3, 'Claire');

INSERT INTO Championships (year, Wimbledon, Fr_open, US_open, Au_open) VALUES
(2018, 1, 1, 1, 2),
(2019, 2, 1, 2, 2),
(2020, 2, 1, 1, 3);

SELECT * FROM Players;
SELECT * FROM Championships;

SELECT
    p.player_id,
    p.player_name,
    COUNT(*) AS grand_slams_count
FROM Players p
JOIN (
    SELECT Wimbledon AS player_id FROM Championships
    UNION ALL
    SELECT Fr_open              FROM Championships
    UNION ALL
    SELECT US_open              FROM Championships
    UNION ALL
    SELECT Au_open              FROM Championships
) AS all_wins ON all_wins.player_id = p.player_id
GROUP BY p.player_id, p.player_name;