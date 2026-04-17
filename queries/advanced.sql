-- =========================================
-- ADVANCED LEVEL QUERIES
-- =========================================

-- 1. Find the top 3 most-viewed tracks for each artist (Window Function)
SELECT artist, track, views
FROM (
    SELECT artist, track, views,
           ROW_NUMBER() OVER (PARTITION BY artist ORDER BY views DESC) AS rn
    FROM spotify
) t
WHERE rn <= 3;


-- 2. Find tracks where the liveness score is above the average
SELECT track, liveness
FROM spotify
WHERE liveness > (
    SELECT AVG(liveness)
    FROM spotify
);


-- 3. Difference between highest and lowest energy per album (CTE)
WITH cte AS (
    SELECT 
        album,
        MAX(energy) AS highest_energy,
        MIN(energy) AS lowest_energy
    FROM spotify
    GROUP BY album
)
SELECT 
    album,
    highest_energy - lowest_energy AS energy_diff
FROM cte
ORDER BY energy_diff DESC;


-- 4. Tracks where energy-to-liveness ratio is greater than 1.2
SELECT track, energy, liveness,
       energy / liveness AS ratio
FROM spotify
WHERE liveness <> 0
  AND energy / liveness > 1.2
ORDER BY ratio DESC;


-- 5. Cumulative sum of likes ordered by views (Window Function)
SELECT track, views, likes,
       SUM(likes) OVER (ORDER BY views DESC) AS cumulative_likes
FROM spotify;
