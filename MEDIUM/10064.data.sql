DROP TABLE IF EXISTS fb_eu_energy;
DROP TABLE IF EXISTS fb_na_energy;
DROP TABLE IF EXISTS fb_asia_energy;

CREATE TABLE fb_eu_energy (
    date date,
    consumption int
);

CREATE TABLE fb_na_energy (
    date date,
    consumption int
);

CREATE TABLE fb_asia_energy (
    date date,
    consumption int
);

-- EU Data
INSERT INTO fb_eu_energy (date, consumption) VALUES
('2020-01-01', 400), ('2020-01-02', 350), ('2020-01-03', 500),
('2020-01-04', 300), ('2020-01-05', 450), ('2020-01-06', 600),
('2020-01-07', 500), ('2020-01-08', 300), ('2020-01-09', 200),
('2020-01-10', 400);

-- NA Data
INSERT INTO fb_na_energy (date, consumption) VALUES
('2020-01-01', 250), ('2020-01-02', 375), ('2020-01-03', 600),
('2020-01-04', 500), ('2020-01-05', 200), ('2020-01-06', 700),
('2020-01-07', 300), ('2020-01-08', 800), ('2020-01-09', 400),
('2020-01-10', 100);

-- Asia Data
INSERT INTO fb_asia_energy (date, consumption) VALUES
('2020-01-01', 400), ('2020-01-02', 400), ('2020-01-03', 650),
('2020-01-04', 550), ('2020-01-05', 300), ('2020-01-06', 800),
('2020-01-07', 400), ('2020-01-08', 500), ('2020-01-09', 600),
('2020-01-10', 350);