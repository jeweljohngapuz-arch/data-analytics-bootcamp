-- STEP 1

-- count and group customers per country
SELECT 
    ship_country,
    COUNT(*) AS order_count
FROM orders
GROUP BY ship_country 
ORDER BY order_count DESC;

-- STEP 2

-- #1 count and group customers per country
SELECT 
    country,
    COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

-- #2 sum and group total freight by its ship country
SELECT
    ship_country,
    SUM(freight) AS total_freight
FROM orders
GROUP BY ship_country
ORDER BY total_freight DESC;

-- #3 Average product price by category
SELECT
    category_id,
    ROUND(AVG(unit_price), 2) AS average_product_price,
    COUNT(*) AS product_count
FROM products
GROUP BY category_id
ORDER BY average_product_price DESC;

-- #4 Countries with more than 10 orders (HAVING)
SELECT
    ship_country,
    COUNT(*) AS order_count
FROM orders
GROUP BY ship_country
HAVING COUNT(*) > 10
ORDER BY order_count DESC;

-- #5 Countries where average freight exceeds $50
SELECT
    ship_country,
    ROUND(AVG(freight), 2) AS average_freight,
    COUNT(*) AS order_count
FROM orders
GROUP BY ship_country
HAVING AVG(freight) > 50
ORDER BY average_freight DESC;

-- STEP 3 

--#1
SELECT
    ship_country,
    COUNT(*)
FROM orders
GROUP BY ship_country;
 -- fix: either remove customer_id in SELECT or add customer_id in GROUP BY.

 -- #2
 SELECT
    ship_country,
    COUNT(*) AS order_count
FROM orders
WHERE freight > 50 -- use before GROUP BY
GROUP BY ship_country
HAVING COUNT(*) > 10 -- use after GROUP BY
ORDER BY order_count DESC;
-- fix: execution order - use WHERE before GROUP BY, use HAVING after GROUP BY.
-- because WHERE works in individual  rows, HAVING works in group results.

-- #3
SELECT
    ship_country,
    COUNT(*) as order_count
FROM orders
GROUP BY ship_country
ORDER BY order_count DESC;

-- STEP 4 APPLY IT

/*#1 Volume by country. "Show me which countries 
place the most orders — country and order count, top 5."*/ 
SELECT
    ship_country,
    COUNT(*) AS order_count
FROM orders
GROUP BY ship_country
ORDER BY order_count DESC
LIMIT 5;

-- findings/insight
/*USA has 117 orders. if USA churns, revenue drops more than any other country
sales should monitor USA account health closely.*/


/*#2 Two-criteria HAVING — quality threshold (≥5 orders) plus cost 
threshold (>$50). Filters statistical noise from real signal.*/
SELECT 
    ship_country,
    ROUND(AVG(freight), 2) AS average_freight,
    COUNT(*) AS order_count
FROM orders
GROUP BY ship_country
HAVING AVG(freight) > 50 AND COUNT(*) > 5 -- HAVING does not work with AS alias
ORDER BY average_freight DESC;

-- HAVING = no AS aliases, ORDER BY = aliases AS fine.

-- findings/insight
/*Ship countries are mostly European. average cost 147.54 high and 107.58 low. 
the top 3 on the list has high average cost and below 50 order count. 
sales should pull per-order revenue for these countries to confirm a 
high-value-order pattern before committing expansion budget.*/

/*#3 Premium pricing tiers. "Which product categories average more than $30 per item?
Category ID, avg price, and product count. Helps me see where premium pricing lives."
*/
SELECT
    category_id,
    ROUND(AVG(unit_price), 2) AS average_cost,
    COUNT(*) AS product_count
FROM products
GROUP BY category_id
HAVING AVG(unit_price) > 30
ORDER BY average_cost DESC;

-- findings/insight
/*Three categories average over $30 per item, led by category 6 at $54.01 across 
6 products — these represent the premium pricing tier and are the categories 
to prioritize when analyzing margin contribution.*/