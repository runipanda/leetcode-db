DROP TABLE IF EXISTS FriendRequest, RequestAccepted;

CREATE TABLE FriendRequest (
    sender_id    INT,
    send_to_id   INT,
    request_date DATE
);

CREATE TABLE RequestAccepted (
    requester_id INT,
    accepter_id  INT,
    accept_date  DATE
);

INSERT INTO FriendRequest VALUES
(1, 2, '2016-06-01'),
(1, 3, '2016-06-01'),
(1, 4, '2016-06-01'),
(2, 3, '2016-06-02'),
(3, 4, '2016-06-09');

INSERT INTO RequestAccepted VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(2, 3, '2016-06-08'),
(3, 4, '2016-06-09'),
(3, 4, '2016-06-10');

SELECT * FROM FriendRequest;
SELECT * FROM RequestAccepted;

-- 597. Friend Requests I: Overall Acceptance Rate 

WITH sent AS(
    SELECT COUNT(*) total_rows
    FROM (SELECT DISTINCT sender_id, send_to_id
    FROM FriendRequest) t
),

    accepted AS(
        SELECT COUNT(*) total_rows
        FROM(SELECT DISTINCT requester_id, accepter_id
        FROM RequestAccepted) t
    )

-- cross join

    SELECT ROUND(COALESCE(s.total_rows::NUMERIC / NULLIF(a.total_rows,0), 0), 2) AS accept_rate
    FROM sent s, accepted a;


