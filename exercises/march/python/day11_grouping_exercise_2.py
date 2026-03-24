revenue_by_region = {} 

import csv

with open("datasets/raw/sales_data.csv") as file:
    reader = csv.DictReader(file)

    for row in reader:

        units = int(row["units"])
        price = int(row["price"])
        region = row["region"]

        revenue = units * price

        revenue_by_region[region] = revenue_by_region.get(region, 0) + revenue

    for region, total in revenue_by_region.items():
        print(f"{region}: {total}")