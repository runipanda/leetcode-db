DROP TABLE IF EXISTS users_friends;
DROP TABLE IF EXISTS users_pages;

CREATE TABLE users_friends (
    user_id INT,
    friend_id INT
);

CREATE TABLE users_pages (
    user_id INT,
    page_id INT
);

INSERT INTO users_friends (user_id, friend_id) VALUES
(1, 2), (1, 3), (2, 1), (2, 4), (3, 1), (3, 4), (4, 2), (4, 3), (5, 6), (6, 5);

INSERT INTO users_pages (user_id, page_id) VALUES
(1, 10), (1, 11), (2, 10), (2, 12), (3, 13), (4, 10), (4, 11), (4, 14), (5, 15), (6, 16);

-- Adding foreign names and global data points
INSERT INTO users_friends (user_id, friend_id) VALUES
(7, 8), (8, 7); -- Mateo and Amara
INSERT INTO users_pages (user_id, page_id) VALUES
(7, 20), (8, 21); -- Mateo follows Page 20, Amara follows Page 21

-- SELECT * FROM users_friends;
-- SELECT * FROM users_pages;

-- 2081. 

-- joining friends to their followed pages

SELECT *
FROM users_friends f
JOIN users_pages p ON f.friend_id = p.user_id;

-- then using EXCEPT or a NOT EXISTS clause to remove pages the user already follows

SELECT *
FROM users_friends f
JOIN users_pages p ON f.friend_id = p.user_id
WHERE NOT EXISTS (
            SELECT *
            FROM users_pages up
            WHERE up.user_id = f.user_id
            AND up.user_id = p.page_id
)