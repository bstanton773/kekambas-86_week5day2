-- DDL - Data Definition Language

-- CREATE TABLE table_name(
--	column_name data_type *constraints*,
--  ...
--)

-- Create customer table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50) UNIQUE,
	prime_member BOOLEAN DEFAULT FALSE,
	address VARCHAR(100)
);

SELECT *
FROM customer;


-- Create order table 
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	total NUMERIC(6,2),
	customer_id INTEGER NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	-- FOREIGN KEY(column_in_domestic_table) REFERENCES foreign_table(column_in_foreign_table)
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

SELECT *
FROM order_;


-- Create order product table (Join table between many to many relationship)
CREATE TABLE order_product(
	order_product_id SERIAL PRIMARY KEY,
	order_id INTEGER NOT NULL,
	FOREIGN KEY(order_id) REFERENCES order_(order_id),
	prod_id INTEGER NOT NULL
--	FOREIGN KEY(prod_id) REFERENCES product(prod_id) -- CANNOT ADD FK W/O TABLE EXISTING
);

SELECT *
FROM order_product;


-- Create Product Table
CREATE TABLE product(
	prod_id SERIAL PRIMARY KEY,
	prod_name VARCHAR(50),
	description VARCHAR(100),
	price NUMERIC(5,2),
	rating NUMERIC(2,1)
);

SELECT *
FROM product;


-- Add a foreign key to the EXISITNG order_product table (so we need to ALTER) and reference the product table 
ALTER TABLE order_product 
ADD FOREIGN KEY(prod_id) REFERENCES product(prod_id);


-- Create a seller table 
CREATE TABLE seller(
	seller_id SERIAL PRIMARY KEY,
	brand_name VARCHAR(50),
	email VARCHAR(50) UNIQUE,
	phone VARCHAR(14)
);


SELECT *
FROM seller;


-- Add the seller_id column to the product table 
ALTER TABLE product
ADD COLUMN seller_id INTEGER NOT NULL;

-- Add foreign key to the seller id
ALTER TABLE product 
ADD FOREIGN KEY(seller_id) REFERENCES seller(seller_id);


-- Add fake column to DROP 
ALTER TABLE product 
ADD test VARCHAR(10);

SELECT * FROM product;

-- Drop column 
ALTER TABLE product 
DROP test;


-- Rename a column
ALTER TABLE seller 
RENAME COLUMN email TO email_address;

-- Rename a table 
ALTER TABLE seller 
RENAME TO brand;


-- CREATE A TEST TABLE 
CREATE TABLE test(
	test_id SERIAL PRIMARY KEY,
	column_1 INTEGER,
	column_2 VARCHAR(10) NOT NULL
);


-- Remove a constraint
ALTER TABLE test 
ALTER COLUMN column_2 DROP NOT NULL;

-- Remove a column from a table 
ALTER TABLE test 
DROP COLUMN column_1;


-- Remove table completely
DROP TABLE IF EXISTS test;
-- BE CAREFUL -- CANNOT UNDO




