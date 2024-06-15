\c t_sql

EXPLAIN ANALYZE VERBOSE SELECT * FROM customers WHERE id = 10;

DROP INDEX customers_first_name_idx;
CREATE INDEX IF NOT EXISTS customers_first_name_idx ON customers(first_name);