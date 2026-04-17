-- =========================================
-- MEDIUM LEVEL QUERIES
-- =========================================

-- 1. Calculate the average danceability of tracks in each album
SELECT album, AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY album
ORDER BY avg_danceability DESC;


-- 2. Find the top 5 tracks with the highest energy values
SELECT track, energy
FROM spotify
ORDER BY energy DESC
LIMIT 5;


-- 3. List all tracks along with their views and likes where official_video = TRUE
SELECT track, views, likes
FROM spotify
WHERE official_video = TRUE;


-- 4. For each album, calculate the total views of all associated tracks
SELECT album, SUM(views) AS total_views
FROM spotify
GROUP BY album
ORDER BY total_views DESC;


-- 5. Retrieve the track names that have been streamed on Spotify more than YouTube
-- (Assumption: stream = Spotify, views = YouTube)

SELECT track,
       SUM(stream) AS spotify_streams,
       SUM(views) AS youtube_views
FROM spotify
GROUP BY track
HAVING SUM(stream) > SUM(views)
ORDER BY spotify_streams DESC;
