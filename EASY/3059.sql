DROP TABLE IF EXISTS Emails;

CREATE TABLE Emails (
    id INT,
    email VARCHAR(255)
);

INSERT INTO Emails (id, email) VALUES 
(1, 'alice@gmail.com'),
(2, 'bob@yahoo.com'),
(3, 'charlie@gmail.com'),
(4, 'david@hotmail.com'),
(5, 'eve@gmail.com'),
(6, 'frank@yahoo.com'),
(7, 'grace@outlook.com');

SELECT * FROM Emails;

-- 3059. Find Unique email domains

-- filter out .com
SELECT *
FROM Emails
WHERE email ~ '^[a-z0-9]+@[a-z0-9]+(\.com)$';

-- extract everything after @ and count

SELECT SUBSTR(email, POSITION('@' IN email) + 1) AS email_domain,
       COUNT(*) AS count
FROM Emails
WHERE email ~ '^[a-z0-9]+@[a-z0-9]+(\.com)$'
GROUP BY email_domain
ORDER BY email_domain

