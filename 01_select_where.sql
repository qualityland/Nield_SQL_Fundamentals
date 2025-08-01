-- all culumns
SELECT
    *
FROM CUSTOMER;


-- specific columns
SELECT
    CUSTOMER_ID
  , NAME
FROM CUSTOMER;


-- calculate additional columns with an alias
SELECT
    PRODUCT_ID
  , DESCRIPTION
  , PRICE
  , PRICE * 1.07 AS TAXED_PRICE
FROM PRODUCT;


-- same but rounded and with additional alias
SELECT
    PRODUCT_ID
  , DESCRIPTION
  , PRICE AS UNTAXED_PRICE
  , round(PRICE * 1.07, 2) AS TAXED_PRICE
FROM PRODUCT;


-- concatenate text    
SELECT
    NAME
  , CITY || ', ' || STATE AS LOCATION
FROM CUSTOMER;


-- concatenation
SELECT
    NAME
  , STREET_ADDRESS || ' ' || CITY || ', ' || STATE || ' ' || ZIP AS SHIP_ADDRESS
FROM CUSTOMER;


-- switch to weather stations database
SELECT
    *
FROM STATION_DATA;


-- specific year
SELECT
    *
FROM STATION_DATA
WHERE year = 2010;


-- everything but 2010
SELECT
    *
FROM STATION_DATA
WHERE year != 2010;

SELECT
    *
FROM STATION_DATA
WHERE year <> 2010;


-- between two values
SELECT
    *
FROM STATION_DATA
WHERE year BETWEEN 2005 AND 2010;


-- multiple where clauses using AND
SELECT
    *
FROM STATION_DATA
WHERE year >= 2005
  AND year <= 2010;


-- using OR
SELECT *
FROM STATION_DATA
WHERE month = 3
   OR month = 6
   OR month = 9
   OR month = 12;


-- using IN
SELECT *
FROM STATION_DATA
WHERE month IN (3, 6, 9, 12);


-- using NOT IN
SELECT *
FROM STATION_DATA
WHERE month NOT IN (3, 6, 9, 12);


-- trick: using modulo operator
SELECT *
FROM STATION_DATA
WHERE month % 3 = 0;


--
SELECT *
FROM STATION_DATA
WHERE report_code IN ('513A63','1F8A7B','EF616A');


-- wildcards and LIKE keyword: starting with A
SELECT *
FROM STATION_DATA
WHERE report_code LIKE 'A%';


-- starting with B, 3rd character is C
SELECT *
FROM STATION_DATA
WHERE report_code LIKE 'B_C%';


-- booleans are represented with 0/1
SELECT count(*)
FROM STATION_DATA
WHERE tornado = 1 and hail = 1;

--  SQLite and MySQL allow to use true/false instead
SELECT count(*)
FROM STATION_DATA
WHERE tornado = true AND hail = true;


-- NULL
SELECT *
FROM STATION_DATA
WHERE snow_depth IS NULL;


-- does not include NULL values
SELECT *
FROM STATION_DATA
WHERE precipitation <= 0.5;


-- NULL values have to be included explicitly
SELECT *
FROM STATION_DATA
WHERE precipitation IS NULL OR precipitation <= 0.5;


-- elegant way to handle NULL: coalesce() function
SELECT *
FROM STATION_DATA
WHERE coalesce(precipitation, 0) <= 0.5;


-- coalesce() in SELECT statment
SELECT
    report_code
  , coalesce(precipitation, 0) AS rainfall
FROM STATION_DATA;


-- 