-- count non-NULL records (1'552 of 28'000)
SELECT count(snow_depth) AS recorded_snow_depth_count
  FROM station_data;


-- average temperature in F
SELECT month
     , AVG(temperature) AS avg_temp_fahrenheit
  FROM station_data
 WHERE year >= 2000
 GROUP BY month;


-- average temperature in F (rounded)
SELECT month
     , round(AVG(temperature), 2) AS avg_temp_fahrenheit
  FROM station_data
 WHERE year >= 2000
 GROUP BY month;


-- average temperature in C (rounded)
SELECT month
     , round((AVG(temperature) - 32) / 1.8, 1) AS avg_temp_celsius
  FROM station_data
 WHERE year >= 2000
 GROUP BY month;


-- sum up snow depth per year
SELECT year
     , SUM(snow_depth) AS total_snow
  FROM station_data
 WHERE year >= 2005
 GROUP BY year;


-- total snow depth and precipitaion; also maximum preciptiation
SELECT year
     , SUM(snow_depth) AS total_snow
     , SUM(precipitation) AS total_preciptitation
     , MAX(precipitation) AS max_precipitation
  FROM station_data
 WHERE year >= 2005
 GROUP BY year;


-- total peciptiation during tornados
SELECT year
     , SUM(precipitation) AS tornado_precipitation
  FROM station_data
 WHERE tornado = 1
 GROUP BY year;

