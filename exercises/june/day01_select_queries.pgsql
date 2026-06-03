SELECT *
FROM orders
LIMIT 5;

-- STEP 2 - TYPE IT
-- #1 Get every customer's company name
SELECT company_name
FROM customers;

-- #2 Get product names and their prices
SELECT
    product_name,
    unit_price
FROM products;

-- #3 Get the first 10 orders (all columns)
SELECT *
FROM orders
LIMIT 10;

-- #4 Get 5 products - only name and price
-- hint: Combine column list with LIMIT. This is the pattern you'll use daily as a BI analyst.
SELECT
    product_name,
    unit_price
FROM products
LIMIT 5;

--#5 Get 3 orders - order_id and order_date only
SELECT
    order_id,
    order_date
FROM orders
LIMIT 3;

-- STEP 3 - BREAK IT
-- #1 
-- wrong = ERROR: syntax error at or near "SELCT"
SELCT *
FROM customers;
-- correct
SELECT *
FROM customers;

-- #2
-- wrong = ERROR: relation "customerz" does not exist
SELECT *
FROM customerz;
-- correct
SELECT *
FROM customers;

-- #3
-- wrong = ERROR: syntax error at or near "FROM", the comma.
SELECT company_name,
FROM customers;
-- correct
SELECT company_name
FROM customers;

-- STEP 4 - APPLY IT
SELECT *
FROM customers
LIMIT 5;

 -- Ask 1 — Recency check. "Pull me the 3 most recent orders — order_id, customer_id, and order_date."
SELECT
    order_id,
    customer_id,
    order_date
FROM orders
ORDER BY order_date DESC
LIMIT 3;

-- Ask 2 — Premium-tier review. "What are our top 5 most expensive products — name and price? I want to see if any are sitting in the catalog without much movement."
SELECT
    product_name,
    unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;

-- Ask 3 — Outreach list. "Give me the first 10 customers alphabetically by company name — I want to start working through the call list from the top."
SELECT
    company_name,
    contact_name,
    contact_title,
    city,
    phone
FROM customers
ORDER BY company_name
LIMIT 10;
