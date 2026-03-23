# Speed round

# 1. 
numbers = [50, 1200, 300]

total_numbers = 0

for number in numbers:
    total_numbers += number

print(total_numbers)

# 2. FIND TOTAL TRANSACTIONS 
transactions = [50, 1200, 300, 150]

counted_transactions = 0

for transaction in transactions:
    counted_transactions += 1

print(counted_transactions)

# 3. FIND HIGHEST SALE
revenues = [50, 1200, 300]

highest_value = 0

for revenue in revenues:
    if revenue > highest_value:
        highest_value = revenue

print(highest_value)

# 4. FIND AVERAGE SALE
sales = [100, 200, 300]

total_sales = 0
transaction_count = len(sales)

for sale in sales:
    total_sales += sale

# ALWAYS CALCULATE / PLACE IT OUTSIDE THE LOOP
average = total_sales / transaction_count

print(average)

# 5. FIND TOTAL UNITS SOLD
units = [2, 1, 5, 3]

total_units = 0

for unit in units:
    total_units += unit

print(total_units)