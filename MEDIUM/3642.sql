DROP TABLE IF EXISTS reading_sessions;
DROP TABLE IF EXISTS books;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(100),
    pages INT
);

CREATE TABLE reading_sessions (
    session_id INT PRIMARY KEY,
    book_id INT,
    reader_name VARCHAR(255),
    pages_read INT,
    session_rating INT
);

INSERT INTO books (book_id, title, author, genre, pages) VALUES 
(1, 'The Great Gatsby', 'F. Scott', 'Fiction', 180),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 281),
(3, '1984', 'George Orwell', 'Dystopian', 328),
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', 432),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 277);

INSERT INTO reading_sessions (session_id, book_id, reader_name, pages_read, session_rating) VALUES 
(1, 1, 'Alice', 50, 5), (2, 1, 'Bob', 60, 1), (3, 1, 'Carol', 40, 4), (4, 1, 'David', 30, 2), (5, 1, 'Emma', 45, 5),
(6, 2, 'Frank', 80, 4), (7, 2, 'Grace', 70, 4), (8, 2, 'Henry', 90, 5), (9, 2, 'Ivy', 60, 4), (10, 2, 'Jack', 75, 4),
(11, 3, 'Kate', 100, 2), (12, 3, 'Liam', 120, 1), (13, 3, 'Mia', 80, 2), (14, 3, 'Noah', 90, 1), (15, 3, 'Olivia', 110, 4), (16, 3, 'Paul', 95, 5),
(17, 4, 'Quinn', 150, 3), (18, 4, 'Ruby', 140, 3),
(19, 5, 'Sam', 80, 1), (20, 5, 'Tara', 70, 2);

-- 3642. Find Books with Polarized opinions

WITH cte AS (SELECT book_id,
    COUNT(session_id) AS no_of_sessions,
    (MAX(session_rating) - MIN(session_rating)) AS rating_spread,
    ROUND(SUM(CASE WHEN session_rating <= 2 OR session_rating >= 4 
    THEN 1 ELSE 0 END)/ COUNT(session_id), 2) AS polarization_score,
    SUM(CASE WHEN session_rating <= 2 THEN 1 ELSE 0 END) AS two_or_more, 
    SUM(CASE WHEN session_rating >= 4 THEN 1 ELSE 0 END) AS four_or_more
FROM reading_sessions
GROUP BY book_id)

SELECT b.*, cte.rating_spread, cte.polarization_score
FROM cte
LEFT JOIN books b
ON cte.book_id = b.book_id
WHERE cte.num_no_of_sessions >= 5
AND cte.four_or_more >= 1
AND cte.two_or_more  >= 1
AND cte.polarization_score >= 0.6
ORDER BY cte.polarization_score DESC, b.title DESC







