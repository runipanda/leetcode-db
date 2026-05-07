DROP TABLE IF EXISTS Transactions;

CREATE TABLE
  Transactions (
    transaction_id INT PRIMARY KEY,
    day TIMESTAMP,
    amount INT
  );

INSERT INTO
  Transactions (transaction_id, day, amount)
VALUES
  (8, '2021-4-3 15:57:28', 57),
  (9, '2021-4-28 08:47:25', 21),
  (1, '2021-4-29 13:28:30', 58),
  (5, '2021-4-28 16:39:57', 21),
  (6, '2021-4-29 23:39:57', 58),
  (12, '2021-4-29 00:39:57', 58),
  (4, '2021-4-3 06:49:27', 57),
  (2, '2021-4-3 12:28:30', 57);

SELECT
  *
FROM
  Transactions;

-- 1831. Maximum Transaction Each Day
WITH
  cte AS (
    SELECT
      transaction_id,
      day::date AS txn_day,
      amount
    FROM
      Transactions
  ),
  cte2 AS (
    SELECT
      *,
      MAX(amount) OVER (
        PARTITION BY
          txn_day
      ) AS max_amount
    FROM
      cte
  )
SELECT
  transaction_id
FROM
  cte2
WHERE
  amount = max_amount
ORDER BY
  transaction_id;