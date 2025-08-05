SELECT *
  FROM station_data;


 -- categories of wind_speed 
SELECT report_code, year, month, day, wind_speed,
CASE
    WHEN wind_speed >= 40 THEN 'High'
    WHEN wind_speed >= 30 AND wind_speed < 40 THEN 'Moderate'
    ELSE 'Low'
END AS wind_severity
FROM station_data;


-- simplyfied (removed 'AND wind_speed < 40')
SELECT report_code, year, month, day, wind_speed,
CASE
    WHEN wind_speed >= 40 THEN 'High'
    WHEN wind_speed >= 30 THEN 'Moderate'
    ELSE 'Low'
END AS wind_severity
FROM station_data;


-- grouping CASE statements
SELECT
CASE
    WHEN wind_speed >= 40 THEN 'High'
    WHEN wind_speed >= 30 THEN 'Moderate'
    ELSE 'Low'
END AS wind_severity,
COUNT(*) AS record_count
FROM station_data
GROUP BY wind_severity;
-- binning - histogram
-- how may records with low, moderate or high wind severity


-- grouping multiple columns
SELECT
    year,
CASE
    WHEN wind_speed >= 40 THEN 'High'
    WHEN wind_speed >= 30 THEN 'Moderate'
    ELSE 'Low'
END AS wind_severity,
COUNT(*) AS record_count
FROM station_data
GROUP BY 1, 2;
