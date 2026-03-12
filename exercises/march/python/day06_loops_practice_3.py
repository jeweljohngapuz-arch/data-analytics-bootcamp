# speed round

#1 print numbers
numbers = [10, 20, 30]

total_numbers = 0
print(f"printed numbers:")
for number in numbers:
    total_numbers += number
    print(total_numbers)

print()

#2 calculate sum
sales = [100, 200, 300]

sales_total = 0

for sale in sales:
    sales_total += sale
# if you print outside the loop you get the total
# if you print inside the loop you will get the running total/list content
print(f"Sales Total: {sales_total}")

print()

#3 print unit sold
units = [2, 3, 4]

units_sold= 0

print("Units Sold:")
for unit in units:
    units_sold += unit
    print(units_sold)

print()

#4 calculate total revenue
revenues = [50, 120, 300]

total_revenue = 0

for revenue in revenues:
    total_revenue += revenue
print(f"Total Revenue: {total_revenue}")

print()

#5 print each product name in a list
products = ["Laptop", "Chair", "Table", "Monitor", "Keyboard", "Mouse"]

for product in products:
    print(product)

# FYI if working on list with words not number, no need for container and calculation. see exercise #5 