-- STEP 1 - SEE IT
SELECT
    company_name,
    country
FROM customers
WHERE country IN ('Germany', 'France', 'Brazil')
ORDER BY country;

-- STEP 2 - TYPE IT
-- #1 Find customers whose company name starts with "A"
SELECT
    company_name,
    contact_name
FROM customers
WHERE company_name LIKE 'A%';

-- #2 Find customers in Germany, France, or Brazil
SELECT
    company_name,
    contact_name,
    country
FROM customers
WHERE country IN ('Germany', 'France', 'Brazil')
ORDER BY country;

-- #3 Find products priced between $10 and $30
SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE unit_price BETWEEN 10 AND 30
ORDER BY unit_price DESC;

-- #4 Find customers NOT in the USA or UK
SELECT
    company_name,
    contact_name,
    country
FROM customers
WHERE country NOT IN ('USA', 'UK')
ORDER BY country;

-- #5 Find products with "Ch" in the name priced under $25
SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE product_name LIKE '%Ch%'
AND unit_price < 25
ORDER BY unit_price DESC;

-- STEP 3 - BREAK IT
-- #1 How many rows will this return?
-- wrong
SELECT *
FROM customers
WHERE company_name LIKE 'A';

-- correct
SELECT *
FROM customers
WHERE company_name LIKE 'A%';
-- added a % wild card. A% = A first letter, %a = last letter, %Je% = any Je in the string

-- #2 What happens?
-- wrong
SELECT *
FROM orders
WHERE order_date BETWEEN '1998-01-01' AND '1997-01-01';

-- correct
SELECT *
FROM orders
WHERE order_date BETWEEN '1997-01-01' AND '1998-01-01'
ORDER BY order_date;
-- correction: it must start with lower then higher value

-- #3 What will PostgreSQL say?
-- wrong
SELECT *
FROM customers
WHERE country IN 'Germany', 'France';

-- correct
SELECT *
FROM customers
WHERE country IN ('Germany', 'France');
-- IN must be wrapped in parenthesis

-- STEP 4 - APPLY IT
-- #1 Country watchlist. "Pull me all orders shipped to Canada, Brazil, or 
-- Argentina in 1997. Just order ID, ship country, and order date."
SELECT
    order_id,
    ship_country,
    shipped_date
FROM orders
WHERE ship_country IN ('Canada', 'Brazil', 'Argentina')
AND shipped_date BETWEEN '1997-01-01' AND '1997-12-31'
ORDER BY ship_country ASC, shipped_date DESC;

-- aggregated findings
SELECT
    ship_country,
    COUNT(order_id) AS total_orders
FROM orders
WHERE ship_country IN ('Canada', 'Brazil', 'Argentina')
AND shipped_date BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY ship_country
ORDER BY ship_country;

-- #2  Alphabet distribution check. "Show me every customer whose 
-- company name starts with a vowel (A, E, I, O, U). I am cross-referencing
-- alphabet distribution for the audit."
SELECT
    company_name,
    contact_name
FROM customers
WHERE company_name LIKE 'A%' 
OR company_name LIKE 'E%'
OR company_name LIKE 'I%'
OR company_name LIKE 'O%'
OR company_name LIKE 'U%';

-- #3 Pricing tier validation. "Give me products priced between $15 and
-- $40 with 'crab', 'shrimp', or 'salmon' in the name. Catalog team wants
-- to validate seafood pricing tier."
SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE unit_price BETWEEN 15 AND 40
AND (
    product_name ILIKE '%crab%'
    OR product_name ILIKE '%shrimp%'
    OR product_name ILIKE '%salmon%'
    )
ORDER BY unit_price DESC;

