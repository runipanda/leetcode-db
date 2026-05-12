DROP TABLE IF EXISTS yelp_business;

CREATE TABLE yelp_business (
    business_id VARCHAR(50),
    stars DECIMAL,
    city VARCHAR(100),
    name VARCHAR(100),
    neighborhood VARCHAR(100),
    address VARCHAR(255),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    latitude DECIMAL,
    longitude DECIMAL,
    review_count INT,
    is_open INT,
    categories VARCHAR(255)
);

INSERT INTO yelp_business (business_id, name, city, stars) VALUES
('b1', 'Sanjay Tasty Sweets', 'Ahmedabad', 5),
('b2', 'Elena Fine Dining', 'St. Petersburg', 5),
('b3', 'Arun Hardware', 'Ahmedabad', 5),
('b4', 'Hiroshi Sushi', 'Kyoto', 5),
('b5', 'Amara Boutique', 'Nairobi', 5),
('b6', 'Sanjay Cafe', 'Ahmedabad', 5),
('b7', 'Elena Salon', 'St. Petersburg', 5),
('b8', 'Kyoto Crafts', 'Kyoto', 5),
('b9', 'Nairobi Coffee', 'Nairobi', 5),
('b10', 'Mumbai Spice', 'Mumbai', 5),
('b11', 'Delhi Delight', 'Delhi', 5),
('b12', 'Delhi Tech', 'Delhi', 5),
('b13', 'Luca Pizza', 'Rome', 5),
('b14', 'Mateo Tacos', 'Mexico City', 5),
('b15', 'Yuki Tea', 'Kyoto', 5),
('b16', 'Kofi Grill', 'Accra', 5),
('b17', 'Saanvi Yoga', 'Bengaluru', 5),
('b18', 'Saanvi Cafe', 'Bengaluru', 5),
('b19', 'Hans Bakery', 'Berlin', 5),
('b20', 'Lars Fishing', 'Oslo', 5),
('b21', 'Fatima Textiles', 'Cairo', 4), -- Not 5 stars
('b22', 'Jean Bistro', 'Paris', 3);    -- Not 5 stars

-- SELECT * FROM yelp_business ORDER BY stars;

-- 10148 - Find the top 5 cities with the highest number of 5-star businesses.
-- The output should include the city name and the total count of 5-star businesses in that city, considering both open and closed businesses. If two or more cities have the same number of 5-star businesses, assign them the same rank, and skip the next rank accordingly. For example, if two cities tie for 1st place, the following city should be ranked 3rd.

-- filter all 5 stars cities
WITH cte AS (SELECT *
FROM yelp_business
WHERE stars = 5),

-- aggregate same cities and give them rank
cte2 AS(SELECT city, 
        COUNT(*) AS total_stars, 
        RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
FROM cte
GROUP BY city
)

SELECT city, rnk
FROM cte2
WHERE rnk <= 5;

-- dense rank
WITH cte3 AS (SELECT *
FROM yelp_business
WHERE stars = 5),

cte4 AS (SELECT city, 
       COUNT(*) AS total_stars,
       DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
FROM cte3
GROUP BY city)

SELECT city, rnk
FROM cte4
WHERE rnk <= 5