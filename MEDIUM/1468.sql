DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
    company_id    INT,
    employee_id   INT,
    employee_name VARCHAR(50),
    salary        INT,
    PRIMARY KEY (company_id, employee_id)
);

INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES
(1,  1,  'Aurora',    2000),
(1,  2,  'Iris',     21300),
(1,  3,  'Hazel',    10800),
(2,  1,  'Claire',     300),
(2,  7,  'Elise',      450),
(2,  9,  'Ashley',     700),
(3,  7,  'Rose',       100),
(3,  2,  'Vivienne',  2200),
(3,  13, 'Celeste',   3300),
(3,  15, 'Odette',    7777);

SELECT * FROM Salaries;

-- 1468. Calculate Salaries

WITH tax_rates AS (
    SELECT
        company_id,
        CASE
            WHEN MAX(salary) < 1000            THEN 0.00
            WHEN MAX(salary) BETWEEN 1000 AND 10000 THEN 0.24
            ELSE                                    0.49
        END AS tax_rate
    FROM Salaries
    GROUP BY company_id
)

SELECT
    s.company_id,
    s.employee_id,
    s.employee_name,
    ROUND(s.salary * (1 - t.tax_rate)) AS salary
FROM Salaries s
JOIN tax_rates t ON s.company_id = t.company_id
ORDER BY s.company_id, s.employee_id;