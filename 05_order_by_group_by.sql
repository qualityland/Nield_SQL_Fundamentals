SELECT year,
       month,
       count(*) AS record_count
  FROM station_data
 WHERE tornado = 1
group by year, month;
  
SELECT year,
       month,
       count(*) AS record_count
  FROM station_data
 WHERE tornado = 1
group by 1, 2;

SELECT year,
       month,
       count(*) AS record_count
  FROM station_data
 WHERE tornado = 1
group by year, month
order by year DESC, month DESC;