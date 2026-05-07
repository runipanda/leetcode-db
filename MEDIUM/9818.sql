DROP TABLE IF EXISTS google_file_store;

CREATE TABLE google_file_store (
    filename VARCHAR(50),
    contents TEXT
);

INSERT INTO google_file_store (filename, contents) VALUES
('final.txt', 'Zebra'),
('final.txt', 'Apple'),
('final.txt', 'banana'),
('final.txt', 'cherry'),
('final.txt', 'Date'),
('other.txt', 'Ignore'),
('final.txt', 'Kavita'),
('final.txt', 'Yuki'),
('final.txt', 'Lukas'),
('final.txt', 'Amara'),
('draft1.txt',	'The stock exchange predicts a bull market which would make many investors happy.'),
('draft2.txt',	'The stock exchange predicts a bull market which would make many investors happy, but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market.'),
('final.txt',	'The stock exchange predicts a bull market which would make many investors happy, but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market. As always predicting the future market is an uncertain game and all investors should follow their instincts and best practices.');

SELECT * FROM google_file_store;
-- The stock exchange predicts a bull market which would make many investors happy, but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market. As always predicting the future market is an uncertain game and all investors should follow their instincts and best practices.

-- 9818. File Content Shuffle

SELECT LOWER(contents) AS contents,
       'wacky.txt' AS filename
FROM google_file_store
WHERE filename = 'final.txt'
ORDER BY contents;

-- another way
SELECT 
    LOWER(words) AS contents,
    'wacky.txt' AS filename
FROM (
    SELECT regexp_split_to_table(contents, '\s+') AS words
    FROM google_file_store
    WHERE filename = 'final.txt'
) AS word_list
ORDER BY contents;


-- stratascratch way
-- 1. filter out -  final.txt

SELECT *
    FROM google_file_store
    WHERE filename ILIKE 'final%';

-- 2. convert string to arrays in rows as words

SELECT string_to_array(CONTENTS, ' ') AS word
    FROM google_file_store
    WHERE filename ILIKE 'final%'
    ORDER BY word;

-- 3. convert back arrays to string t columns

SELECT UNNEST(string_to_array(CONTENTS, ' ')) AS word
    FROM google_file_store
    WHERE filename ILIKE 'final%'
    ORDER BY word;

-- 4. convert to lower case

SELECT lower(word) AS CONTENTS
FROM 
(SELECT UNNEST(string_to_array(CONTENTS, ' ')) AS word
    FROM google_file_store
    WHERE filename ILIKE 'final%'
    ORDER BY word) base;

-- 5. output wacky.txt as filename

SELECT 'wacky.txt' AS filename,
        lower(word) AS CONTENTS
FROM
(SELECT UNNEST(string_to_array(CONTENTS, ' ')) AS word
    FROM google_file_store
    WHERE filename ILIKE 'final%'
    ORDER BY word) base;

-- 6. convert to array

SELECT array_agg(lower(word)) AS CONTENTS,
       'wacky.txt' AS filename
FROM
(SELECT UNNEST(string_to_array(CONTENTS, ' ')) AS word
    FROM google_file_store
    WHERE filename ILIKE 'final%'
    ORDER BY word) base;

-- 7. convert array to string

SELECT array_to_string(array_agg(lower(word)), ' ') AS CONTENTS,
       'wacky.txt' AS filename
FROM
(SELECT UNNEST(string_to_array(CONTENTS, ' ')) AS word
    FROM google_file_store
    WHERE filename ILIKE 'final%'
    ORDER BY word) base;