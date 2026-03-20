import csv

with open("datasets/raw/sales_data.csv") as file:
    reader = csv.DictReader(file)
    for row in reader:

        # print(row)

        # product = row["product"]
        # print(product)

        units = int(row["units"])
        price = int(row["price"])
        # print(f"Units: {units}, Price: {price}")
        revenue = units * price

        product = row["product"]
        print(f"{product}: ${revenue}")
