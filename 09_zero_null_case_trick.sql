-- precipitation if a tornado was present
SELECT year, month,
       SUM(precipitation) AS tornado_precipitation
  FROM station_data
 WHERE tornado = 1
   AND year >= 1990
GROUP BY year, month;

-- both, precipitation when a tornado was present and precipitation when no tornado was present
SELECT year, month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) AS tornado_precipitation,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) AS non_tornado_precipitation
FROM station_data
WHERE year >= 1990
GROUP BY year, month;

-- use NULL instead of 0 for aggregate functions that could be influenced by zero
SELECT year, month,
MAX(CASE WHEN tornado = 1 THEN precipitation ELSE NULL END) AS max_tornado_precipitation,
MAX(CASE WHEN tornado = 0 THEN precipitation ELSE NULL END) AS max_non_tornado_precipitation
FROM station_data
WHERE year >= 1990
GROUP BY year, month;