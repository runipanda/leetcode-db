DROP TABLE IF EXISTS Rides;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name    VARCHAR(50)
);

CREATE TABLE Rides (
    ride_id  INT PRIMARY KEY,
    user_id  INT REFERENCES Users(user_id),
    distance INT
);

INSERT INTO Users VALUES
(17, 'Aurora'),
(14, 'Hazel'),
(4,  'Claire'),
(2,  'Iris'),
(10, 'Elise');

INSERT INTO Rides VALUES
(72, 17, 160),
(42, 14, 161),
(45, 4,  59),
(32, 2,  197),
(15, 4,  357),
(56, 2,  196),
(10, 14, 25);

SELECT * FROM Rides, Users;

-- 2837. Total Travelled Distance

SELECT u.user_id, u.name, COALESCE(SUM(r.distance), 0) traveled_distance
FROM Users u
LEFT JOIN Rides r USING (user_id)
GROUP BY u.user_id, u.name
ORDER BY u.user_id