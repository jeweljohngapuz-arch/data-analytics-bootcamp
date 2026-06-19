-- STEP 1 - SEE IT
SELECT
    o.order_id,
    p.product_name,
    od.unit_price * od.quantity AS line_total
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id
LIMIT 10;

-- STEP 2 - TYPE IT

-- #1 Full order line items: order + detail + product
SELECT
    o.order_date,
    p.product_name,
    od.quantity,
    ROUND((od.unit_price * od.quantity)::numeric, 2) AS line_total -- multiple lines
            --IS ASKING FOR BREAKDOWN OR ORDER LINE
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id
ORDER BY o.order_id
LIMIT 20;

-- #2 Revenue by product category (4 tables)

-- my answer
SELECT 
    c.category_name,
    ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS total_revenue -- total line
        -- IS ASKING FOR TOTAL OF THE BREAKDOWN
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
JOIN order_details od
    ON od.product_id = p.product_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;

-- lesson answer
SELECT
    cat.category_name,
    ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS total_revenue
        -- IS ASKING FOR TOTAL OF THE BREAKDOWN
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
JOIN categories cat
    ON p.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY total_revenue DESC;

/* 
**IMPORTANT**

REVENUE FORMULA unit_price * quantity

ROUND((od.unit_price * od.quantity)::numeric, 2) AS line_total
    IS ASKING FOR BREAKDOWN OR ORDER LINE

ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS total_revenue -- total line
    IS ASKING FOR TOTAL OF THE BREAKDOWN

*/

-- #3 Customer name + order details (3 tables)
SELECT
    c.company_name,
    o.order_id,
    o.order_date,
    COUNT(od.product_id) AS items_ordered
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON od.order_id = o.order_id
GROUP BY  c.company_name, o.order_id, o.order_date
ORDER BY order_date DESC
LIMIT 15;

-- #4 Top 10 products by total revenue
SELECT 
    p.product_name,
    c.category_name,
    ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS total_revenue,
        -- IS ASKING FOR TOTAL OF THE BREAKDOWN
    SUM(od.quantity) AS units_sold
        -- ASKING FOR THE TOTAL OF EACH PRODUCT
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
JOIN categories c
    ON c.category_id = p.category_id
GROUP BY p.product_name, c.category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- #5 Employee sales performance with customer count
SELECT *
FROM employees;

SELECT
    e.first_name || ' ' || e.last_name AS employee_name,
    COUNT(DISTINCT o.order_id) AS order_count,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM employees e
JOIN orders o
    ON e.employee_id = o.employee_id
GROUP BY e.first_name, e.last_name
ORDER BY order_count DESC;

-- STEP 3 - BREAK IT

/* #1 
SELECT
    o.order_id,
    p.product_name,
    od.quantity
FROM orders o
JOIN order_details od
ON o.order_id = od.order_id
LIMIT 10;

*/
SELECT 
    o.order_id,
    p.product_name,
    od.quantity
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
JOIN products p
    ON p.product_id = od.product_id
LIMIT 10;

/* #2
SELECT
    o.order_id,
    p.product_name,
    od.quantity
FROM orders o, order_details od, products p
LIMIT 10;
*/
SELECT
    o.order_id,
    p.product_name,
    od.quantity
FROM orders o
JOIN order_details od
    ON od.order_id = o.order_id
JOIN products p
    ON p.product_id = od.product_id
LIMIT 10;

/* #3
SELECT
    c.category_name,
    SUM(od.unit_price * od.quantity) AS revenue
FROM order_details od
JOIN products p
ON od.product_id = p.product_id
JOIN categories c
ON p.category_id = c.category_id;
*/
SELECT
    c.category_name,
    SUM(od.unit_price * od.quantity) AS revenue
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
GROUP BY c.category_name
LIMIT 10;

-- STEP 4 - APPLY IT

/* 
Ask 1 — Category performance. "Which product categories generated the most revenue
last year? Category name, total revenue, and number of orders — sorted by 
revenue, top to bottom."
*/
SELECT
    c.category_name,
    ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS total_revenue,
    COUNT(DISTINCT od.order_id) AS number_of_orders
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
JOIN categories c
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;

/* 
Ask 2 — Employee performance. "Show me each employee's total orders and total revenue.
Sorted by revenue. Helps me see who is driving the top line."
*/
SELECT *
FROM employees
LIMIT 5;

SELECT
    e.first_name || ' ' || e.last_name AS employee_name,
    ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS total_revenue,
    COUNT(DISTINCT od.order_id) AS total_order
FROM employees e
JOIN orders o
    ON e.employee_id = o.employee_id
JOIN order_details od
    ON od.order_id = o.order_id
GROUP BY e.first_name, e.last_name
ORDER BY total_revenue DESC;

/* 
Ask 3 — Customer concentration. "Top 5 customers by total revenue. Company name, 
total revenue, and number of distinct products purchased."
*/
SELECT *
FROM order_details
LIMIT 5;

SELECT
    c.company_name,
    ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS total_revenue,
    COUNT(DISTINCT od.product_id) AS unique_products
FROM customers c
JOIN orders o
    ON o.customer_id = c.customer_id
JOIN order_details od
    ON od.order_id = o.order_id
GROUP BY c.company_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT
    c.company_name,
    o.order_date,
    p.product_name
FROM customers c
LEFT JOIN orders o
    ON o.customer_id = c.customer_id
LEFT JOIN order_details od
    ON od.order_id = o.order_id
LEFT JOIN products p
    ON p.product_id = od.product_id;