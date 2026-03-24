# ALWAYS START WITH EMPTY DICT - ITS INDUSTRY STANDARD
revenue_by_region = {} 

import csv

with open("datasets/raw/sales_data.csv") as file:
    reader = csv.DictReader(file)

    for row in reader:              # read every transaction

        customer = row["customer"]
        product = row["product"]
        units = int(row["units"])
        price = int(row["price"])
        region = row["region"]      # which bucket?

        revenue = units * price     # how much to add?

        revenue_by_region[region] = revenue_by_region.get(region, 0) + revenue # add revenue to bucket

    print("Revenue by Region")
    print("-----------------")

    for region, total in revenue_by_region.items(): # read the scoreboard / the dict
        print(f"{region}: {total}")                 # print each bucket / group
    
    # first loop = fills the scoreboard / the dict
    # second loop = reads the scoreboard / the dict

