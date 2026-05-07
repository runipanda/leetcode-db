DROP TABLE IF EXISTS Candidates;

DROP TABLE IF EXISTS Rounds;

CREATE TABLE
  Candidates (
    candidate_id INT PRIMARY KEY,
    name VARCHAR(255),
    years_of_exp INT,
    interview_id INT
  );

CREATE TABLE
  Rounds (
    interview_id INT,
    round_id INT,
    score INT,
    PRIMARY KEY (interview_id, round_id)
  );

INSERT INTO
  Candidates (candidate_id, name, years_of_exp, interview_id)
VALUES
  (11, 'Atticus', 1, 101),
  (9, 'Ruben', 6, 104),
  (6, 'Alaric', 3, 109),
  (8, 'Juan', 5, 108);

INSERT INTO
  Rounds (interview_id, round_id, score)
VALUES
  (109, 3, 4),
  (101, 2, 8),
  (109, 4, 1),
  (108, 1, 3),
  (109, 1, 5),
  (104, 3, 6),
  (109, 2, 1),
  (104, 4, 3),
  (108, 2, 12),
  (104, 1, 2),
  (101, 1, 5),
  (104, 2, 5);

SELECT
  *
FROM
  Rounds;

-- 2041: Accepted Candidates From the Interviews
SELECT
  c.candidate_id
FROM
  Rounds r
  JOIN Candidates c ON r.interview_id = c.interview_id
WHERE
  c.years_of_exp >= 2
GROUP BY
  c.candidate_id
HAVING
  SUM(r.score) > 15