# Script: dataset_revenue_summary.py
# Author: Jewel
# Lesson: Day10 – Dataset Revenue Summary
# Description:
# Reads sales dataset and calculates summary metrics

import csv

# Load dataset
with open("datasets/raw/sales_data.csv") as file:
    reader = csv.DictReader(file)

    total_revenue = 0
    total_units_sold = 0
    total_transactions = 0
    highest_sale = 0 

    for row in reader:

        customer = row["customer"]
        product = row["product"]
        units = int(row["units"])
        price = int(row["price"])
        region = row["region"]

        # Calculate total revenue
        total_revenue += price

        # Calculate total units sold
        total_units_sold += units

        # Calculate total transactions
        total_transactions += 1

        # Calculate highest sale
        if price > highest_sale:
            highest_sale = price

        # Calculate average sale
        average_sale = price / total_transactions # replacement of transaction_count = len(sales)

    # Display results
    print("Sales Dataset Summary")
    print("--------------------")
    print(f"Total Revenue: ${total_revenue}")
    print(f"Total Units Sold: {total_units_sold}")
    print(f"Total Transactions: {total_transactions}")
    print(f"Highest Sale: ${highest_sale}")
    print(f"Average Sale: ${average_sale:.2f}")
