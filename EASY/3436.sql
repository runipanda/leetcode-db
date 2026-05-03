DROP TABLE IF EXISTS Users CASCADE;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    email   VARCHAR(255)
);

INSERT INTO Users VALUES
    (1, 'alice@example.com'),
    (2, 'bob_at_example.com'),
    (3, 'charlie@example.net'),
    (4, 'david@domain.com'),
    (5, 'eve@invalid');

-- 3436. Find Valid Emails - RegEXp

SELECT *
FROM Users
WHERE REGEXP_LIKE(email, '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$')
ORDER BY user_id;

-- postgres specific
SELECT *
FROM Users
WHERE email ~ '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$'