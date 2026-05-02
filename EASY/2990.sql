DROP TABLE IF EXISTS Loans;

CREATE TABLE Loans (
    loan_id   INT PRIMARY KEY,
    user_id   INT,
    loan_type VARCHAR(50)
);

INSERT INTO Loans VALUES
(683, 101, 'Mortgage'),
(218, 101, 'AutoLoan'),
(802, 101, 'Inschool'),
(593, 102, 'Mortgage'),
(138, 102, 'Refinance'),
(294, 102, 'Inschool'),
(308, 103, 'Refinance'),
(389, 104, 'Mortgage');

SELECT * FROM Loans;

-- 2990. Loans Types
-- Find users who have both a Mortgage AND a Refinance loan

-- having count
SELECT user_id
FROM Loans
WHERE loan_type IN ('Refinance', 'Mortgage')
GROUP BY user_id
HAVING COUNT(DISTINCT loan_type) = 2
ORDER BY user_id;

-- filter
SELECT user_id
FROM Loans
GROUP BY user_id
HAVING COUNT(*) FILTER (WHERE loan_type = 'Refinance') > 0
   AND COUNT(*) FILTER (WHERE loan_type = 'Mortgage')  > 0
ORDER BY user_id;

-- intersect
SELECT user_id FROM Loans WHERE loan_type = 'Refinance'
INTERSECT
SELECT user_id FROM Loans WHERE loan_type = 'Mortgage'
ORDER BY user_id;