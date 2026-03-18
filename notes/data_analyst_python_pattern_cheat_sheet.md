DATA ANALYST PYTHON PATTERN CHEAT SHEET (80/20)
1. Loop Through Dataset

Purpose: process every row

for row in dataset:
    print(row)

Analyst meaning

read every transaction

Example:

scan all sales records
2. Calculate Metric Per Row

Purpose: derive a new value

revenue = units * price

Analyst meaning

calculate a metric

Examples:

revenue
profit
margin
3. Sum Values (Total Metric)
total = 0

for value in numbers:
    total += value

Analyst meaning

total revenue
total sales
total units

Mental shortcut:

SUM(values)
4. Count Records
count = 0

for row in dataset:
    count += 1

Analyst meaning

number of transactions
number of customers

Mental shortcut:

COUNT(rows)
5. Average Calculation
average = total / count

Analyst meaning

average sale
average order value

Mental shortcut:

AVG(values)
6. Find Maximum Value
highest = 0

for value in numbers:
    if value > highest:
        highest = value

Analyst meaning

largest transaction
top revenue

Mental shortcut:

MAX(values)
7. Find Minimum Value
lowest = numbers[0]

for value in numbers:
    if value < lowest:
        lowest = value

Analyst meaning

smallest transaction
lowest price

Mental shortcut:

MIN(values)
8. Classification (Segmentation)
if revenue > 500:
    category = "High"
else:
    category = "Normal"

Analyst meaning

customer segmentation
transaction classification

Examples:

high value sale
low value sale
9. Build a Metric Column
revenues = []

for row in dataset:
    revenue = row["units"] * row["price"]
    revenues.append(revenue)

Analyst meaning

create a new column

Examples:

revenue column
profit column
10. Group and Aggregate (Mini Pivot)
revenue_by_product = {}

for row in dataset:
    product = row["product"]
    revenue = row["units"] * row["price"]

    revenue_by_product[product] = revenue_by_product.get(product, 0) + revenue

Analyst meaning

group by product
sum revenue

Equivalent to SQL:

GROUP BY product
SUM(revenue)
The Analyst Thinking Model

Always think in this order:

Question
↓
Metric
↓
Summarize
↓
Group
↓
Rank
↓
Insight

Example:

Question: Which product generates most revenue?
Metric: revenue
Summarize: total revenue
Group: by product
Rank: highest to lowest
Insight: laptop drives most revenue
How to Use This During Weekday Learning

When you see code, ask:

Which pattern is this?

Example:

total += value

Label it:

SUM pattern

Write in your analyst_log.md

Pattern used: SUM
Purpose: total revenue
How to Use This During Weekly Review

Weekend review becomes simple.

Step 1

List patterns used this week.

Example:

loop
sum
condition
metric calculation
Step 2

Write them from memory.

Example:

SUM pattern
MAX pattern
LOOP pattern
Step 3

Create one small exercise.

Example:

find highest sale
Step 4

Write one insight.

Example:

Laptop generated the highest revenue.
The 80/20 Truth

You don’t need hundreds of techniques.

These 10 patterns cover most beginner data analysis scripts.

If you master these, you can already do things like:

total revenue
average sale
highest transaction
sales classification
revenue by product

Which are real entry-level analyst tasks.