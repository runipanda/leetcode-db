DROP TABLE IF EXISTS signups CASCADE;
DROP TABLE IF EXISTS plans CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;

CREATE TABLE plans (
    plan_id INTEGER PRIMARY KEY,
    billing_method VARCHAR(50),
    price DOUBLE PRECISION
);

CREATE TABLE signups (
    signup_id INTEGER PRIMARY KEY,
    signup_date TIMESTAMP WITHOUT TIME ZONE,
    plan_id INTEGER REFERENCES plans(plan_id),
    delivery_region VARCHAR(100)
);

CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    signup_id INTEGER REFERENCES signups(signup_id),
    transaction_date TIMESTAMP WITHOUT TIME ZONE,
    amount DOUBLE PRECISION
);

INSERT INTO plans (plan_id, billing_method, price) VALUES
(1, 'Monthly', 15.00),
(2, 'Annual', 120.00),
(3, 'Quarterly', 40.00);

INSERT INTO signups (signup_id, signup_date, plan_id, delivery_region) VALUES
(101, '2020-05-01 10:00:00', 1, 'San Jose'),
(102, '2020-05-02 11:30:00', 2, 'Palo Alto'),
(103, '2020-05-05 09:15:00', 1, 'Mountain View'),
(104, '2020-05-10 14:00:00', 3, 'San Jose'),
(105, '2020-05-12 16:45:00', 2, 'Palo Alto');

INSERT INTO transactions (transaction_id, signup_id, transaction_date, amount) VALUES
(5001, 101, '2020-05-01 10:05:00', 15.00),
(5002, 102, '2020-05-02 11:35:00', 120.00),
(5003, 101, '2020-06-01 10:00:00', 15.00),
(5004, 103, '2020-05-05 09:20:00', 15.00),
(5005, 104, '2020-05-10 14:10:00', 40.00),
(5006, 101, '2020-07-01 10:00:00', 15.00);