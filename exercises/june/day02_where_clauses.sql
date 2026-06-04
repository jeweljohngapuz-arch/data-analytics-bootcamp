-- STEP 1 - SEE IT
SELECT
    company_name,
    country
FROM
    customers
WHERE country = 'Germany';

-- STEP 2 - TYPE IT
-- #1 Get customers from Germany
SELECT 
    company_name,
    contact_name,
    contact_title,
    country,
    city,
    phone
FROM customers
WHERE country = 'Germany';

-- #2 Get products over $30
SELECT 
    product_name,
    unit_price
FROM products
WHERE unit_price > 30;

-- #3 Get orders placed in 1997
SELECT
    order_id,
    customer_id,
    order_date
FROM orders
WHERE order_date BETWEEN '1997-01-01' AND '1997-12-31';

-- #4 Get products that are NOT discontinued
SELECT
    product_id,
    product_name,
    unit_price,
    units_in_stock
FROM products
WHERE discontinued = 0; -- 0 means active, 1 means discontinued

-- #5 Get expensive non-discontinued products
SELECT
    product_id,
    product_name,
    unit_price,
    units_in_stock
FROM products
WHERE discontinued = 0 AND unit_price > 20;

-- STEP 3 - BREAK IT
-- #1 What will PostgreSQL say?
-- wrong
SELECT *
FROM customers
WHERE country = Germany;

-- correct
SELECT *
FROM customers
WHERE country = 'Germany';

-- #2 What will PostgreSQL return?
-- wrong
SELECT COUNT(*)
FROM orders
WHERE shipped_date  = NULL; -- NULL is not a value - its an absence of value.

-- correct
SELECT COUNT(*) -- COUNT(*) is the aggregator
FROM orders
WHERE shipped_date  IS NULL; -- IS NULL is the filter
-- null means unknown. you cant compare unknown to anything.
-- sql doesn't return true or false, it returns unknown. 
-- using IS NULL finds the rows with NULL. 



-- #3 Does this return only active products?
-- wrong 
SELECT product_name
FROM products
WHERE unit_price > 20 OR unit_price < 10 AND discontinued = 0;

-- correct
SELECT
    product_name,
    unit_price,
    discontinued
FROM products
WHERE (unit_price > 20 OR unit_price < 10)
AND discontinued = 0;
-- sql reads the AND first then the OR
-- firstly, it means find non discontinued product
-- secondly, it means find the expensive or the cheapest active products

-- ALWAYS WRAP 'OR' CONDITION TO MAKE THE INTENT EXPLICIT

-- AND is like multiplication, OR is like addition. 
-- in math 2+3x4 =! to 20 its = 14 (4x3=12 + 2)
-- (2+3)x4 = 20

-- STEP 4 - APPLY IT
-- #1 Geography focus. "Which of our customers are in France? I need company name and contact person for my call list."
SELECT
    company_name,
    contact_name,
    contact_title,
    phone
FROM customers
WHERE country = 'France'
ORDER BY contact_title;

-- #2 Value + time window. "Show me all orders from Q4 1997 with freight over $100. I want to see which big-ticket shipments closed at year-end."
SELECT
    order_id,
    customer_id,
    order_date,
    freight
FROM orders
WHERE order_date BETWEEN '1997-10-01' AND '1997-12-31'
AND freight > 100
ORDER BY freight DESC;

-- #3 Inventory audit. "Find products where units_in_stock is 0 OR discontinued is 1. We have a stocking-gap conversation tomorrow."
SELECT
    product_id,
    product_name,
    unit_price,
    units_on_order,
    units_in_stock,
    discontinued
FROM products
WHERE units_in_stock = 0 OR discontinued = 1;
/* 
findings: the inventory has discrepancy.
product ID 9, 4, 7 still has stock on hand but already discontinued
product ID 31 has zero stock but still active product.  

consequences: product ID 9, 4, 7 used up space in the storage and are expiring 
and leading to more serious food safety issue.

actions: free up space and dispose/repurpose the discontinued items for new products.

The format:
"[What happened] — [why it matters] — [recommended action]."

insight:
Three discontinued products retain warehouse stock, creating storage and 
food safety risk; one active product (ID 31) shows zero inventory, 
risking missed sales. Recommend clearing discontinued items and 
prioritizing a restock of Product 31 before the next ordering cycle.

*/