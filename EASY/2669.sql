DROP TABLE IF EXISTS Spotify;

CREATE TABLE Spotify (
    id         INT PRIMARY KEY,
    track_name VARCHAR(100),
    artist     VARCHAR(100)
);

INSERT INTO Spotify VALUES
    (1, 'Waterfall Dreams', 'Hazel'),
    (2, 'Neon Lights',      'Iris'),
    (3, 'Golden Hour',      'Hazel'),
    (4, 'Echo Chamber',     'Iris'),
    (5, 'Midnight Run',     'Hazel'),
    (6, 'Summer Fade',      'Claire');

SELECT * FROM Spotify;

-- 2669. Count Artist Occurrences On Spotify Ranking List

SELECT artist, COUNT(id) AS occurrences
FROM Spotify
GROUP BY artist
ORDER BY occurrences DESC, artist;