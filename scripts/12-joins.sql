\c t_sql

-- SELECT * FROM customers AS cus
-- JOIN orders AS ord ON cus.id = ord.customer_id AND ord.amount < 100
-- WHERE cus.id = 9
-- ;

-- SELECT * FROM customers AS cus
-- LEFT JOIN orders AS ord ON cus.id = ord.customer_id
-- WHERE cus.id = 9
-- ;

SELECT 
  cus.*, 
  no_empty_object_array(COUNT(ord.id), 
        JSON_AGG(
        -- JSON_STRIP_NULLS(
          JSON_BUILD_OBJECT(
            'id', ord.id,
            'amount', ord.amount
          )
        -- )
      )
  ) as orders
FROM customers AS cus
LEFT JOIN orders AS ord ON cus.id = ord.customer_id
WHERE cus.id = 10
GROUP BY cus.id
;

-- SELECT * FROM customers AS cus
-- RIGHT JOIN orders AS ord ON cus.id = ord.customer_id
-- ;

-- SELECT * FROM customers AS cus
-- FULL JOIN orders AS ord ON cus.id = ord.customer_id
-- WHERE cus.id = 9
-- ;

-- SELECT * FROM customers AS cus
-- CROSS JOIN orders
-- ORDER BY cus.id
-- ;