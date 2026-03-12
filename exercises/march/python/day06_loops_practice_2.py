# exercise 1, 2
revenues = [50, 1200, 300]

total_revenue = 0

for sale in revenues:
    total_revenue += sale
print(f"Total Revenue: {total_revenue}")

# exercise 3, 4
# single list loop
units = [2, 1, 5]

units_sold = 0

for unit in units:
    units_sold += unit
print(f"Total Unit Sold: {units_sold}")


# double list loop
# start index counting to zero
units =[2, 1, 5]
prices = [25, 1200, 60]

# counter for the index count of the loop
# zero current position number
i = 0

# meaning: Loop through the units list one value at a time.
# What is happening: Python takes each value from units and stores it in unit.
for unit in units:
    # meaning: Calculate revenue for the current sale.
    # how: Multiply the current unit by the matching price in prices.
    revenue = unit * prices[i] # prices[i] means: get the price at the current position
    # meaning: Move to the next position/price.
    # what happens: After finishing one sale, increase i by 1.
    i += 1
    print(revenue)