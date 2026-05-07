DROP TABLE IF EXISTS Scores;

CREATE TABLE Scores (
    player_name  VARCHAR(20),
    gender       CHAR(1),
    day          DATE,
    score_points INT,
    PRIMARY KEY (gender, day)
);

INSERT INTO Scores (player_name, gender, day, score_points) VALUES
('Hazel',  'F', '2020-01-01', 12),
('Claire', 'F', '2020-01-02', 10),
('Aurora', 'F', '2020-01-04', 13),
('Iris',   'F', '2020-01-05', 9),
('Elise',  'M', '2020-01-01', 11),
('Ashley', 'M', '2020-01-02', 15),
('Elise',  'M', '2020-01-04', 14),
('Ashley', 'M', '2020-01-05', 8);

SELECT * FROM Scores;

-- 1308. 

SELECT
    gender,
    day,
    SUM(score_points) OVER (
        PARTITION BY gender
        ORDER BY day
    ) AS total
FROM Scores
ORDER BY gender, day;