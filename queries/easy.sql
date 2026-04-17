-- =========================================
-- EASY LEVEL QUERIES
-- =========================================

-- 1. Retrieve the names of all tracks that have more than 1 billion streams
SELECT track
FROM spotify
WHERE stream > 1000000000;


-- 2. List all albums along with their respective artists
SELECT DISTINCT album, artist
FROM spotify
ORDER BY album;


-- 3. Get the total number of comments for tracks where licensed = TRUE
SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed = TRUE;


-- 4. Find all tracks that belong to the album type 'single'
SELECT track
FROM spotify
WHERE album_type ILIKE 'single';


-- 5. Count the total number of tracks by each artist
SELECT artist, COUNT(track) AS total_tracks
FROM spotify
GROUP BY artist
ORDER BY total_tracks DESC;
