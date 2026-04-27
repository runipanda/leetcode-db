DROP TABLE IF EXISTS Delivery;

CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 5, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-11'),
(4, 3, '2019-08-24', '2019-08-24'),
(5, 4, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13');

SELECT * FROM Delivery;

-- 1173. Immediate Food Delivery

-- customer order same day
WITH cte AS (
        SELECT customer_id, 
        CASE WHEN order_date = customer_pref_delivery_date THEN 1
        ELSE 0 END AS isimmediate
FROM Delivery
)

-- calculate its percentage
SELECT ROUND(SUM(isimmediate) * 100 / COUNT(*), 2) AS immediate_percentage
FROM cte