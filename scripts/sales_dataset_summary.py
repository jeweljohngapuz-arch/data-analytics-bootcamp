# Script: sales_dataset_summary.py
# Author: Jewel
# Lesson: Day09 – CSV Data Analysis
# Description:
# Reads sales dataset and calculates revenue per transaction

import csv

# load and read the dataset
with open("datasets/raw/sales_Data.csv") as file:
    reader = csv.DictReader(file)

    print("Transaction Analysis")
    print("--------------------")

    # Loop through each transaction
    for row in reader:
        # print(row)

        product = row["product"]
        units = int(row["units"])
        price = int(row["price"])

        # Calculate metrics
        revenue = units * price

        # Display results
        print(f"{product} | Revenue: ${revenue}")

