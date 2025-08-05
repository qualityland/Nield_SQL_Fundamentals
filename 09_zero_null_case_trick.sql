-- precipitation if a tornado was present
SELECT year, month,
       SUM(precipitation) AS tornado_precipitation
  FROM station_data
 WHERE tornado = 1
   AND year >= 1990
GROUP BY year, month;
-- precipitation if a tornado was NOT present
SELECT year, month,
       SUM(precipitation) AS non_tornado_precipitation
  FROM station_data
 WHERE tornado = 0
   AND year >= 1990
GROUP BY year, month;

-- both in one statement
SELECT year, month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) AS tornado_precipitation,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) AS non_tornado_precipitation
FROM station_data
WHERE year >= 1990
GROUP BY year, month;


-- when searching for MIN / MAX use NULL instead of 0
-- NULLs are ignored, while 0 could be the miniumum or maximum value
SELECT year, month,
MAX(CASE WHEN tornado = 1 THEN precipitation ELSE NULL END) AS max_tornado_precipitation,
MAX(CASE WHEN tornado = 0 THEN precipitation ELSE NULL END) AS max_non_tornado_precipitation
FROM station_data
WHERE year >= 1990
GROUP BY year, month



-- AND, OR and NOT can also be use inside a CASE statement
SELECT month,
    AVG(CASE WHEN rain OR hail THEN temperature ELSE NULL END) AS avg_precipitation_temp,
    AVG(CASE WHEN NOT (rain OR hail) THEN temperature ELSE NULL END) AS avg_non_precipitation_temp
FROM STATION_DATA
WHERE year >= 2000
GROUP BY month;



