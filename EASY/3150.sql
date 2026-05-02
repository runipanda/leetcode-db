DROP TABLE IF EXISTS Tweets;

CREATE TABLE Tweets (
    tweet_id INT PRIMARY KEY,
    content  VARCHAR(500)
);

INSERT INTO Tweets VALUES
(1, 'Traveling, exploring, and living my best life @JaneSmith @SaraJohnson @LisaTaylor @MikeBrown #Foodie #Fitness #Learning'),
(2, 'Just had the best dinner with friends! #Foodie #Friends #Fun'),
(3, 'Short tweet'),
(4, 'Working hard on my new project #Work #Goals #Productivity #Fun');

SELECT * FROM Tweets;

-- 3150. Invalid Tweets
-- A tweet is invalid if:
-- length > 140, 
-- OR mentions (@) > 3, 
-- OR hashtags (#) > 3

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 140
OR   LENGTH(content) - LENGTH(REPLACE(content, '@', '')) > 3
OR   LENGTH(content) - LENGTH(REPLACE(content, '#', '')) > 3 
ORDER BY tweet_id;

