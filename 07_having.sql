-- filtering aggregate values with HAVING
SELECT year,
       SUM(precipitation) AS total_precipitation
  FROM station_data
 WHERE year >= 2005
GROUP BY year
HAVING total_precipitation > 30;

/*
WHERE filters on idividual records,
while HAVING filters on aggregate values
*/