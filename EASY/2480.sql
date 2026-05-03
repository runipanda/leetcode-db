DROP TABLE IF EXISTS Elements;

CREATE TABLE Elements (
    symbol    VARCHAR(5) PRIMARY KEY,
    type      VARCHAR(10) CHECK (type IN ('Metal', 'Nonmetal', 'Noble')),
    electrons INT
);

INSERT INTO Elements VALUES
('La', 'Metal',    57),
('Ca', 'Metal',    20),
('Na', 'Metal',    11),
('Cl', 'Nonmetal', 17),
('O',  'Nonmetal',  8),
('N',  'Nonmetal',  7),
('He', 'Noble',     0),
('Ne', 'Noble',     0);

SELECT * FROM Elements;

-- 2480. Form a chemical bond

SELECT *
FROM (SELECT symbol AS metal
    FROM Elements 
    WHERE type = 'Metal') AS m

    CROSS JOIN 
    
    (SELECT symbol AS nonmetal
    FROM Elements
    WHERE type = 'Nonmetal') AS nm;
