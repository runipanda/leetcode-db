DROP TABLE IF EXISTS Cities;

CREATE TABLE Cities (
    state VARCHAR(100),
    city  VARCHAR(100),
    PRIMARY KEY (state, city)
);

INSERT INTO Cities VALUES
('Alabama',        'Birmingham'),
('Alabama',        'Montgomery'),
('Alabama',        'Huntsville'),
('Alabama',        'Mobile'),
('Alabama',        'Tuscaloosa'),

('Alaska',         'Anchorage'),
('Alaska',         'Fairbanks'),
('Alaska',         'Juneau'),
('Alaska',         'Sitka'),
('Alaska',         'Ketchikan'),

('Arizona',        'Phoenix'),
('Arizona',        'Tucson'),
('Arizona',        'Mesa'),
('Arizona',        'Chandler'),
('Arizona',        'Scottsdale'),

('Arkansas',       'Little Rock'),
('Arkansas',       'Fort Smith'),
('Arkansas',       'Fayetteville'),
('Arkansas',       'Springdale'),
('Arkansas',       'Jonesboro'),

('California',     'Los Angeles'),
('California',     'San Francisco'),
('California',     'San Diego'),
('California',     'San Jose'),
('California',     'Sacramento'),

('Colorado',       'Denver'),
('Colorado',       'Colorado Springs'),
('Colorado',       'Aurora'),
('Colorado',       'Fort Collins'),
('Colorado',       'Boulder'),

('Connecticut',    'Bridgeport'),
('Connecticut',    'New Haven'),
('Connecticut',    'Hartford'),
('Connecticut',    'Stamford'),
('Connecticut',    'Waterbury'),

('Florida',        'Miami'),
('Florida',        'Orlando'),
('Florida',        'Tampa'),
('Florida',        'Jacksonville'),
('Florida',        'Fort Lauderdale'),

('Georgia',        'Atlanta'),
('Georgia',        'Augusta'),
('Georgia',        'Columbus'),
('Georgia',        'Savannah'),
('Georgia',        'Athens'),

('Hawaii',         'Honolulu'),
('Hawaii',         'Pearl City'),
('Hawaii',         'Hilo'),
('Hawaii',         'Kailua'),
('Hawaii',         'Waipahu'),

('Illinois',       'Chicago'),
('Illinois',       'Aurora'),
('Illinois',       'Naperville'),
('Illinois',       'Joliet'),
('Illinois',       'Rockford'),

('Indiana',        'Indianapolis'),
('Indiana',        'Fort Wayne'),
('Indiana',        'Evansville'),
('Indiana',        'South Bend'),
('Indiana',        'Carmel'),

('Iowa',           'Des Moines'),
('Iowa',           'Cedar Rapids'),
('Iowa',           'Davenport'),
('Iowa',           'Sioux City'),
('Iowa',           'Iowa City'),

('Kansas',         'Wichita'),
('Kansas',         'Overland Park'),
('Kansas',         'Kansas City'),
('Kansas',         'Topeka'),
('Kansas',         'Olathe'),

('Kentucky',       'Louisville'),
('Kentucky',       'Lexington'),
('Kentucky',       'Bowling Green'),
('Kentucky',       'Owensboro'),
('Kentucky',       'Covington'),

('Louisiana',      'New Orleans'),
('Louisiana',      'Baton Rouge'),
('Louisiana',      'Shreveport'),
('Louisiana',      'Metairie'),
('Louisiana',      'Lafayette'),

('Massachusetts',  'Boston'),
('Massachusetts',  'Worcester'),
('Massachusetts',  'Springfield'),
('Massachusetts',  'Cambridge'),
('Massachusetts',  'Lowell'),

('Michigan',       'Detroit'),
('Michigan',       'Grand Rapids'),
('Michigan',       'Warren'),
('Michigan',       'Sterling Heights'),
('Michigan',       'Ann Arbor'),

('Minnesota',      'Minneapolis'),
('Minnesota',      'Saint Paul'),
('Minnesota',      'Rochester'),
('Minnesota',      'Duluth'),
('Minnesota',      'Bloomington'),

('Missouri',       'Kansas City'),
('Missouri',       'Saint Louis'),
('Missouri',       'Springfield'),
('Missouri',       'Columbia'),
('Missouri',       'Independence'),

('Nevada',         'Las Vegas'),
('Nevada',         'Henderson'),
('Nevada',         'Reno'),
('Nevada',         'North Las Vegas'),
('Nevada',         'Sparks'),

('New Jersey',     'Newark'),
('New Jersey',     'Jersey City'),
('New Jersey',     'Trenton'),
('New Jersey',     'Paterson'),
('New Jersey',     'Elizabeth'),

('New York',       'New York City'),
('New York',       'Buffalo'),
('New York',       'Rochester'),
('New York',       'Yonkers'),
('New York',       'Syracuse'),

('North Carolina', 'Charlotte'),
('North Carolina', 'Raleigh'),
('North Carolina', 'Greensboro'),
('North Carolina', 'Durham'),
('North Carolina', 'Winston-Salem'),

('Ohio',           'Columbus'),
('Ohio',           'Cleveland'),
('Ohio',           'Cincinnati'),
('Ohio',           'Toledo'),
('Ohio',           'Akron'),

('Oregon',         'Portland'),
('Oregon',         'Salem'),
('Oregon',         'Eugene'),
('Oregon',         'Gresham'),
('Oregon',         'Hillsboro'),

('Pennsylvania',   'Philadelphia'),
('Pennsylvania',   'Pittsburgh'),
('Pennsylvania',   'Allentown'),
('Pennsylvania',   'Erie'),
('Pennsylvania',   'Reading'),

('Texas',          'Houston'),
('Texas',          'Dallas'),
('Texas',          'Austin'),
('Texas',          'San Antonio'),
('Texas',          'Fort Worth'),

('Virginia',       'Virginia Beach'),
('Virginia',       'Norfolk'),
('Virginia',       'Chesapeake'),
('Virginia',       'Richmond'),
('Virginia',       'Arlington'),

('Washington',     'Seattle'),
('Washington',     'Spokane'),
('Washington',     'Tacoma'),
('Washington',     'Vancouver'),
('Washington',     'Bellevue');

-- SELECT * FROM Cities;

SELECT state,
    STRING_AGG(city, ' , ' ORDER BY city) AS city
FROM Cities
GROUP BY state
ORDER BY state