The 5 Core Analyst Question Types (80/20)

These cover most beginner analyst work.

1️⃣ Total Question

Purpose: measure overall scale.

Example questions:

What is total revenue?

How many transactions occurred?

What is the total number of customers?

Typical metric:

SUM
COUNT

Python pattern:

total = 0
for value in numbers:
    total += value

Business output example:

Total revenue this week is $9,205.

2️⃣ Average Question

Purpose: understand typical behavior.

Example questions:

What is the average sale value?

What is the average price per unit?

Metric:

AVERAGE

Pattern:

average = total / count

Business output example:

The average transaction value is $420.

3️⃣ Comparison Question

Purpose: compare categories.

Example questions:

Which product generates the most revenue?

Which region sells the most units?

Metric:

GROUP + SUM

Python concept:

group by category
aggregate metric

Equivalent tools:

Excel → Pivot Table
SQL → GROUP BY
Python → dictionary aggregation

Business output example:

Laptop sales generate the highest revenue.

4️⃣ Ranking Question

Purpose: identify best and worst performers.

Example questions:

What is the highest sale?

Which product is the top performer?

Metric:

MAX
MIN
SORT

Pattern example:

if value > highest:
    highest = value

Business output example:

The highest transaction recorded is $5,000.

5️⃣ Segmentation Question

Purpose: classify data into groups.

Example questions:

Which sales are high value?

Which customers are low activity?

Pattern:

if revenue > 500:
    category = "High"
else:
    category = "Normal"

Business output example:

40% of transactions are high-value sales.

The Hidden Pattern

All 5 question types follow your system:

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

This thinking model is the backbone of analyst workflows.

How This Helps Your Weekly Review

When reviewing Day01–Day07, categorize each lesson.

Example:

Day01 → Total question
Day02 → Segmentation
Day03 → Average
Day04 → Comparison
Day05 → Comparison (Pivot)
Day06 → Total pattern
Day07 → Metric calculation

This compresses 7 lessons → 5 patterns.

That is the 80/20 review.

Your Rule for Weekday Learning

When you see a new exercise, ask:

Which of the 5 question types is this?

Then apply the pattern.

Example:

Question: Which product generates the most revenue?
Type: Comparison
Pattern: group + sum

Now the problem is already half solved.

Your Action Now (no more theory)

For your Saturday review, do only this:

Step 1 — List patterns used this week
SUM
AVG
CLASSIFICATION
GROUP
MAX
Step 2 — Write one tiny example for each

Example:

SUM → total revenue
MAX → highest sale
AVG → average sale
Step 3 — Write 3 insight sentences

Example:

Laptop generated the highest revenue in the dataset.

Total time:

45–60 minutes