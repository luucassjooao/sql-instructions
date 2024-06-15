\c t_sql

-- ALTER TABLE customers ALTER COLUMN email SET NOT NULL;
-- ALTER TABLE customers ADD CONSTRAINT customers_email_unique UNIQUE(email);
-- ALTER TABLE customers ADD UNIQUE(email, id);
-- ALTER TABLE customers DROP CONSTRAINT customers_email_unique;

-- ALTER TABLE orders ADD CHECK(amount >= 0);

SELECT constraint_name, constraint_type, table_name
FROM information_schema.table_constraints
WHERE table_schema = 'public';
