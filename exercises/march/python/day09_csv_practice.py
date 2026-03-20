import csv

# Load and read dataset
with open("datasets/raw/sales_data.csv") as file:
    reader = csv.DictReader(file)

    # Loop to each transactions
    for row in reader:
        # Extract data from row
        product = row["product"]
        units = int(row["units"])
        price = int(row["price"])

        # Calculate metrics (this is the analysis part)
        revenue = units * price

        # Display result
        print(f"{product}: ${revenue}")
