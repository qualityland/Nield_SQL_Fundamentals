-- grouping conditions
SELECT *
  FROM station_data
 WHERE (rain = 1 AND temperature <= 32)
    OR snow_depth > 0;