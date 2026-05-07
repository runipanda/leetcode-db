DROP TABLE IF EXISTS Stocks;

CREATE TABLE Stocks (
    stock_name    VARCHAR(15),
    operation     VARCHAR(10),
    operation_day INT,
    price         INT,
    PRIMARY KEY (stock_name, operation_day)
);

INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES
('Leetcode',  'Buy',  1,  1000),
('Corona',    'Buy',  2,  10),
('Leetcode',  'Sell', 5,  9000),
('Handbag',   'Buy',  17, 30000),
('Corona',    'Sell', 3,  1010),
('Corona',    'Buy',  4,  1020),
('Leetcode',  'Buy',  6,  1000),
('Handbag',   'Sell', 29, 7000),
('Corona',    'Sell', 10, 10000),
('Leetcode',  'Sell', 10, 10000);

SELECT * FROM Stocks;

SELECT
    stock_name,
    SUM(CASE WHEN operation = 'Sell' THEN price ELSE -price END) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;