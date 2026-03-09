# exercise #1
# calculate revenue
# practice variables
# practice metric calculation

# practice variables
units = 2
price = 25
product = "mouse" # exercise #3

# metric calculation
revenue = units * price

#print the metric
print(revenue)

# exercise #2
# add a condition

# finding what numbers matter
if revenue > 100:
    print(f"{product} generated a high value sale")
else:
    # the metric revenue is classified as normal sale
    print(f"{product} generated a normal sale")

# exercise #3
# add a product name

# exercise #4
# create a high value sale condition

product2_units = 1
product2_price = 1200
product2 = "laptop"

product2_revenue = product2_units * product2_price

# find the numbers that matter
if product2_revenue > 500:
    # the metric revenue is classified as high value sale
    print(f"{product2} generated a high value sale")
else:
    # the metric revenue is classified as normal sale
    print(f"{product2} generated a normal sale")
