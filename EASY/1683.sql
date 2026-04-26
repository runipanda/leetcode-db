Create table If Not Exists Tweets(tweet_id int, content varchar(50));
Truncate table Tweets;
insert into Tweets (tweet_id, content) values ('1', 'Let us Code');
insert into Tweets (tweet_id, content) values ('2', 'More than fifteen chars are here!');

SELECT *
FROM Tweets;

-- 1683. if a tweet length is greater than 15 then that tweet was invalid
-- 1. check length
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;