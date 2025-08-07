-- inner join
SELECT ORDER_ID
     , customer.CUSTOMER_ID
     , ORDER_DATE
     , SHIP_DATE
     , NAME
     , STREET_ADDRESS
     , CITY
     , STATE
     , ZIP
     , PRODUCT_ID
     , ORDER_QTY
  FROM customer
 INNER JOIN customer_order
    ON customer.CUSTOMER_ID = customer_order.CUSTOMER_ID;


-- left outer join
SELECT ORDER_ID
     , customer.CUSTOMER_ID
     , ORDER_DATE
     , SHIP_DATE
     , NAME
     , STREET_ADDRESS
     , CITY
     , STATE
     , ZIP
     , PRODUCT_ID
     , ORDER_QTY
  FROM customer
  LEFT JOIN customer_order
    ON customer.CUSTOMER_ID = customer_order.CUSTOMER_ID;



-- full outer join
-- (rarely used, since usually child records do have a parent record)
SELECT ORDER_ID
     , customer.CUSTOMER_ID
     , ORDER_DATE
     , SHIP_DATE
     , NAME
     , STREET_ADDRESS
     , CITY
     , STATE
     , ZIP
     , PRODUCT_ID
     , ORDER_QTY
  FROM customer
  FULL OUTER JOIN customer_order
    ON customer.CUSTOMER_ID = customer_order.CUSTOMER_ID;


-- find parent records that don't have any child records
SELECT CUSTOMER.CUSTOMER_ID
     , CUSTOMER.NAME AS CUSTOMER_NAME
  FROM CUSTOMER
  LEFT JOIN CUSTOMER_ORDER
    ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
 WHERE ORDER_ID IS NULL;


-- join multiple tables
-- and calculate the revenue (product price * order quantity)
SELECT ORDER_ID
     , CUSTOMER.CUSTOMER_ID
     , NAME AS CUSTOMER_NAME
     , STREET_ADDRESS
     , CITY
     , STATE
     , ZIP
     , ORDER_DATE
     , PRODUCT.PRODUCT_ID
     , DESCRIPTION AS PRODUCT_DESC
     , ORDER_QTY
     , PRICE * ORDER_QTY AS REVENUE
  FROM CUSTOMER
 INNER JOIN CUSTOMER_ORDER
    ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
 INNER JOIN PRODUCT
    ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID;


-- join multiple tables (customer, customer_order, product)
-- calculate total revenue per customer
SELECT CUSTOMER.CUSTOMER_ID
     , NAME AS CUSTOMER_NAME
     , sum(PRICE * ORDER_QTY) AS TOTAL_REVENUE
  FROM CUSTOMER
 INNER JOIN CUSTOMER_ORDER
    ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
 INNER JOIN PRODUCT
    ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID
 GROUP BY 1, 2;

-- inculde customers without orders
SELECT CUSTOMER.CUSTOMER_ID
     , NAME AS CUSTOMER_NAME
     , coalesce(sum(PRICE * ORDER_QTY), 0) AS TOTAL_REVENUE  -- NULL to 0
  FROM CUSTOMER
  LEFT JOIN CUSTOMER_ORDER
    ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
  LEFT JOIN PRODUCT
    ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID
 GROUP BY 1, 2;