DROP TABLE IF EXISTS sf_events;

CREATE TABLE sf_events(
    account_id  VARCHAR(50),
    record_date TIMESTAMP,
    user_id     VARCHAR(50)
);

INSERT INTO sf_events(record_date, account_id, user_id) VALUES
('2021-01-01',	'A1',	'U1'),
('2021-01-01',	'A1',	'U2'),
('2021-01-06',	'A1',	'U3'),
('2021-01-02',	'A1',	'U1'),
('2020-12-24',	'A1',	'U2'),
('2020-12-08',	'A1',	'U1'),
('2020-12-09',	'A1',	'U1'),
('2021-01-10',	'A2',	'U4'),
('2021-01-11',	'A2',	'U4'),
('2021-01-12',	'A2',	'U4'),
('2021-01-15',	'A2',	'U5'),
('2020-12-17',	'A2',	'U4'),
('2020-12-25',	'A3',	'U6'),
('2020-12-25',	'A3',	'U6'),
('2020-12-25',	'A3',	'U6'),
('2020-12-06',	'A3',	'U7'),
('2020-12-06',	'A3',	'U6'),
('2021-01-14',	'A3',	'U6'),
('2021-02-07',	'A1',	'U1'),
('2021-02-10',	'A1',	'U2'),
('2021-02-01',	'A2',	'U4'),
('2021-02-01',	'A2',	'U5'),
('2020-12-05',	'A1',	'U8');

SELECT * FROM sf_events;

-- find dec users
WITH dec_2020 AS (
    SELECT account_id, user_id, 
           COUNT(user_id) OVER(PARTITION BY account_id) AS total_users
    FROM sf_events
    WHERE EXTRACT(MONTH FROM record_date) = 12
    AND EXTRACT(YEAR FROM record_date) = 2020
    GROUP BY account_id, user_id 
),

dec_retained AS (
    SELECT account_id, user_id, total_users
    FROM dec_2020
    WHERE user_id IN (
        SELECT DISTINCT user_id
        FROM sf_events
        WHERE EXTRACT(MONTH FROM record_date) = 01
        AND EXTRACT(YEAR FROM record_date) = 2021
    )
),

jan_2021 AS (
    SELECT account_id, user_id, 
           COUNT(user_id) OVER(PARTITION BY account_id) AS total_users
    FROM sf_events
    WHERE EXTRACT(MONTH FROM record_date) = 01
    AND EXTRACT(YEAR FROM record_date) = 2021
    GROUP BY account_id, user_id 
),

jan_retained AS (
    SELECT account_id, user_id, total_users
    FROM jan_2021
    WHERE user_id IN (
        SELECT DISTINCT user_id
        FROM sf_events
        WHERE EXTRACT(MONTH FROM record_date) = 02
        AND EXTRACT(YEAR FROM record_date) = 2021
    )
),

dec_ratio AS (
    SELECT account_id, 
           COUNT(user_id)::DECIMAL / MAX(total_users) AS ratio 
    FROM dec_retained
    GROUP BY account_id
),

jan_ratio AS (
    SELECT account_id, 
           COUNT(user_id)::DECIMAL / MAX(total_users) AS ratio 
    FROM jan_retained
    GROUP BY account_id
)

SELECT account_id, ratio FROM dec_ratio
UNION
SELECT account_id, ratio FROM jan_ratio;

