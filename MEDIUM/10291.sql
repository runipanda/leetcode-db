SELECT * FROM fb_sms_sends ORDER BY ds;
SELECT * FROM fb_confirmers ORDER BY date;

-- 10291. SMS Confirmations From Users

-- Meta/Facebook sends SMS texts when users attempt 2FA (two-factor
-- authentication) to log in. The fb_sms_sends table logs all SMS texts sent by
-- the system.
-- However, due to an ETL issue, this table contains some invalid entries,
-- specifically, rows where type = 'confirmation' or other unrelated message
-- types (like friend requests). These records should be ignored.
-- Only rows with type = 'message' represent actual 2FA texts that were sent to
-- users.
-- Use the fb_confirmers table to identify which of these messages were
-- successfully confirmed by users.
-- Calculate the percentage of confirmed SMS 2FA messages (where type =
-- 'message') sent on August 4, 2020.

-- filter out confirmation, friend_request
-- filter out ds = '08-04-2020'
-- LEFT JOIN fb-confirmers with fb-sms-sends on phone_numbers key and date COUNT(phone_numbers) from fb_confirmers / COUNT(phone_numbers FROM fb_sms_sends)::FLOAT * 100 

SELECT *
FROM fb_sms_sends
WHERE ds = '08-04-2020';

--
SELECT *
FROM fb_confirmers
WHERE date = '08-04-2020';

--
SELECT *
FROM fb_sms_sends
WHERE type NOT IN ('confirmation' , 'friend_request');

-- 
SELECT *
FROM fb_sms_sends
WHERE type NOT IN ('confirmation' , 'friend_request')
AND ds = '08-04-2020';

-- 
SELECT *
FROM fb_sms_sends f
LEFT JOIN fb_confirmers c 
ON f.phone_number = c.phone_number AND f.ds = c.date
WHERE type NOT IN ('confirmation' , 'friend_request')
AND ds = '08-04-2020';

-- calcuate total messages on 08-04-2020
SELECT (COUNT(c.phone_number) / COUNT(f.phone_number)::FLOAT) * 100 AS percentage
FROM fb_sms_sends f
LEFT JOIN fb_confirmers c 
ON f.phone_number = c.phone_number AND f.ds = c.date
WHERE type NOT IN ('confirmation' , 'friend_request')
AND ds = '08-04-2020';

