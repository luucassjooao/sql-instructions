\c t_sql

-- ALTER TABLE customers ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- CREATE OR REPLACE FUNCTION set_updated_at_trigger() RETURNS TRIGGER
-- AS $$
--   BEGIN
--     NEW.updated_at = CURRENT_TIMESTAMP;
--     RETURN NEW;
--   END;
-- $$ LANGUAGE plpgsql;

-- CREATE TRIGGER customers_update_updated_at
-- BEFORE UPDATE ON customers
-- FOR EACH ROW EXECUTE FUNCTION set_updated_at_trigger();

-- SELECT * FROM customers WHERE id = 1;
-- UPDATE customers SET last_name = 'BRITO' WHERE id = 1;
-- SELECT * FROM customers WHERE id = 1;
