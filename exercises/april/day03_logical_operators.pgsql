-- Step 1 · See it
SELECT
    company_name,
    country
FROM customers
WHERE
    country IN ('Germany', 'France', 'Brazil');

-- Step 2 · Type it
-- #1 Find customers whose company name starts with "A"
SELECT
    company_name,
    country
FROM customers 
WHERE
    company_name LIKE 'A%';

-- #2 Find customers in Germany, France, or Brazil
SELECT
    company_name,
    country
FROM customers
WHERE
    country IN ('Germany', 'France', 'Brazil');

-- #3 Find products priced between $10 and $30
SELECT
    product_name,
    unit_price
FROM products
WHERE
    unit_price BETWEEN 10 AND 30;

-- #4 Find customers NOT in the USA or UK
SELECT
    company_name,
    country
FROM customers
WHERE 
    country NOT IN ('USA', 'UK');

-- #5 Find products with "Ch" in the name priced under $25
SELECT
    product_name,
    unit_price
FROM products
WHERE
    product_name LIKE 'Ch%' AND unit_price < 25;

-- Step 3 · Break it
-- #1
SELECT *
FROM customers
-- WHERE company_name LIKE 'A'; -- wrong, no wild card %
WHERE company_name LIKE 'A%'; -- correct, with wildcard % looking for staring with A

-- #2
SELECT *
FROM orders
-- WHERE order_date BETWEEN '1998-01-01' AND '1997-01-01'; -- wrong, start with previous year
WHERE order_date BETWEEN '1997-01-01' AND '1998-01-01'; -- correct, ideal sequence

-- #3
SELECT *
FROM customers
-- WHERE country IN 'Germany', 'France'; -- wrong, should be with parethesis
WHERE country IN ('Germany', 'France'); -- correct format

-- Step 4 · Apply it
-- #1 Country watchlist. "Pull me all orders shipped to Canada, 
-- Brazil, or Argentina in 1997. Just order ID, ship country, and order date."
SELECT
    order_ID,
    ship_country,
    order_date
FROM orders
WHERE
    ship_country IN ('Canada', 'Brazil', 'Argentina')
    AND order_date BETWEEN '1997-01-01' AND '1997-12-31'
ORDER BY order_date DESC;  

-- #2 Alphabet distribution check. "Show me every customer whose company name starts
-- with a vowel (A, E, I, O, U). I am cross-referencing alphabet distribution for the audit."
SELECT
    company_name,
    country
FROM customers
WHERE company_name LIKE 'A%'
    OR company_name LIKE 'E%'
    OR company_name LIKE 'I%'
    OR company_name LIKE 'O%'
    OR company_name LIKE 'U%';

-- #3 Pricing tier validation. "Give me products priced between $15 and $40 with 'crab',
-- 'shrimp', or 'salmon' in the name. Catalog team wants to validate seafood pricing tier."
SELECT
    product_name,
    unit_price
FROM products
WHERE
    unit_price BETWEEN 15 AND 40 
    AND (product_name LIKE '%Crab%'
    OR product_name LIKE '%Shrimp%'
    OR product_name LIKE '%Salmon%');
    
