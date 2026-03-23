import csv

# Load and read the dataset
with open("datasets/raw/sales_data.csv") as file:
    reader = csv.DictReader(file)

    total_units = 0
    transaction_count = 0
    highest_sale = 0
    
    for row in reader:
        # print(row)

        customer = row["customer"]
        product = row["product"]
        units = int(row["units"])
        price = int(row["price"])
        region = row["region"]

        # calculate total revenue
        revenue = units * price

        # calculate total units sold
        total_units += units

        # count number of transactions
        # print outside. the rest inside the loop
        transaction_count += 1

        # calculate highest sale
        # print outside. the rest inside the loop
        if revenue > highest_sale:
            highest_sale = revenue
        
    print(highest_sale)
    print(transaction_count)
   
        


