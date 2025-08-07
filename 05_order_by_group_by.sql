-- count()
SELECT count(*) AS record_count
FROM station_data;


-- count tornado records
SELECT count(*) AS record_count
FROM station_data
WHERE tornado = 1;


-- count tornado records for every year
SELECT
    year
  , count(*) AS record_count
FROM station_data
WHERE tornado = 1
GROUP BY year;


-- for every month of a year
SELECT
    year
  , month
  , count(*) AS record_count
FROM station_data
WHERE tornado = 1
GROUP BY
    year
  , month;


-- same using ordinal position instead of column names
SELECT
    year
  , month
  , count(*) AS record_count
FROM station_data
WHERE tornado = 1
GROUP BY 1, 2;


-- descendent order
SELECT year
     , month
     , count(*) AS record_count
  FROM station_data
 WHERE tornado = 1
 GROUP BY year
        , month
 ORDER BY year DESC
        , month DESC;
