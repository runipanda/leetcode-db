SELECT * FROM signups  ;
SELECT * FROM plans  ;
SELECT * FROM transactions  ;

-- Transactions by Billing Method and Signup ID

-- This problem focuses on joining user signup data with their transaction history and subscription plans to analyze revenue or behavior patterns based on billing frequency (e.g., monthly vs. annually) and the origin of the signup

-- Understanding the data
SELECT *
FROM transactions t
JOIN signups s USING(signup_id)
JOIN plans p USING (plan_id);

-- last 10 months data 
SELECT *
FROM transactions t
JOIN signups s USING(signup_id)
JOIN plans p USING (plan_id)
WHERE t.transaction_date <= CURRENT_DATE - INTERVAL '10 months';

-- make a group of signup_id and billing_method
SELECT signup_id, billing_method
FROM transactions t
JOIN signups s USING(signup_id)
JOIN plans p USING (plan_id)
WHERE t.transaction_date <= DATE_TRUNC('month', NOW() - INTERVAL '10 months')
GROUP BY signup_id, billing_method;

-- get the avg revenue monthly, quarterly, annually
SELECT signup_id, billing_method,
       avg(amount) AS avg_revenue
FROM transactions t
JOIN signups s USING(signup_id)
JOIN plans p USING (plan_id)
WHERE t.transaction_date <= NOW() - INTERVAL '10 months'
GROUP BY signup_id, billing_method
ORDER BY signup_id;