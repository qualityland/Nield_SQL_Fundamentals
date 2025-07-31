-- count
SELECT count(snow_depth) AS recorded_snow_depth_count
  FROM station_data;

-- average
SELECT month,
       round((AVG(temperature) - 32) / 1.8, 1) AS avg_temp_celsius
  FROM station_data
 WHERE year > 2000
GROUP BY month;

-- sum
SELECT year,
       round(SUM(snow_depth), 2) AS total_snow
  FROM station_data
 WHERE year >= 2005
GROUP BY year;

-- maximum
SELECT year,
       SUM(snow_depth) AS total_snow,
       SUM(precipitation) AS total_precipitation,
       MAX(precipitation) AS max_precipitation
  FROM station_data
 WHERE year >= 2005
GROUP BY year;
