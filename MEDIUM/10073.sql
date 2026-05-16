SELECT * FROM  airbnb_reviews;
SELECT * FROM  airbnb_hosts ORDER BY host_id;

-- 10073. Favorite Host Nationality

-- For each guest reviewer, find the nationality of the reviewer’s favorite host
-- based on the guest’s highest review score given to a host. Output the user ID
-- of the guest along with their favorite host’s nationality. In case there is
-- more than one favorite host from the same country, list that country only
-- once (remove duplicates).  Both the from_user and to_user columns are user
-- IDs. 

-- Formulate the Approach
-- filter reviews by guests (from type = "guest")
-- find the max(reveiew_score) by from_user
-- join the above query to the airbnb_reviews and grab the host_id that received the max(review_score)
-- join the above query to airbnb_hosts and grab nationality
-- output user_id and nationality of host

-- from_user -> guest_id
-- to_user   -> host_id

SELECT *
FROM airbnb_reviews
WHERE from_type = 'guest';

--
WITH cte AS (
    SELECT 
        from_user, 
        MAX(review_score) AS max_score
    FROM airbnb_reviews
    WHERE from_type = 'guest'
    GROUP BY from_user
)

SELECT DISTINCT
    c.from_user AS guest_id,
    h.nationality
FROM cte c
JOIN airbnb_reviews a
    ON c.from_user = a.from_user 
   AND c.max_score = a.review_score
JOIN airbnb_hosts h 
    ON a.to_user = h.host_id
WHERE a.from_type = 'guest'
ORDER BY guest_id;