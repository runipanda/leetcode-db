DROP TABLE IF EXISTS Purchases;

CREATE TABLE Purchases (
    user_id    INT,
    time_stamp TIMESTAMP,
    amount     INT,
    PRIMARY KEY (user_id, time_stamp)
);

INSERT INTO Purchases VALUES
(1, '2022-04-20 09:03:00', 4416),
(2, '2022-03-19 07:22:00', 678),
(3, '2022-03-19 10:00:00', 4121),
(4, '2022-04-18 13:00:00', 2000);

SELECT * FROM Purchases;

-- 2205. The Number of Users That Are Eligible for Discount 

CREATE OR REPLACE FUNCTION get_User_IDs(
    startDate DATE,
    endDate   DATE,
    minAmount INT
)
RETURNS INT
LANGUAGE sql AS
$$
    SELECT COUNT(DISTINCT user_id)::INT
    FROM Purchases
    WHERE time_stamp BETWEEN startDate::TIMESTAMP
                         AND endDate::TIMESTAMP
      AND amount >= minAmount;
$$;

SELECT get_User_IDs('2022-03-19', '2022-04-20', 2000);