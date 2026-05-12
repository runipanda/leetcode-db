DROP TABLE IF EXISTS airbnb_contacts;

CREATE TABLE airbnb_contacts (
    n_messages BIGINT,
    id_guest VARCHAR(50),
    id_host VARCHAR(50),
    id_listing VARCHAR(50),
    ts_contact_at TIMESTAMP,
    ts_reply_at TIMESTAMP,
    ts_accepted_at TIMESTAMP,
    ts_booking_at TIMESTAMP,
    ds_checkin DATE,
    ds_checkout DATE,
    n_guests BIGINT
);

INSERT INTO airbnb_contacts (id_guest, id_host, id_listing, ts_contact_at, n_messages) VALUES
('86b39b70', '1dfb22ec', 'd668de42', '2014-04-18 09:32:23', 5),
('14f943bb', '3347390d', '14c47fb8', '2014-10-06 06:55:45', 8),
('425aa1ed', '02cafb86', 'c5a4a913', '2014-10-04 05:02:39', 2),
('b2fda15a', '71f1d49e', '95fb78ca', '2014-10-08 15:07:56', 10),
('b8831610', 'bdd8a691', '9633168d', '2014-10-14 04:05:14', 17),
('136c10f8', '6dc86890', '2e6adb00', '2014-12-06 20:24:54', 13),
('bdaf2e68', '39436382', '98076842', '2014-10-12 09:14:35', 16),
('91c2a883', 'b58d6d66', 'f3dc4c11', '2014-10-12 08:34:00', 17),
('6c541a87', 'b881e451', '42cd81d5', '2014-10-03 18:25:01', 13),
('94139517', '8d31dbce', '90d312e0', '2014-10-10 10:59:43', 15);

SELECT * FROM airbnb_contacts;

-- 10159 - Ranking most active guests
-- Identify the most engaged guests by ranking them according to their overall messaging activity. The most active guest, meaning the one who has exchanged the most messages with hosts, should have the highest rank. If two or more guests have the same number of messages, they should have the same rank. Importantly, the ranking shouldn't skip any numbers, even if many guests share the same rank. Present your results in a clear format, showing the rank, guest identifier, and total number of messages for each guest, ordered from the most to least active.

SELECT n_messages, id_guest, id_host, id_listing
FROM airbnb_contacts
ORDER BY n_messages DESC;

-- sort it larger to smaller
SELECT  id_guest,
        SUM(n_messages) AS total_messages,
        DENSE_RANK() OVER(ORDER BY SUM(n_messages) DESC) AS rnk
FROM airbnb_contacts
GROUP BY id_guest


