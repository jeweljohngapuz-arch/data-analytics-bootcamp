# Script: revenue_loop_calculator.py
# Author: Jewel
# Lesson: Day06 – Loops
# Description:
# Calculates total revenue using loop automation

revenues = [50, 12400, 300, 4500, 900]

revenue_total = 0

for revenue in revenues:
    revenue_total += revenue

average_sale = revenue_total / len(revenues)

print(f"Total Revenue: ${revenue_total}")
print(f"Average Sale: ${average_sale:.0f}")

# Insight:
# The dataset generated $181,150 total revenue with an average sale of $3,630.