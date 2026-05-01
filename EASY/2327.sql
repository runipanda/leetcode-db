DROP TABLE IF EXISTS Olympic;

CREATE TABLE Olympic (
    country        VARCHAR(50) PRIMARY KEY,
    gold_medals    INT,
    silver_medals  INT,
    bronze_medals  INT
);

INSERT INTO Olympic VALUES
('United States',  9, 12, 10),
('South Korea',   10, 13, 12),
('China',         10, 14, 11),
('Canada',        10, 13, 11),
('Romania',        5,  4,  2);

SELECT * FROM Olympic;

-- 2327. Sort the Olympic table

SELECT *
FROM Olympic
ORDER BY gold_medals DESC, silver_medals DESC, bronze_medals DESC, country