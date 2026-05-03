DROP TABLE IF EXISTS Bikes;

CREATE TABLE Bikes (
    ride_id     INT PRIMARY KEY,
    bike_number VARCHAR(20),
    start_time  TIMESTAMP,
    end_time    TIMESTAMP
);

INSERT INTO Bikes VALUES
(1, 'W00576', '2012-03-25 11:30:00', '2012-03-25 12:40:00'),
(2, 'W00300', '2012-03-25 10:30:00', '2012-03-25 10:50:00'),
(3, 'W00455', '2012-03-26 14:30:00', '2012-03-26 17:40:00'),
(4, 'W00576', '2012-03-26 13:30:00', '2012-03-26 14:00:00'),
(5, 'W00455', '2012-03-25 09:30:00', '2012-03-25 10:30:00');

SELECT * FROM Bikes;

-- 2687 Bike last time used

SELECT bike_number, MAX(end_time) AS end_time
FROM Bikes
GROUP BY bike_number
ORDER BY bike_number DESC