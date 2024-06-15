\c t_sql

DROP VIEW IF EXISTS customers_summary;

CREATE OR REPLACE VIEW customers_summary AS 
SELECT
  customer_id,
  COUNT(id)::INT AS total_orders,
  SUM(amount)::FLOAT AS total_revenue,
  MAX(amount)::FLOAT AS max_order,
  MIN(amount)::FLOAT AS min_order,
  ROUND(AVG(amount), 2)::FLOAT AS average_ticket
FROM orders
  GROUP BY customer_id
  ORDER BY average_ticket DESC
;

-- ALTER VIEW customers_summary RENAME COLUMN total_orders TO "totalOrders";

-- SELECT * FROM customers_summary
-- ;

-- SELECT * FROM pg_views WHERE viewanme = 'customers_summary';
