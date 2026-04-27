DROP TABLE IF EXISTS Days;

CREATE TABLE Days (
    day DATE PRIMARY KEY
);

INSERT INTO Days (day) VALUES
('2022-04-12'),
('2021-08-09'),
('2020-06-26');

SELECT * FROM Days;

-- 1853. Format the Date

SELECT TO_CHAR(day, 'Day,MONTH DD, YYYY') AS day
FROM Days;

-- mysql way
-- SELECT DATE_FORMAT(day, '%W, %M %e, %Y') AS day
-- FROM Days