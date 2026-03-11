# exercise 1: Create variables representing a data set row.
customer = "Bob"
product = "Mouse"
units = 2
price = 25

print(f"{customer} bought {units} {product} for ${price}.")    

# exercise 2: Calculate the revenue for the data set row.
revenue = units * price
print(f"Revenue: ${revenue}.")

# exercise 3: Add new variable and print all variables available.
region = "West"

print(f"{customer} from {region} bought {units} {product} for ${price}. The store now has a revenue of ${revenue}.")

# exercise 4: Create new datasets rows.
customer = "Alice"
product = "Laptop"
units = 1
price = 1200
region = "West"

revenue = units * price

print(f"{customer} from {region} bought {units} {product} for ${price}. The store now has a revenue of ${revenue}.")

# speed round: Goal: translate English → Python quickly
units = 3
price = 40
revenue = units * price

units = 5
price = 20
revenue = units * price

units = 2
price = 300

product = "car"
units = 10
price = 20000
revenue = units * price

print(f"the revenue for selling the {product} is ${revenue}.")

# MISSION — DATASET REVENUE CALCULATOR
product_1 = "Mouse"
unit_product_1 = 0
price_product_1= 200
revenue_product_1 = unit_product_1 * price_product_1

product_2 = "Laptop"
unit_product_2 = 1
price_product_2 = 200
revenue_product_2 = unit_product_2 * price_product_2

product_3 = "Chair"
unit_product_3 = 3
price_product_3 = 10
revenue_product_3 = unit_product_3 * price_product_3

print(f"Revenue from {product_1}: ${revenue_product_1}")
print(f"Revenue from {product_2}: ${revenue_product_2}")
print(f"Revenue from {product_3}: ${revenue_product_3}")