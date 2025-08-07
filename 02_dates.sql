-- dates (format: YYYY-MM-DD)
SELECT *
  FROM customer_order;

SELECT *
  FROM customer_order
 WHERE ship_date < '2015-05-21';

SELECT date('now');
SELECT date('now', '-1 day');
SELECT date('now', '+3 month');
SELECT date('now', '+3 month', '-1 day');

-- times (GMT)
SELECT '16:31' < '08:31';
SELECT time('now');
SELECT datetime('now');

-- datetime
SELECT datetime('now', '+36 hours');

-- change format
SELECT strftime('%d-%m-%Y %H:%M:%S', 'now');