# Script: revenue_by_region.py
# Author: Jewel
# Lesson: Day11 – Revenue by Region
# Description:
# Groups revenue by region from sales dataset

# empty dictionary
group_by_region = {}

# load dataset
import csv

with open("datasets/raw/sales_data.csv") as file:
    reader = csv.DictReader(file)

    # calculate revenue per row
    for row in reader:

        units = int(row["units"])
        price = int(row["price"])
        region = row["region"]

        # important metrics
        revenue = units * price

        # group revenue by region
        group_by_region[region] = group_by_region.get(region, 0) + revenue
    
    print("Revenue by Region")
    print("-----------------")

    # group revenue by region
    # print each region total
    for region, total in group_by_region.items():
        print(f"{region}: ${total}")

    # the west generates the most revenue total of $1600.

    # "I create an empty dict, loop through the dataset adding revenue to each key using .get(), then loop .items() to read the results.

