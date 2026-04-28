-- see all 8 tables
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- See every column in every table (the real big picture)
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;

-- step 2 Type it — 5 queries
-- #1 Get every customer's company name
SELECT * FROM customers;
SELECT company_name From customers;

-- #2 Get product names and their prices
SELECT * FROM products;
SELECT product_name, unit_price FROM products;

-- #3 Get the first 10 orders (all columns)
SELECT * FROM orders;
SELECT * FROM orders LIMIT 10;

-- #4 Get 5 products — only name and price
SELECT * FROM products; 
SELECT product_name, unit_price FROM products LIMIT 5;

-- #5 Get 3 orders — order_id and order_date only
SELECT * FROM orders;
SELECT order_id, order_date FROM orders LIMIT 3;

-- step 3 Break it, fix it
-- #1 debug
SELCT * FROM customers;
SELECT * FROM customers;

-- #2 debug
SELECT * FROM customerz;
SELECT * FROM customers;

-- #3 debug
SELECT company_name, FROM customers;
SELECT company_name FROM customers;

-- step 4 Apply it — real stakeholder ask
SELECT * FROM orders;
SELECT order_id, customer_id, order_date FROM orders;
SELECT order_id, customer_id, order_date FROM orders ORDER BY order_Date DESC LIMIT 3;

