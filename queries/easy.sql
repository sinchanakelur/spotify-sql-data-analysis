-- =========================================
-- EASY LEVEL QUERIES
-- =========================================


-- 1. Tracks with more than 1 billion streams
-- Filters tracks based on high streaming count
SELECT track
FROM spotify
WHERE stream > 1000000000;


-- 2. Albums with their respective artists
-- Retrieves unique album-artist combinations
SELECT DISTINCT album, artist
FROM spotify
ORDER BY album;


-- 3. Total comments for licensed tracks
-- Aggregates comments where licensed is TRUE
SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed = TRUE;


-- 4. Tracks belonging to 'single' album type
-- Filters tracks with album type as 'single' (case-insensitive)
SELECT track
FROM spotify
WHERE album_type ILIKE 'single';


-- 5. Total number of tracks by each artist
-- Counts tracks grouped by artist and sorts by highest count
SELECT artist, COUNT(track) AS total_tracks
FROM spotify
GROUP BY artist
ORDER BY total_tracks DESC;
