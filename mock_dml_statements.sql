-- DML - Data Manipulation Language

SELECT *
FROM customer;

-- Add data to a table
-- INSERT INTO table_name(column1, column2, etc) VALUES(value1, value2, etc)
INSERT INTO customer(
	first_name,
	last_name,
	email,
	prime_member,
	address
) VALUES (
	'Brian',
	'Stanton',
	'brians@codingtemple.com',
	TRUE,
	'555 Circle Drive, Chicago, IL 60606'
);

SELECT *
FROM customer;

INSERT INTO customer(
	email,	
	first_name,
	address,
	last_name
) VALUES (
	'sql_lover@gmail.com',
	'Brandon',
	'123 Real Street, Fairbanks, AK',
	'Apol'
);

SELECT *
FROM customer;


-- UPDATE table_name
-- SET column_name = value 
-- WHERE condition *Not necessary but highly recommended
UPDATE customer 
SET prime_member = TRUE 
WHERE customer_id = 2;


UPDATE customer 
SET prime_member = FALSE;


-- Insert multiple rows of data at a time
-- INSERT INTO table_name(*columns) VALUES(value1a, value1b), (value2a, value2b)

INSERT INTO brand(
	brand_name,
	email_address,
	phone
)VALUES(
	'Beverly Bike Shop',
	'beverlybike@shop.com',
	'(555) 555-5555'
),(
	'Bic',
	'pens@bic.org',
	'(987) 654-3210'
);

SELECT *
FROM brand;


INSERT INTO product(
	prod_name,
	description,
	price,
	rating,
	seller_id
)VALUES(
	'Waterbottle',
	'Stay hydrated while biking',
	9.99,
	4.8,
	1
);


SELECT *
FROM product;


INSERT INTO product(
	prod_name,
	description,
	price,
	rating,
	seller_id
)VALUES(
	'Keychain',
	'Keep all of your keys together',
	1.99,
	5.0,
	2
);


-- Reset product sequence to 1
ALTER SEQUENCE product_prod_id_seq
RESTART WITH 1;


INSERT INTO product(
	prod_name,
	description,
	price,
	rating,
	seller_id
)VALUES(
	'Ballpoint Pen',
	'Write beautifully',
	4.99,
	4.0,
	2
);


INSERT INTO order_ VALUES(1, CURRENT_TIMESTAMP, 15.00, 1);

INSERT INTO order_(
	total,
	customer_id
)VALUES(
	10.99,
	2
);

SELECT *
FROM order_;


INSERT INTO order_product(
	order_id, prod_id
)VALUES(1,1),(1,2),(2,2),(2,3);

SELECT * FROM order_product;



SELECT * FROM customer

-- UPDATE data 
UPDATE customer 
SET prime_member = TRUE 
WHERE first_name LIKE 'B%';

SELECT * FROM customer;


INSERT INTO product (
	prod_name,
	price,
	rating,
	seller_id
)VALUES(
	'bad item',
	999.99,
	2.5,
	2
)

-- DELETE data from a table 
-- DELETE FROM table_name 
-- WHERE condition * Not necessary but HIGHLY HIGHLY recommended 
SELECT * FROM product


-- Delete all products that have a rating of less than 3
DELETE FROM product 
WHERE rating < 3;

SELECT * FROM product


DELETE FROM product;
