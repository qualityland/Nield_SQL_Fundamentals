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

-- same as
SELECT report_code, year, month, day, wind_speed,
CASE
    WHEN wind_speed >= 40 THEN 'High'
    WHEN wind_speed >= 30 THEN 'Moderate'
    ELSE 'Low'
END AS wind_severity
FROM station_data;

-- binning - histogram
-- how may records with low, moderate or high wind severity
SELECT
CASE
    WHEN wind_speed >= 40 THEN 'High'
    WHEN wind_speed >= 30 THEN 'Moderate'
    ELSE 'Low'
END AS wind_severity,
COUNT(*) AS record_count
FROM station_data
GROUP BY wind_severity;
