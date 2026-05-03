DROP TABLE IF EXISTS books;

CREATE TABLE books (
    book_id        INT PRIMARY KEY,
    title          VARCHAR(100),
    author         VARCHAR(100),
    published_year INT,
    rating         DECIMAL(3, 1)
);

INSERT INTO books VALUES
    (1, 'The Great Gatsby',       'F. Scott Fitzgerald', 1925, 4.5),
    (2, 'To Kill a Mockingbird',  'Harper Lee',          1960, NULL),
    (3, 'Pride and Prejudice',    'Jane Austen',         1813, 4.8),
    (4, 'The Catcher in the Rye', 'J.D. Salinger',       1951, NULL),
    (5, 'Brave New World',        'Aldous Huxley',       1932, 4.1);

SELECT * FROM books;

-- 3358. Books with NULL Ratings

SELECT book_id, title, author, published_year
FROM Books
WHERE rating IS NULL
ORDER BY book_id;
