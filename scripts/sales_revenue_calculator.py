# Script: sales_revenue_calculator.py
# Author: Jewel
# Lesson: Day01 – Dataset Revenue Logic
# Description:
# Calculates revenue from a sales transaction

# CREATE A MINI TOOL
# store's client details and transaction information
customer_name = "Jewel"
product_name = "4-plex real property"
units = 6
price = 300000

# calculate revenue
revenue = units  * price

# print the results
print(f"Customer's name: {customer_name}")
print(f"Product's name: {product_name}")
print(f"Units sold: {units}")
print(f"Price per unit: ${price}")
print(f"Total revenue from the transaction: ${revenue}")

