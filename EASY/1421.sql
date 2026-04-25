DROP TABLE IF EXISTS NPV;
DROP TABLE IF EXISTS Queries;

CREATE TABLE NPV (
    id INT,
    year INT,
    npv INT,
    PRIMARY KEY (id, year)
);

INSERT INTO NPV (id, year, npv) VALUES (1, 2018, 100);
INSERT INTO NPV (id, year, npv) VALUES (7, 2020, 30);
INSERT INTO NPV (id, year, npv) VALUES (13, 2019, 40);
INSERT INTO NPV (id, year, npv) VALUES (1, 2019, 113);
INSERT INTO NPV (id, year, npv) VALUES (2, 2008, 121);
INSERT INTO NPV (id, year, npv) VALUES (3, 2009, 12);
INSERT INTO NPV (id, year, npv) VALUES (11, 2020, 99);
INSERT INTO NPV (id, year, npv) VALUES (7, 2019, 0);

CREATE TABLE Queries (
    id INT,
    year INT,
    PRIMARY KEY (id, year)
);

INSERT INTO Queries (id, year) VALUES (1, 2019);
INSERT INTO Queries (id, year) VALUES (2, 2008);
INSERT INTO Queries (id, year) VALUES (3, 2009);
INSERT INTO Queries (id, year) VALUES (7, 2018);
INSERT INTO Queries (id, year) VALUES (7, 2019);
INSERT INTO Queries (id, year) VALUES (7, 2020);
INSERT INTO Queries (id, year) VALUES (13, 2019);

SELECT * 
FROM NPV;
SELECT *
FROM Queries;

-- find npv

SELECT q.id, q.year, 
    CASE WHEN n.npv IS NOT NULL THEN n.npv 
    ELSE 0 END AS npv
FROM Queries q
LEFT JOIN NPV n
ON q.id = n.id
AND q.year = n.year