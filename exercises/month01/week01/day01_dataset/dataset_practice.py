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
