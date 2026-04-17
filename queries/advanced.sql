-- =========================================
-- ADVANCED LEVEL QUERIES
-- =========================================


-- 1. Top 3 most-viewed tracks for each artist
-- Uses ROW_NUMBER() window function to rank tracks within each artist
SELECT artist, track, views
FROM (
    SELECT artist, track, views,
           ROW_NUMBER() OVER (PARTITION BY artist ORDER BY views DESC) AS rn
    FROM spotify
) t
WHERE rn <= 3;


-- 2. Tracks with liveness above average
-- Compares each track's liveness with overall average using a subquery
SELECT track, liveness
FROM spotify
WHERE liveness > (
    SELECT AVG(liveness)
    FROM spotify
);


-- 3. Energy variation per album (CTE)
-- Calculates difference between highest and lowest energy for each album
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


-- 4. Tracks with high energy-to-liveness ratio
-- Filters tracks where energy/liveness ratio exceeds 1.2
SELECT track, energy, liveness,
       energy / liveness AS ratio
FROM spotify
WHERE liveness <> 0
  AND energy / liveness > 1.2
ORDER BY ratio DESC;


-- 5. Cumulative likes based on views
-- Computes running total of likes using window function
SELECT track, views, likes,
       SUM(likes) OVER (ORDER BY views DESC) AS cumulative_likes
FROM spotify;
