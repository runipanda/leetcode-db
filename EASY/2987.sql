DROP TABLE IF EXISTS Listings;

CREATE TABLE Listings (
    listing_id INT PRIMARY KEY,
    city       VARCHAR(50),
    price      INT
);

INSERT INTO Listings VALUES
(113, 'LosAngeles',   7560386),
(136, 'SanFrancisco', 2380268),
(92,  'Chicago',      9833209),
(60,  'Chicago',      5147582),
(8,   'Chicago',      5274441),
(79,  'SanFrancisco', 8372065),
(37,  'Chicago',      7939595),
(53,  'LosAngeles',   4965123),
(178, 'SanFrancisco', 999207),
(51,  'NewYork',      5951718),
(121, 'NewYork',      2893760);

SELECT * FROM Listings;

-- 2987. Expensive Cities
-- Cities where the city average price > national average price

WITH cte AS(
SELECT *, AVG(price) OVER() AS national_avg,
       AVG(price) OVER(PARTITION BY city) AS city_avg
FROM Listings)

SELECT DISTINCT city
FROM cte
WHERE city_avg > national_avg
ORDER BY city