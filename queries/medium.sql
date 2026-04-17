-- =========================================
-- MEDIUM LEVEL QUERIES
-- =========================================


-- 1. Average danceability per album
-- Calculates the average danceability score for tracks grouped by album
SELECT album, AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY album
ORDER BY avg_danceability DESC;


-- 2. Top 5 tracks with highest energy
-- Retrieves tracks with the highest energy values
SELECT track, energy
FROM spotify
ORDER BY energy DESC
LIMIT 5;


-- 3. Tracks with official videos along with views and likes
-- Filters tracks where official_video is TRUE and displays engagement metrics
SELECT track, views, likes
FROM spotify
WHERE official_video = TRUE;


-- 4. Total views per album
-- Aggregates total views of all tracks grouped by album
SELECT album, SUM(views) AS total_views
FROM spotify
GROUP BY album
ORDER BY total_views DESC;


-- 5. Tracks streamed more on Spotify than YouTube
-- Compares total Spotify streams and YouTube views per track
-- Assumption: 'stream' represents Spotify streams and 'views' represents YouTube views
SELECT track,
       SUM(stream) AS spotify_streams,
       SUM(views) AS youtube_views
FROM spotify
GROUP BY track
HAVING SUM(stream) > SUM(views)
ORDER BY spotify_streams DESC;
