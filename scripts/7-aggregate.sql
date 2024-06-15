\c t_sql

-- SELECT id, CONCAT(first_name, ' ', last_name) AS "fullName" 
-- FROM customers;

-- UPDATE customers SET email = 'customer.20@email.com' WHERE id = 21;
-- SELECT * FROM customers ORDER BY id DESC LIMIT 2;

-- SELECT COUNT(*) AS total_of_customers FROM customers;
-- SELECT COUNT(email) FROM customers;
-- SELECT COUNT(DISTINCT email) FROM customers;

-- SELECT 
--   COUNT(id) AS "TotalSales",
--   SUM(amount) AS "TotalRevenue"
-- FROM orders;

SELECT amount FROM orders ORDER by amount DESC LIMIT 1;

SELECT
  customer_id,
  COUNT(id) AS total_orders,
  SUM(amount) AS total_revenue,
  MAX(amount) AS max_order,
  MIN(amount) AS min_order,
  ROUND(AVG(amount), 2) AS average_ticket
FROM orders
  -- WHERE customer_id > 10
  GROUP BY customer_id
  -- HAVING COUNT(id) > 1
  HAVING SUM(amount) BETWEEN 500 AND 1000
  ORDER BY average_ticket DESC
  LIMIT 3
;