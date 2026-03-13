# Script: sales_metrics.py
# Author: Jewel
# Lesson: Day07 – Functions
# Description:
# Provides reusable sales analysis functions

revenues = [50, 1200, 300, 150, 400]

# function for calculating total revenue
def calculate_total_revenue(revenues):

    total_revenue = 0

    for sale in revenues:
        total_revenue += sale 

    return total_revenue


# function for calculating average sale
def calculate_average_sale(revenues):

    total_revenue = calculate_total_revenue(revenues)

    total = total_revenue / len(revenues)

    return total

# function for calculating the highest sale
def calculate_highest_sale(revenues):

    # meaning: Start by assuming the first value is the highest. which is 50 the first value.
    highest_sale = revenues[0]
    
    # for sale in revenues: means go through the list one number at a time.
    for sale in revenues:
        # means: Is the current number bigger than the highest so far?
        # if bigger, replace
        if sale > highest_sale:
            # If the current sale is bigger, make it the new highest sale.
            highest_sale = sale
    # means: Send back the final biggest number.
    return highest_sale

total_revenue = calculate_total_revenue(revenues)
print(f"Total Revenue: ${total_revenue}")

average_sale = calculate_average_sale(revenues)
print(f"Average Sale: {average_sale}")

highest_sale = calculate_highest_sale(revenues)
print(f"Highest Sale: ${highest_sale}")