# Script: dataset_revenue_summary.py
# Author: Jewel
# Lesson: Day10 – Dataset Revenue Summary
# Description:
# Reads sales dataset and calculates summary metrics

import csv

# Load dataset
with open("datasets/raw/sales_data.csv") as file:
    reader = csv.DictReader(file)

    # Important Variables 
    total_revenue = 0
    total_units_sold = 0
    total_transactions = 0
    highest_sale = 0 

    # Run every row / trasaction
    for row in reader:

        # Convert rows to variables
        customer = row["customer"]
        product = row["product"]
        units = int(row["units"])
        price = int(row["price"])
        region = row["region"]
        
        # Calculate total revenue each row / transaction
        revenue = units * price

        # Calculate total revenue / SUM of all transactions
        total_revenue += revenue

        # Calculate total units sold each row / transaction
        total_units_sold += units
        

        # Calculate total transactions / how many rows / transactions
        total_transactions += 1

        # Calculate highest sale
        if revenue > highest_sale:
            highest_sale = revenue

    # Calculate average sale
    # ALWAYS CALCULATE / PLACE IT OUTSIDE THE LOOP
    average_sale = total_revenue / total_transactions # replacement of transaction_count = len(sales)

    # Display results
    print("Sales Dataset Summary")
    print("--------------------")

    # How many transactions happened?
    print(f"Total Transactions: {total_transactions}")
    # How many units were sold?
    print(f"Total Units Sold: {total_units_sold}")
    # What is total revenue?
    print(f"Total Revenue: ${total_revenue}")
    # What is the highest sale?
    print(f"Highest Sale: ${highest_sale}")
    # What is the average sale?
    print(f"Average Sale: ${average_sale:.2f}")
