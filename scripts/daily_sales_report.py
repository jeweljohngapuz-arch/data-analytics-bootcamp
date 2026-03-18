# Script: daily_sales_report.py
# Author: Jewel
# Lesson: Day08 – Automated Analysis
# Description:
# Generates basic sales analysis report

print(f"Daily Sales report")
print("-------------------")

revenues = [503, 120, 3200, 150, 4500]

print(f"Transactions: {len(revenues)}")

total_sale = 0

# calculate total revenue
for sale in revenues:
    total_sale += sale

print(f"Total Revenue: ${total_sale}")

# calculate average sale
average_sale = total_sale / len(revenues)
print(f"Average Sale: ${average_sale:.2f}")

# calculate highest sale
highest_sale = revenues[0]

for sale in revenues:

    if sale > highest_sale:
        highest_sale = sale

print(f"Highest Sale: ${highest_sale}")