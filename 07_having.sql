-- DOES NOT WORK: aggregate values cannot be filtered with WHERE
SELECT year,
       SUM(precipitation) AS total_precipitation
  FROM station_data
 WHERE year >= 2005
   AND total_precipitation > 30
 GROUP BY year;


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


-- duplicates
SELECT station_number
  FROM STATION_DATA
 ORDER BY 1;

-- count: 28'000
SELECT count(station_number)
  FROM STATION_DATA
 ORDER BY 1;


-- only DISTINCT values
SELECT DISTINCT station_number
  FROM STATION_DATA
 ORDER BY 1;

-- count: 6'368
SELECT count(DISTINCT station_number)
  FROM STATION_DATA
 ORDER BY 1;

-- works also with multiple columns
SELECT DISTINCT station_number,
       year
  FROM STATION_DATA
 ORDER BY 1;