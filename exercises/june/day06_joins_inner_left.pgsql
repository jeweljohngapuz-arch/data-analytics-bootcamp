-- STEP 1

/*10 rows showing company_name from 
customers matched with order_id and order_date from orders.*/
SELECT
    c.company_name,
    o.order_id,
    o.order_date
FROM customers c
INNER JOIN  orders o
    ON c.customer_id = o.customer_id
LIMIT 10;

-- STEP 2

-- #1 Join customers to their orders
SELECT
    c.company_name,
    o.order_id,
    o.order_date
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC
LIMIT 15;

-- #2 Find customers who have NEVER placed an order
SELECT
    c.customer_id,
    c.company_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


/* 

** KEEP IN MIND **
INNER JOIN - mainly show the activity
are filtered. Only rows where both sides have a match come through. 
Incomplete pairs are dropped.

LEFT JOIN - mainly shows what's missing. gaps/churn everything including zeros/NULL.
no filter on the left side. Every row from the FROM table comes through no matter what. 
If there's a match on the right, you get real data. If there's no match, you get NULL.

LEFT JOIN IS THE DEFAULT JOIN. SAFER THAN INNER JOIN

FROM - use from  if the table has the foreigh keys that touch everything else.
* start at the table that holds the IDs connecting everything. its the bridge.

** FROM is the left side most and important detail like product name.

** IMPORTANT **
kitchen (building the data) - FROM > JOIN > WHERE > GROUP BY > HAVING
dining room (presenting the data) - SELECT > ORDER BY > LIMIT

**
NO MIXING OF INNER AND LEFT JOIN. 
USE LEFT ALL THE WAY OR USE INNER ALL THE WAY
IF NEEDED IT SHOULD START WITH INNER. 
**

*/


-- #3 Get product names with their category names
SELECT 
    p.product_name,
    c.category_name,
    p.unit_price
FROM products p
LEFT JOIN categories c
    ON c.category_id = p.category_id
ORDER BY c.category_name, p.product_name;

-- #4 Get order line items with product names
SELECT
    o.order_id,
    p.product_name,
    od.unit_price,
    od.quantity
-- FROM is table 1. this has foreign keys that touch everything
-- this table shows the order lines/details of an order in order_details table
FROM order_details od
-- table 2. 
-- this table, we pull the product name here
INNER JOIN products p
    ON od.product_id = p.product_id 
-- table 3. 
-- this shows where the order is
INNER JOIN orders o
    ON od.order_id = o.order_id
LIMIT 15;

-- #5 Count orders per customer with LEFT JOIN
SELECT
    c.company_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.company_name
ORDER BY order_count DESC;

--  products that were never ordered
SELECT
    p.product_name
FROM products p
LEFT JOIN order_details od
    ON p.product_id = od.product_id
WHERE od.product_id IS NULL;

SELECT
    p.product_name
FROM order_details od
LEFT JOIN products p
    ON p.product_id = od.product_id
WHERE od.quantity IS NULL;

-- STEP 3 - BREAK IT

-- #1 always use alias in JOIN
SELECT 
    c.customer_id,
    c.company_name,
    o.order_id
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
LIMIT 5;

-- #2 always use ON to connect together tables
SELECT
    c.company_name,
    o.order_id
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

-- #3 always use the same foreign keys available in tables to connect.
SELECT
    c.company_name,
    o.order_id
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
LIMIT 5;

-- STEP 4 APPLY IT

/* 
#1 Dormant customers. "Which of our customers have never placed an order?
Company name and contact person — I want to reach out."
*/
SELECT
    c.company_name,
    c.contact_name,
    c.country,
    c.phone
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY contact_name;

/* 
#2 Top-engaged customers. "Top 10 customers by total orders placed. 
Company name and order count."
*/

SELECT
    c.company_name,
    c.country,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.company_name, c.country
ORDER BY order_count DESC
LIMIT 10;

/* 
#3 Unsold catalog. "Are there products in our catalog that have never appeared 
on an order? Product name and price."
*/
SELECT
    p.product_name,
    p.unit_price
FROM products p
LEFT JOIN order_details od
    ON p.product_id = od.product_id
WHERE od.order_id IS NULL;

SELECT
    p.product_name,
    COUNT(od.order_id) AS order_count
FROM products p
LEFT JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY order_count DESC;

SELECT
    p.product_name,
    COUNT(od.order_id) AS order_count
FROM products p
INNER JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY order_count DESC;

