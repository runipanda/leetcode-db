DROP TABLE IF EXISTS winemag_p1;

CREATE TABLE winemag_p1 (
    id INT PRIMARY KEY,
    country VARCHAR(100),
    description TEXT,
    designation VARCHAR(255),
    points INT,
    price DECIMAL(10,2),
    province VARCHAR(100),
    region_1 VARCHAR(100),
    region_2 VARCHAR(100),
    variety VARCHAR(100),
    winery VARCHAR(100)
);

INSERT INTO winemag_p1 (id, country, price, region_1, region_2, variety) VALUES 
(1, 'France', 45.00, 'Bordeaux', 'Southwest France', 'Merlot'),
(2, 'France', 15.00, 'Bordeaux', NULL, 'Sauvignon Blanc'),
(3, 'USA', 60.00, 'Napa Valley', 'Central Coast', 'Cabernet Sauvignon'),
(4, 'USA', 20.00, 'Napa Valley', NULL, 'Chardonnay'),
(5, 'Italy', 150.00, 'Tuscany', 'Chianti', 'Sangiovese'),
(6, 'Italy', 40.00, 'Tuscany', NULL, 'Pinot Grigio'),
(7, 'USA', 35.00, 'Central Coast', 'Willamette Valley', 'Pinot Noir'),
(8, 'France', 80.00, 'Southwest France', NULL, 'Malbec'),
(9, 'India', 18.00, 'Nashik', 'Maharashtra', 'Shiraz'),
(10, 'India', 12.00, 'Nashik', NULL, 'Chenin Blanc');

SELECT * FROM winemag_p1;

-- 10041. Most Expensive And Cheapest Wine 

WITH getAllRegion AS (
    SELECT region_1 AS region, variety, price
    FROM winemag_p1
    UNION ALL
    SELECT region_2 AS region, variety, price
    FROM winemag_p1),

    filteredNotNullRegionNPrice AS (
    SELECT region,
           variety,
           price
    FROM getAllRegion
    WHERE region IS NOT NULL
    AND price IS NOT NULL
    ),

    rankedASExpensiveNCheap AS (
    SELECT region, variety, price,
           RANK() OVER(PARTITION BY region ORDER BY price DESC) AS expensive_rank,
           RANK() OVER(PARTITION BY region ORDER BY price) AS cheap_rank
    FROM filteredNotNullRegionNPrice),

    filteredMostExpensiveAndCheapest AS (
    SELECT region,
        CASE WHEN expensive_rank = 1 THEN variety END AS most_expensive,
        CASE WHEN cheap_rank = 1 THEN variety END AS cheapest
    FROM rankedASExpensiveNCheap
    WHERE expensive_rank = 1 OR cheap_rank = 1
    )

    SELECT region,
           MAX(most_expensive) AS most_expensive,
           MAX(cheapest) AS cheapest
    FROM filteredMostExpensiveAndCheapest
    GROUP BY 1
    ORDER BY 1