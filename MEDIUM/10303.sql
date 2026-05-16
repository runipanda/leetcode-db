SELECT * FROM fraud_score;

-- 10303.  Top Percentile Fraud
-- We want to identify the most suspicious claims in each state. We'll consider
-- the top 5% of claims (those at or above the 95th percentile of fraud scores)
-- in each state as potentially fraudulent.  Your output should include the
-- policy number, state, claim cost, and fraud score.

SELECT *,
       NTILE(100) OVER(PARTITION BY state ORDER BY fraud_score DESC) AS percentile
FROM fraud_score;

-- 
WITH cte AS (
SELECT *,
       NTILE(100) OVER(PARTITION BY state ORDER BY fraud_score DESC) AS percentile
FROM fraud_score)

SELECT *
FROM cte
WHERE percentile <= 5
