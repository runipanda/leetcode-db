SELECT * FROM fb_sms_sends;

-- 10290.  SMS Confirmations BY FB

-- Find the number of phone_numbers that sent a confirmations SMS text on
-- August, 7 2020(08-07-2020). Split the counts first by country and then split
-- again by carrier. Sort by country code in ascending order.


-- flter out by date '2020-08-07' and type 'confirmation'
SELECT * 
FROM fb_sms_sends
WHERE ds = '2020-08-07';

-- 
SELECT country 
FROM fb_sms_sends
WHERE ds = '2020-08-07'
AND type = 'confirmation'
GROUP BY country;

--
SELECT DISTINCT carrier
FROM fb_sms_sends;

--
SELECT carrier 
FROM fb_sms_sends
WHERE ds = '2020-08-07'
AND type = 'confirmation'
GROUP BY carrier;

--
SELECT DISTINCT carrier
FROM fb_sms_sends;

--
SELECT carrier 
FROM fb_sms_sends
WHERE ds = '2020-08-07'
AND type = 'confirmation'
GROUP BY carrier;

--
SELECT country, carrier 
FROM fb_sms_sends
WHERE ds = '2020-08-07'
AND type = 'confirmation'
GROUP BY country, carrier
ORDER BY country;

-- count the carriers
SELECT country, 
       COUNT(CASE WHEN carrier = 'sprint' THEN phone_number ELSE NULL END) AS sprint,
       COUNT(CASE WHEN carrier = 'at&t' THEN phone_number ELSE NULL END) AS "at&t",
       COUNT(CASE WHEN carrier = 'rogers' THEN phone_number ELSE NULL END) AS rogers
FROM fb_sms_sends
WHERE ds = '2020-08-07'
AND type = 'confirmation'
GROUP BY country, carrier
ORDER BY country;