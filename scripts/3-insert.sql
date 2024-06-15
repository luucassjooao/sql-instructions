\c t_sql

-- INSERT INTO customers VALUES(DEFAULT, 'Joao', 'Lucas', DEFAULT, 'joao@gmail.com');

-- INSERT INTO customers(email, first_name, last_name)
--   VALUES('ribeiro@mail.com', 'ribeiro', 'brito');

-- INSERT INTO customers(first_name, last_name, email)
--   VALUES
--     ('ribeiro', 'brito', 'ribeiro@mail.com'),
--     ('brito', 'jaja', 'brito@mail.com') 
--     RETURNING *;

DO $$ 
DECLARE
  i INT := 1;
  created_customers INT := 0;
  customer_id INT;
BEGIN
  WHILE i <= 20 LOOP
    INSERT INTO customers(first_name, last_name, email)
    VALUES('Customer-' || i, 'Doe-' || i, 'customer.' || i || '@email.com')
    RETURNING id INTO customer_id;

    INSERT INTO orders(amount, customer_id)
    VALUES(RANDOM() * 1000, customer_id);

    i := i + 1;
    created_customers := created_customers + 1;
  END LOOP;

  RAISE NOTICE '% customers succesfully created', created_customers;
END $$;
