Create table If Not Exists Visits(visit_id int, customer_id int);     
Create table If Not Exists Transactions(transaction_id int, visit_id int, amount int);     
Truncate table Visits;     
insert into Visits (visit_id, customer_id) values ('1', '23');     
insert into Visits (visit_id, customer_id) values ('2', '9');     
insert into Visits (visit_id, customer_id) values ('4', '30');     
insert into Visits (visit_id, customer_id) values ('5', '54');     
insert into Visits (visit_id, customer_id) values ('6', '96');     
insert into Visits (visit_id, customer_id) values ('7', '54');     
insert into Visits (visit_id, customer_id) values ('8', '54');     
Truncate table Transactions;     
insert into Transactions (transaction_id, visit_id, amount) values ('2', '5', '310');     
insert into Transactions (transaction_id, visit_id, amount) values ('3', '5', '300');     
insert into Transactions (transaction_id, visit_id, amount) values ('9', '5', '200');     
insert into Transactions (transaction_id, visit_id, amount) values ('12', '1', '910');
insert into Transactions (transaction_id, visit_id, amount) values ('13', '2', '970');    

SELECT *
FROM Visits;
SELECT * 
FROM Transactions;

-- 1581. Customers who visited but didn't make any transactions
-- 1. Find all who have visited and have transaction
WITH cte AS(
    SELECT customer_id, transaction_id
    FROM Visits v
    LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id)

-- 2. Find all who have null transactions
   SELECT customer_id, COUNT(customer_id) AS no_of_trans
   FROM cte
   WHERE transaction_id IS NULL
   GROUP BY customer_id
   ORDER BY no_of_trans DESC