# speed round

import csv

with open("datasets/raw/sales_data.csv") as file:
    reader = csv.DictReader(file)

    for row in reader:
        # 1 print product names 
        # product = row["product"]
        # print(product)

        # 2 print units sold
        # units = row["units"]
        # print(units)

        # # 3 calculate revenue per row
        # units = int(row["units"])
        # price = int(row["price"])
        # revenue = units * price
        # print(revenue)

        # # 4 print region column
        # region = row["region"]
        # print(region)

        # 5 print full row values
        print(row)
