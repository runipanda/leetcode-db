DROP TABLE IF EXISTS emails, texts;

CREATE TABLE emails (
    email_id    INT,
    user_id     INT,
    signup_date TIMESTAMP,
    PRIMARY KEY (email_id, user_id)
);

CREATE TABLE texts (
    text_id       INT,
    email_id      INT,
    signup_action VARCHAR(20),
    action_date   TIMESTAMP,
    PRIMARY KEY (text_id, email_id)
);

INSERT INTO emails VALUES
(125, 7771, '2022-06-14 09:30:00'),
(433, 1052, '2022-07-09 08:15:00'),
(234, 7005, '2022-08-20 10:00:00');

INSERT INTO texts VALUES
(1, 125, 'Verified',     '2022-06-15 08:30:00'),
(2, 433, 'Not Verified', '2022-07-10 10:45:00'),
(4, 234, 'Verified',     '2022-08-21 09:30:00');

SELECT * FROM emails, texts;

-- 3172. Second Day Verification
SELECT e.*, t.signup_action, t.action_date
FROM emails e
JOIN texts t USING (email_id)
WHERE t.signup_action = 'Verified'
AND t.action_date::DATE - e.signup_date::DATE = 1
ORDER BY user_id