DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id bigint PRIMARY KEY,
    first_name text,
    last_name text,
    city text,
    address text,
    phone_number text
);

CREATE TABLE orders (
    id bigint PRIMARY KEY,
    cust_id bigint REFERENCES customers(id),
    order_date date,
    order_details text,
    total_order_cost bigint
);

-- 1. POPULATE CUSTOMERS TABLE
INSERT INTO customers (id, first_name, last_name, city, address, phone_number) VALUES
(1, 'Mark', 'Thomas', 'Arizona', '4476 Parkway Drive', '602-993-5916'),
(2, 'Mona', 'Adrian', 'Los Angeles', '1958 Peck Court', '714-409-9432'),
(3, 'Farida', 'Joseph', 'San Francisco', '3153 Rhapsody Street', '813-368-1200'),
(4, 'William', 'Daniel', 'Denver', '4470 McKinley Avenue', '813-368-1200'),
(5, 'Henry', 'Jackson', 'Miami', '1299 Randall Drive', '808-601-7513'),
(6, 'Jack', 'Aiden', 'Arizona', '4833 Coplin Avenue', '480-303-1527'),
(7, 'Jill', 'Michael', 'Austin', '813-297-0692', '813-297-0692'),
(8, 'John', 'Joseph', 'San Francisco', '928-386-8164', '928-386-8164'),
(9, 'Justin', 'Alexander', 'Denver', '4470 McKinley Avenue', '970-433-7589'),
(10, 'Lili', 'Oliver', 'Los Angeles', '3832 Euclid Avenue', '530-695-1180'),
(11, 'Frank', 'Jacob', 'Miami', '1299 Randall Drive', '808-590-5201'),
(12, 'Eva', 'Lucas', 'Arizona', '4379 Skips Lane', '301-509-8805'),
(13, 'Emma', 'Isaac', 'Miami', '808-690-5201', '808-690-5201'),
(14, 'Liam', 'Samuel', 'Miami', '808-555-5201', '808-555-5201'),
(15, 'Mia', 'Owen', 'Miami', '808-640-5201', '808-640-5201');

-- 2. POPULATE ORDERS TABLE
INSERT INTO orders (id, cust_id, order_date, order_details, total_order_cost) VALUES
(1, 3, '2019-03-04', 'Coat', 100),
(2, 3, '2019-03-01', 'Shoes', 80),
(3, 3, '2019-03-07', 'Skirt', 30),
(4, 7, '2019-02-01', 'Coat', 25),
(5, 7, '2019-03-10', 'Shoes', 80),
(6, 15, '2019-02-01', 'Boats', 100),
(7, 15, '2019-01-11', 'Shirts', 60),
(8, 15, '2019-03-11', 'Slipper', 20),
(9, 15, '2019-03-01', 'Jeans', 80),
(10, 15, '2019-03-09', 'Shirts', 50),
(11, 5, '2019-02-01', 'Shoes', 80),
(12, 12, '2019-01-11', 'Shirts', 60),
(13, 12, '2019-03-11', 'Slipper', 20),
(14, 4, '2019-02-01', 'Shoes', 80),
(15, 4, '2019-01-11', 'Shirts', 60),
(16, 3, '2019-04-19', 'Shirts', 50),
(17, 7, '2019-04-19', 'Suit', 150),
(18, 15, '2019-04-19', 'Skirt', 30),
(19, 15, '2019-04-20', 'Dresses', 200),
(20, 12, '2019-01-11', 'Coat', 125),
(21, 7, '2019-04-01', 'Suit', 50),
(22, 7, '2019-04-02', 'Skirt', 30),
(23, 7, '2019-04-03', 'Dresses', 50),
(24, 7, '2019-04-04', 'Coat', 25),
(25, 7, '2019-04-19', 'Coat', 125),
(26, 3, '2019-04-20', 'Gloves', 20),
(27, 3, '2019-04-21', 'Tie', 25),
(28, 3, '2019-04-22', 'Cap', 15),
(29, 3, '2019-04-23', 'Jacket', 120),
(30, 1, '2019-04-19', 'Jacket', 150),
(31, 1, '2019-04-19', 'Shoes', 125);