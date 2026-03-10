# Script: sales_list_summary.py
# Author: Jewel
# Lesson: Day03 – Lists
# Description:
# Summarizes revenue from multiple sales

# store revenue list
revenues = [320, 530, 210, 232, 452, 999]
print(f"Revenue List: {revenues}")
print()

# calculate total revenue
total_revenue = sum(revenues)
print(f"Total Revenue: {total_revenue}")

# calculate average sale
average_sale = total_revenue / len(revenues)
print(f"Average Sale: {average_sale:.2f}")

# find the highest sale
highest_sale = max(revenues)
print(f"Highest Sale: {highest_sale}")
