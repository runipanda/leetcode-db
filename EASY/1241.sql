DROP TABLE IF EXISTS Submissions;

CREATE TABLE Submissions (
    sub_id INT,
    parent_id INT
);

INSERT INTO Submissions (sub_id, parent_id) VALUES (1, NULL);
INSERT INTO Submissions (sub_id, parent_id) VALUES (2, NULL);
INSERT INTO Submissions (sub_id, parent_id) VALUES (3, NULL);
INSERT INTO Submissions (sub_id, parent_id) VALUES (12, NULL);
INSERT INTO Submissions (sub_id, parent_id) VALUES (3, 1);
INSERT INTO Submissions (sub_id, parent_id) VALUES (5, 2);
INSERT INTO Submissions (sub_id, parent_id) VALUES (3, 1);
INSERT INTO Submissions (sub_id, parent_id) VALUES (4, 1);
INSERT INTO Submissions (sub_id, parent_id) VALUES (9, 1);
INSERT INTO Submissions (sub_id, parent_id) VALUES (10, 2);
INSERT INTO Submissions (sub_id, parent_id) VALUES (6, 7);

SELECT *
FROM Submissions;

-- posts    -  parent_id null
-- comments - parent_id is not null

WITH 
-- 1. find out posts
    posts AS (
    SELECT sub_id AS post_id
    FROM Submissions
    WHERE parent_id IS NULL
    ),

-- 2. find out comments and count them
    comments AS(
    SELECT parent_id, COUNT(DISTINCT sub_id) AS no_of_comments
    FROM Submissions
    WHERE parent_id IS NOT NUll
    GROUP BY parent_id
    )

-- find no of comments in each posts
    SELECT p.post_id, 
    -- CASE WHEN c.no_of_comments IS NOT NULL THEN c.no_of_comments
    -- ELSE 0 END AS no_of_comments

    COALESCE(c.no_of_comments, 0) AS no_of_comments
    FROM posts p
    LEFT JOIN comments c
    ON p.post_id = c.parent_id



