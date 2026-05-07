DROP TABLE IF EXISTS Logs;

CREATE TABLE Logs (
    log_id INT PRIMARY KEY
);

INSERT INTO Logs (log_id) VALUES
    (1), (2), (3), (7), (8), (10);

SELECT * FROM Logs;

-- 1285. Find the Start and End Number of Continuous Ranges

WITH cte AS(
    SELECT log_id,
       log_id - ROW_NUMBER() OVER(ORDER BY log_id) AS diff
    FROM Logs)

SELECT MIN(log_id) AS start_id,
       MAX(log_id) AS end_id
FROM cte
GROUP BY diff
ORDER BY start_id