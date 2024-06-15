\c t_sql

UPDATE customers 
SET first_name = 'Joao'
WHERE id BETWEEN 4 and 7
RETURNING *
;