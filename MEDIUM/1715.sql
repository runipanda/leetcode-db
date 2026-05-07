DROP TABLE IF EXISTS Boxes;

DROP TABLE IF EXISTS Chests;

CREATE TABLE
  Chests (
    chest_id INT PRIMARY KEY,
    apple_count INT,
    orange_count INT
  );

CREATE TABLE
  Boxes (
    box_id INT PRIMARY KEY,
    chest_id INT,
    apple_count INT,
    orange_count INT
    -- FOREIGN KEY (chest_id) REFERENCES Chests (chest_id)
  );

INSERT INTO
  Boxes (box_id, chest_id, apple_count, orange_count)
VALUES
  (2, NULL, 6, 15),
  (18, 14, 4, 15),
  (19, 3, 8, 4),
  (12, 2, 19, 20),
  (20, NULL, 12, 9),
  (8, 6, 9, 9);

INSERT INTO
  Chests (chest_id, apple_count, orange_count)
VALUES
  (6, 5, 6),
  (14, 20, 10),
  (2, 8, 8),
  (3, 19, 4),
  (16, 19, 19);

-- 1715. Count Apples and Oranges
SELECT
  SUM(b.apple_count + COALESCE(c.apple_count, 0)) AS apple_count,
  SUM(b.orange_count + COALESCE(c.orange_count, 0)) AS orange_count
FROM
  Boxes b
  LEFT JOIN Chests c ON b.chest_id = c.chest_id;