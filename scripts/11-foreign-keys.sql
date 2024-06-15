\c t_sql

-- ALTER TABLE orders ADD FOREIGN KEY(customer_id) REFERENCES customers(id);
-- INSERT INTO orders(customer_id, amount) VALUES(4234,1000);
-- DELETE FROM orders WHERE customer_id = 4234;
-- DELETE FROM customers WHERE id = 1;


-- UPDATE customers SET id = 99 WHERE id = 1; 
-- DROP TABLE IF EXISTS potato;
-- CREATE TABLE potato {
--   customer_id INT REFERENCES customers(id),
  
--   -- FOREIGN KEY(customer_id) REFERENCES customers(id)
-- }
 
ALTER TABLE orders ALTER COLUMN customer_id SET DEFAULT 20;

ALTER TABLE orders DROP CONSTRAINT orders_fkey;
ALTER TABLE orders 
ADD CONSTRAINT orders_fkey
ADD FOREIGN KEY(customer_id) REFERENCES customers(id)
ON UPDATE CASCADE
ON DELETE SET DEFAULT 
;
 

SELECT constraint_name, constraint_type, table_name
FROM information_schema.table_constraints
WHERE table_schema = 'public';