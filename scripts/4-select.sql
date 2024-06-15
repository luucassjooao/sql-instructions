\c t_sql

-- SELECT id, first_name AS "firstName", last_name AS "lastName", email, created_at
-- FROM customers;

-- SELECT * FROM customers
--   ORDER BY id ASC
  -- LIMIT 3
  -- OFFSET 3
-- ;

-- SELECT * FROM customers WHERE id > 15
-- OR
-- AND
-- IN
-- BETWEEN
-- NOT
-- IS NULL
-- ;

SELECT * FROM customers
WHERE first_name ILIKE 'Customers%';

