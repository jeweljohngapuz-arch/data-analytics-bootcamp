3 Mental Reading Methods Analysts Use
1️⃣ Structure Reading (Top-Down)

Goal: understand the purpose of the script before the details.

Ask:

What question is this code answering?

What dataset is being used?

What result should appear?

Example code:

total = 0
for sale in revenues:
    total += sale

print(total)

Structure view:

Start result container
Loop through data
Accumulate numbers
Output result

Meaning:

Calculate total revenue

You ignore small details first.

2️⃣ Flow Reading (Step-by-Step)

Goal: follow what happens line by line.

Example:

total = 0

Meaning:

Create container to store result

Next line:

for sale in revenues:

Meaning:

check each sale one by one

Next:

total += sale

Meaning:

add sale to running total

Final:

print(total)

Meaning:

show final result

Flow summary:

start at 0
check each sale
keep adding
print final revenue

This is the method you currently use — and it's correct for beginners.

3️⃣ Pattern Reading (Fast Recognition)

This is what experienced analysts do.

They instantly recognize patterns.

Example code:

total = 0
for sale in revenues:
    total += sale

They immediately think:

SUM pattern

Business meaning:

total revenue

Another example:

if revenue > 500:
    category = "High"

They instantly think:

classification pattern

Business meaning:

high value sale
How These 3 Methods Work Together

When you read code:

Step 1

Structure

What is the script doing?
Step 2

Flow

How does each line contribute?
Step 3

Pattern

What known pattern is this?

Example:

Script purpose → total revenue
Flow → loop adding numbers
Pattern → SUM pattern
How You Should Use This During Weekday Learning

When reading your exercises:

Step 1

Ask:

What is the goal?

Example:

calculate average sale
Step 2

Read line by line

container
loop
calculation
result
Step 3

Label the pattern

Example:

SUM
COUNT
MAX
AVERAGE
CLASSIFICATION

Write this in your analyst_log.md

Example:

Pattern used: SUM
Business meaning: total revenue
How This Helps Your Weekly Review

Weekend review becomes easy.

Instead of reviewing 7 days of code, you review patterns.

Example weekly summary:

Patterns learned this week
• LOOP
• SUM
• CONDITION
• METRIC CALCULATION
• PIVOT

Then practice one small problem for each.

This is the 80/20 way to review.

Reality Check (important)

Jewel — the goal is not memorizing syntax.

The real skill is recognizing:

analysis pattern

Examples analysts use daily:

SUM revenue
COUNT customers
MAX sale
AVG order value
GROUP revenue by category

Your current training is building those patterns.