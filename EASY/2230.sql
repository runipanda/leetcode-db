DROP TABLE IF EXISTS Purchases;

CREATE TABLE Purchases (
    user_id    INT,
    time_stamp TIMESTAMP,
    amount     INT,
    PRIMARY KEY (user_id, time_stamp)
);

INSERT INTO Purchases VALUES
(1, '2022-04-20 09:03:00', 4416),
(2, '2022-03-19 19:24:02', 678),
(3, '2022-03-18 12:03:09', 4523),
(3, '2022-03-30 09:43:42', 626);

SELECT * FROM Purchases;

-- 2230. Users that are eligible for discounts

DROP FUNCTION IF EXISTS getUserIDs(DATE, DATE, INTEGER);

CREATE OR REPLACE FUNCTION getUserIDs(
    startDate DATE,
    endDate   DATE,
    minAmount INT
)
RETURNS TABLE(user_id INT)
LANGUAGE sql AS
$$
    SELECT DISTINCT user_id
    FROM Purchases
    WHERE time_stamp BETWEEN startDate::TIMESTAMP
                         AND endDate::TIMESTAMP
      AND amount >= minAmount
    ORDER BY user_id;
$$;

SELECT * FROM getUserIDs('2022-03-03', '2022-03-20', 1000);