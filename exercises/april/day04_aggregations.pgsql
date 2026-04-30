-- Step 1 · See it
-- What you should see: COUNT(*) returns 830. COUNT(shipped_date) returns
-- a smaller number (orders not yet shipped have NULL shipped_date).
SELECT COUNT(*)
FROM orders;

SELECT COUNT(shipped_date)
FROM orders;

-- Step 2 · Type it
-- #1 Count total orders
-- COUNT(*) counts every row regardless of NULL values. 
-- AS gives the result column a readable name — always alias aggregates.
SELECT COUNT(*) AS total_orders
FROM orders;

-- #2 Sum all freight costs
-- SUM adds up every non-NULL value in the column. 
-- This is how a BI analyst calculates total revenue, total cost, total anything.
SELECT SUM(freight) AS total_freight
FROM orders;

-- #3 Average product price
-- AVG = SUM / COUNT of non-NULL values. PostgreSQL returns a decimal.
-- Round with ROUND(AVG(unit_price), 2) for clean reporting.
SELECT AVG(unit_price) AS avg_price
FROM products;

-- #4 Find cheapest and most expensive products
-- MIN and MAX work on numbers, dates, and text.
-- MIN(order_date) = earliest order. MAX(order_date) = most recent.
SELECT 
    MIN(unit_price) AS cheapest,
    MAX(unit_price) AS most_expensive
FROM products; 

-- #5 Count orders AND sum freight in one query
SELECT
    COUNT(orders) AS order_count,
    SUM(freight) AS total_freight,
    -- AVG(freight) AS avg_freight  -- use no ROUND() when rough draft or checking only
    ROUND(AVG(freight), 2) AS avg_freight -- use ROUND() for final output only.
FROM orders;

-- Step 3 · Break it
-- #1 Will this return 91 (total customers)?
-- NULL trap. COUNT(*) = 91 (every customer). COUNT(region) = 31 (only customers 
-- with non-NULL region). The 60-row gap is the silent bug.

 -- SELECT COUNT(*) -- counts all rows even NULL value 
 SELECT COUNT(region) AS has_region -- counts only rows with value
FROM customers;

-- #2 What will PostgreSQL say?
-- SUM, AVG, MIN, MAX on text columns: SUM and AVG fail. MIN and 
-- MAX work (alphabetical order). COUNT works on any type.
SELECT
-- SUM(company_name) -- SUM works only on numeric value
COUNT(company_name) AS company_total -- COUNT works on any type
FROM customers;

-- #3 What will PostgreSQL say?
-- Aggregates collapse many rows into one. You cannot mix a single aggregate result 
-- with individual row values unless you GROUP BY. This error previews tomorrow's lesson.
SELECT
    -- product_name, - no mixing of aggregate table and individual row value
    AVG(unit_price) products
FROM
    products;

-- Step 4 · Apply it
-- #1 Three KPIs. "How many orders, total freight, and average freight per order? 
-- I need these three numbers for my board report."
SELECT
    COUNT(*) AS order_count,
    SUM(freight) AS total_freight,
    ROUND(AVG(freight), 2) AS avg_freight_per_order
FROM orders;

-- #2 Price spread. "What is the cheapest and most expensive product we sell?
-- Just two numbers — I want to see our price range at a glance."
SELECT 
    MIN(unit_price) AS cheapest_product,
    MAX(unit_price) AS most_expensive_product
FROM products;

-- #3 Data-quality KPI. "How complete is our customer data? Tell me total customer count 
-- vs how many have region filled in. I am flagging data-quality issues for the audit committee."
SELECT
    COUNT(*) AS total_customer_count,
    COUNT(region) AS has_region,
    COUNT(*) - COUNT(region) AS missing_region
FROM customers;