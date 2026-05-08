DROP TABLE IF EXISTS winemag_p1;
DROP TABLE IF EXISTS winemag_p2;

CREATE TABLE winemag_p1 (
    id INT PRIMARY KEY,
    country VARCHAR(100),
    description TEXT,
    designation VARCHAR(255),
    points INT,
    price DECIMAL(10,2),
    province VARCHAR(100),
    region_1 VARCHAR(100),
    region_2 VARCHAR(100),
    variety VARCHAR(100),
    winery VARCHAR(100)
);

CREATE TABLE winemag_p2 (
    id INT PRIMARY KEY,
    country VARCHAR(100),
    description TEXT,
    designation VARCHAR(255),
    points INT,
    price DECIMAL(10,2),
    province VARCHAR(100),
    region_1 VARCHAR(100),
    region_2 VARCHAR(100),
    variety VARCHAR(100),
    winery VARCHAR(100)
);

INSERT INTO winemag_p1 (id, country, designation, points, price, province, winery) VALUES 
(1, 'France', 'La Louvière', 90, 45.00, 'Bordeaux', 'Château La Louvière'),
(2, 'Italy', 'Vigna d''Alceo', 95, 150.00, 'Tuscany', 'Castello dei Rampolla'),
(3, 'Georgia', 'Saperavi', 88, 20.00, 'Kakheti', 'Teliani Valley'),
(4, 'India', 'Sula Shiraz', 87, 15.00, 'Nashik', 'Sula Vineyards'),
(5, 'USA', 'Reserve', 92, 60.00, 'California', 'Robert Mondavi');

INSERT INTO winemag_p2 (id, country, designation, points, price, province, winery) VALUES 
(1, 'France', 'Cuvée Speciale', 91, 50.00, 'Champagne', 'Nicolas Feuillatte'),
(2, 'Italy', 'Classico', 89, 25.00, 'Chianti', 'Ruffino'),
(3, 'USA', 'Estate', 90, 40.00, 'Oregon', 'Willamette Valley Vineyards'),
(4, 'Spain', 'Reserva', 88, 30.00, 'Rioja', 'Marqués de Riscal');

SELECT * FROM winemag_p1;
SELECT * FROM winemag_p2;

-- 10147. Find countries that are in winemag_p1 dataset but not in winemag_p2 

SELECT DISTINCT country
FROM winemag_p1
WHERE country NOT IN(SELECT DISTINCT country FROM winemag_p2)