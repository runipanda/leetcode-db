DROP TABLE IF EXISTS Transactions;

CREATE TABLE Transactions (
    account_id  INT,
    day         DATE,
    type        VARCHAR(10) CHECK (type IN ('Deposit', 'Withdraw')),
    amount      INT,
    PRIMARY KEY (account_id, day)
);

INSERT INTO Transactions (account_id, day, type, amount) VALUES
(1, '2021-11-07', 'Deposit',  2000),
(1, '2021-11-09', 'Withdraw', 1000),
(1, '2021-11-11', 'Deposit',  3000),
(2, '2021-12-07', 'Deposit',  7000),
(2, '2021-12-12', 'Withdraw', 7000);

SELECT * FROM Transactions;

-- 2066. Account Balance 

WITH cte AS (SELECT *, 
        CASE WHEN type = 'Deposit' THEN amount
        ELSE -1 * amount END AS amount_with_sign
FROM Transactions)

SELECT account_id, 
       day, 
       SUM(amount_with_sign) OVER(PARTITION BY account_id ORDER BY day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS balance
FROM cte
ORDER BY account_id, day





























