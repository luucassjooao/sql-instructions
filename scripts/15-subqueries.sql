\c t_sql

-- SELECT 
--   cus.*,
-- SUM(ord.amount) AS total_spent
-- FROM customers cus
-- LEFT JOIN orders ord ON ord.customer_id = cus.id
-- GROUP BY cus.id
-- ORDER BY id
-- ;

SELECT 
  cus.*,
  SUM(ord.amount) AS total_spent,
  (
    SELECT MAX(ord.amount) FROM orders WHERE id = cus.id
  ) AS max_value
FROM customers cus
LEFT JOIN orders ord ON ord.customer_id = cus.id
GROUP BY cus.id
HAVING SUM(ord.amount) > (SELECT AVG(amount) FROM orders)
ORDER BY id
;

-- SELECT * FROM orders WHERE customer_id IN (
--   SELECT id FROM customers WHERE first_name LIKE '%5%'
-- );