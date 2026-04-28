-- step 1 The WHERE clause filtered out every other country before returning results.
SELECT company_name, country FROM customers WHERE country = 'Germany';

-- step 2 Type it — 5 queries
-- #1 Get customers from Germany
SELECT * FROM customers;
SELECT * FROM customers WHERE country = 'Germany';
SELECT company_name, contact_name, country FROM customers WHERE country = 'Germany';

-- #2 Get products over $30
SELECT * FROM products;
SELECT product_name, unit_price FROM products WHERE unit_price >= 30; 

-- #3 Get orders placed in 1997
SELECT * FROM orders;
SELECT order_id, customer_id, order_date FROM orders WHERE order_date > '1997-01-01' AND order_date < '1998-01-01';

-- #4 Get products that are NOT discontinued
SELECT * FROM products;
SELECT product_name, unit_price FROM products WHERE discontinued = 0;

-- #5 Get expensive non-discontinued products
SELECT * FROM products; 
SELECT product_name, unit_price FROM products WHERE unit_price >= 20 AND discontinued = 0;

-- Step 3 Break it, fix it
-- #1
SELECT * FROM customers WHERE country =  Germany; 
SELECT * FROM customers WHERE country = 'Germany';
SELECT * FROM customers WHERE country = "Germany";

-- #2
SELECT * FROM products WHERE unit_price = NULL;

-- #3 
SELECT product_name FROM products WHERE unit_price > 20 OR unit_price < 10 AND discontinued = 0;

SELECT product_name, unit_price, discontinued
FROM products 
WHERE (unit_price > 20 OR unit_price < 10) 
AND discontinued = 0;

-- Step 4 Apply it — real stakeholder asks
-- #1 Ask 1 — Geography focus. 
SELECT * FROM customers;

SELECT company_name, contact_name, phone, fax, country 
FROM customers 
WHERE country = 'France'
ORDER BY company_name;

-- #2 Ask 2 — Value + time window. 
SELECT * FROM orders;

SELECT order_id, customer_id, order_date, freight
FROM orders
WHERE (order_date > '1997-10-01' AND order_date < '1997-12-31') AND freight >= 100 ORDER BY freight DESC;

-- #3 Ask 3 — Inventory audit.
SELECT * FROM products;

SELECT product_name, units_in_stock, discontinued
FROM products
WHERE units_in_stock = 0 
OR discontinued= 1;