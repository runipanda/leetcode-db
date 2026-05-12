DROP TABLE IF EXISTS linkedin_customers,
                     linkedin_city,
                     linkedin_country;


CREATE TABLE linkedin_customers(business_name VARCHAR, city_id BIGINT, id BIGINT);


CREATE TABLE linkedin_city(city_name VARCHAR, country_id BIGINT, id BIGINT);


CREATE TABLE linkedin_country(country_name VARCHAR, id BIGINT);


INSERT INTO linkedin_customers(id, business_name, city_id)
VALUES (1, 'Hair Studio', 1),
       (2, 'Kosmetik Plus', 1),
       (3, 'Kosmetik Plus', 1),
       (4, 'Natural Skin', 2),
       (5, 'Kosmetik Plus', 2),
       (6, 'Natural Skin', 2),
       (7, 'Kosmetik Plus', 2),
       (8, 'Kosmetik Plus', 3),
       (9, 'Hair Studio', 3);

INSERT INTO linkedin_city(id, city_name, country_id)
VALUES (1, 'London', 1),
       (2, 'Berlin', 2),
       (3, 'Manchester', 1),
       (4, 'New York', 3);

INSERT INTO linkedin_country(id, country_name)
VALUES (1, 'UK'),
       (2, 'Germany'),
       (3, 'USA');

-- SELECT * FROM linkedin_customers;
-- SELECT * FROM linkedin_city;
-- SELECT * FROM linkedin_country;

-- 2055.  Write a query that will return all cities with more customers than the average number of customers of all cities that have at least one customer. For each such city, return the country name, the city name, and the number of customers

SELECT *
FROM linkedin_city s
LEFT JOIN linkedin_customers c
ON c.city_id = s.id;

-- 
WITH cte AS(SELECT city_name, country_id,
       COUNT(c.id) AS customers
FROM linkedin_city s
LEFT JOIN linkedin_customers c
ON c.city_id = s.id
GROUP BY city_name, country_id)

SELECT city_name, country_name, customers
FROM cte c
JOIN linkedin_country l
ON c.country_id = l.id