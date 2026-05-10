DROP TABLE IF EXISTS cookbook_titles;

CREATE TABLE cookbook_titles (
    page_number INTEGER,
    title       VARCHAR(255)
);

INSERT INTO cookbook_titles (page_number, title) VALUES
(0,  ''),
(1,'Scrambled eggs'),
(2,'Fondue'),
(3,'Sandwich'),
(4,'Tomato soup'),
(6,'Liver'),
(11,'Fried duck'),
(12,'Boiled duck'),
(15,'Baked chicken');

-- 2089. Cookbook Recipes
-- 

SELECT * FROM cookbook_titles;

-- Step 1 :- generate series

SELECT MAX(page_number)
FROM cookbook_titles;

-- get last page
WITH getLastPage AS (
    SELECT MAX(page_number) AS max_p 
    FROM cookbook_titles
),

-- get series
listPageNumber AS (
    SELECT n AS page_number
    FROM generate_series(0, (SELECT max_p FROM getLastPage)) AS n
),

-- get title
getTitleNPageNo AS (SELECT 
    s.page_number,
    c.title 
FROM listPageNumber s
LEFT JOIN cookbook_titles c ON s.page_number = c.page_number)

-- calculate left page number
SELECT (page_number / 2) * 2 AS left_page_number,
    string_agg(CASE WHEN page_number % 2 = 0 THEN title END, ' ') AS left_title,
    string_agg(CASE WHEN page_number % 2 = 1 THEN title END, ' ') AS right_title
FROM getTitleNPageNo
GROUP BY left_page_number
ORDER BY left_page_number
