CREATE TABLE IF NOT EXISTS Countries (
    country_id INT,
    country_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Weather (
    country_id INT,
    weather_state INT,
    day DATE
);

TRUNCATE TABLE Countries;
TRUNCATE TABLE Weather;

INSERT INTO Countries (country_id, country_name) VALUES
(1, 'China'),
(2, 'India'),
(3, 'USA');

INSERT INTO Weather (country_id, weather_state, day) VALUES
(1, 15, '2019-11-01'),
(1, 18, '2019-11-02'),
(1, 20, '2019-11-03'),
(1, 16, '2019-10-01'),
(1, 19, '2019-10-02'),
(1, 22, '2019-10-03'),
(2, 25, '2019-11-01'),
(2, 28, '2019-11-02'),
(2, 30, '2019-11-03'),
(2, 26, '2019-10-01'),
(2, 30, '2019-10-02'),
(2, 31, '2019-10-03'),
(3, 10, '2019-11-01'),
(3, 12, '2019-11-02'),
(3, 14, '2019-11-03'),
(3, 12, '2019-10-01'),
(3, 14, '2019-10-02'),
(3, 16, '2019-10-03');

SELECT * 
FROM Countries;

SELECT * 
FROM Weather;

--1294. Find the average weather in the month of november on 2019
-- Step 1. Join Two tables

SELECT *
FROM Countries c
LEFT JOIN Weather w
ON c.country_id = w.country_id;

-- Filter out month and year

SELECT *
FROM Countries c
LEFT JOIN Weather w
ON c.country_id = w.country_id
WHERE EXTRACT(MONTH FROM day) = 11
AND EXTRACT(YEAR FROM day) = 2019;

-- remove duplicates - compute average

SELECT c.country_name, 
       CASE WHEN AVG(w.weather_state) < 15 THEN 'Cold'
            WHEN AVG(w.weather_state) >= 25 THEN 'Hot'
            ELSE 'Warm' END AS weather_type
FROM Countries c
LEFT JOIN Weather w
ON c.country_id = w.country_id
WHERE EXTRACT(MONTH FROM day) = 11
AND EXTRACT(YEAR FROM day) = 2019
GROUP BY c.country_name;