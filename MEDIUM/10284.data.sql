DROP TABLE IF EXISTS facebook_friends;

CREATE TABLE facebook_friends(
    user1 BIGINT,
    user2 BIGINT
);

INSERT INTO facebook_friends(user1, user2) VALUES
(2,	1),
(1,	3),
(4,	1),
(1,	5),
(1,	6),
(2,	6),
(7,	2),
(8,	3),
(3,	9);