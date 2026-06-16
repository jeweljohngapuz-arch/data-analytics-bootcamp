-- result 830
SELECT COUNT(*)
FROM orders;

-- result 809
-- COUNT(with specific column) skips NULLs
SELECT COUNT(shipped_date)
FROM orders;

-- STEP 2 - TYPE IT
-- #1 Count total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- #2 Sum all freight costs
SELECT SUM(freight) AS total_freight
FROM orders;

-- #3 Average product price
SELECT ROUND(AVG(unit_price),2) AS avg_price
FROM products;

-- findings:
-- 

-- #4 Find cheapest and most expensive products
SELECT
    MIN(unit_price) AS cheapest,
    MAX(unit_price) AS most_expensive
FROM products;

-- findings:
-- the cheapest we have is 2.50 and the most expensive is 263.50

-- #5 Count orders AND sum freight in one query:
SELECT
    COUNT(*) AS orders_count,
    SUM(freight) AS total_freight,
    ROUND(AVG(freight), 2) AS avg_freight
FROM orders;

-- findings: 
-- we have 830 order count. the total freight cost 103,524.59 and 
-- the average freight cost per order is 124.73. 

-- STEP 3 - BREAK IT
-- #1 Will this return 91 (total customers)?
SELECT
    -- good 
    COUNT(region) AS only_region_column, -- skipped the NULL value
    -- better version
    -- always use this

    -- industry standard use because it counts the total/all transactions
    COUNT(*) AS total_region -- will return everything even with NULL
FROM customers;

-- #2 What will PostgreSQL say?
SELECT 
    -- wrong
    -- reason: -- SUM() only works in numeric values.
    -- SUM(company_name)

    -- COUNT() works even MIN and MAX in none numeric value
    COUNT(company_name)
FROM customers;

-- #3 What will PostgreSQL say?
SELECT
    --  No mixing of single aggregate result with a individual row value
    product_name, -- e.g. of individual  row value (has whole column result )
    AVG(unit_price) -- e.g. of single aggregate value (has 1 value for the whole column)
FROM products;

-- STEP 4 - APPLY IT
-- #1 Three KPIs. "How many orders, total freight, and average 
-- freight per order? I need these three numbers for my board report."
SELECT
    COUNT(*) AS order_count, -- finding for volume of orders
    SUM(freight) AS total_freight, -- finding for the cost of freight
    ROUND(AVG(freight), 2) AS average_freight -- finding for the average cost of freight
FROM orders;

-- #2
/*Price spread. "What is the cheapest and most expensive 
product we sell? Just two numbers — I want to see our price range at a glance."*/

/*this version shows the price spread with the product name but without the 
label of the cheapest/most_expensive*/ 
SELECT
    product_name,
    unit_price
FROM products
WHERE unit_price = (SELECT MIN(unit_price) FROM products)
OR unit_price = (SELECT MAX(unit_price) FROM products)
ORDER BY unit_price;

-- simplest way to present the price spread
SELECT
    MIN(unit_price) AS cheapest,
    MAX(unit_price) AS most_expensive
FROM products;

-- #3
/* Data-quality KPI. "How complete is our customer data? Tell me total customer count vs 
how many have region filled in. I am flagging data-quality issues for the audit committee.*/

SELECT
    COUNT(*) AS total_customer_count, -- counts all rows regardless of NULL 
    COUNT(region) AS total_has_region, -- counts only the rows w/o NULLs

    COUNT(*) - COUNT(region) AS total_has_missing_region,
    ROUND(100.0 * (COUNT(*) - COUNT(region)) / COUNT(*), 1) AS percent_of_missing_region
FROM customers;

-- On average, each freight cost $124.73. Across 830 orders, that's $103,524 
-- in total freight spend. Do you have prior period to compare against? that would
-- let express these as trends rather than absolutes?

/*The cheapest product is Geitost at $2.50 a cheese, the most expensive is 
Côte de Blaye at $263.50 a red wine — a 105x price gap. Let me know if you'd 
like the average or median alongside this.*/

/*Total customers: 91. Region filled: 29 (32%). Missing: 62 (68%) — flagged 
as a data-quality gap for the audit committee.*/



