DROP TABLE IF EXISTS players_results;

CREATE TABLE players_results (
    player_id BIGINT,
    match_date DATE,
    match_result VARCHAR(10) -- 'W' for Win, 'L' for Loss
);

INSERT INTO players_results (player_id, match_date, match_result) VALUES
(401, '2021-05-04', 'W'),
(401, '2021-05-09', 'L'),
(401, '2021-05-16', 'L'),
(401, '2021-05-18', 'W'),
(401, '2021-05-22', 'L'),
(401, '2021-06-15', 'L'),
(401, '2021-06-16', 'W'),
(401, '2021-06-18', 'W'),
(401, '2021-07-06', 'L'),
(401, '2021-07-13', 'L'),
(402, '2021-05-14', 'L'),
(402, '2021-05-23', 'L'),
(402, '2021-05-24', 'W'),
(402, '2021-06-01', 'W'),
(402, '2021-06-02', 'W'),
(402, '2021-07-01', 'W'),
(402, '2021-07-11', 'W'),
(402, '2021-07-20', 'L'),
(402, '2021-07-26', 'L'),
(402, '2021-07-30', 'L'),
(403, '2021-05-03', 'L'),
(403, '2021-05-11', 'W'),
(403, '2021-05-12', 'W'),
(403, '2021-05-13', 'W'),
(403, '2021-05-20', 'W'),
(403, '2021-05-25', 'W'),
(403, '2021-07-06', 'L'),
(403, '2021-07-15', 'L'),
(403, '2021-07-22', 'W'),
(403, '2021-07-23', 'W'),
(404, '2021-05-10', 'W'),
(404, '2021-05-16', 'W'),
(404, '2021-05-20', 'W'),
(404, '2021-05-22', 'W'),
(404, '2021-05-28', 'L'),
(404, '2021-06-06', 'L'),
(404, '2021-06-14', 'W'),
(404, '2021-07-25', 'W'),
(404, '2021-07-26', 'L'),
(405, '2021-05-07', 'L'),
(405, '2021-05-25', 'L'),
(405, '2021-06-06', 'L'),
(405, '2021-06-07', 'L'),
(405, '2021-06-14', 'L'),
(405, '2021-07-01', 'L'),
(405, '2021-07-02', 'L'),
(405, '2021-07-14', 'W'),
(405, '2021-07-16', 'L'),
(405, '2021-07-30', 'L');

SELECT * FROM players_results;

-- 2059. Player With Longest Streak 
-- You are given a table of tennis players and their matches that they could either win (W) or lose (L). Find the longest streak of wins. A streak is a set of consecutive won matches of one player. The streak ends once a player loses their next match. For this question, disregard edge cases such as: players who never lose, streaks that start before the first loss, and streaks that continue after the final match.

--  diffrence of rownumber
WITH StreakGroups AS (
    SELECT 
        player_id,
        match_result,
        ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY match_date) - 
        ROW_NUMBER() OVER (PARTITION BY player_id, match_result ORDER BY match_date) AS streak_id
    FROM players_results
),

-- filter W streak id
WinStreaks AS (
    SELECT 
        player_id, 
        COUNT(*) AS streak_length
    FROM StreakGroups
    WHERE match_result = 'W'
    GROUP BY player_id, streak_id
)

-- find the maximum
SELECT 
    player_id, 
    MAX(streak_length) AS longest_streak
FROM WinStreaks
GROUP BY player_id
ORDER BY longest_streak DESC;