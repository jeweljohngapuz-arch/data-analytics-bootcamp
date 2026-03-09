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

#Speed round
# #1
item1_unit = 3
item1_price = 50

item1_revenue = item1_unit * item1_price

if item1_revenue > 500:
    print(f"item 1 is high value sale base on revenue")
else:
    print(f"item 1 is normal sale base on revenue")

# #2
item2_unit = 1
item2_price = 1000

item2_revenue = item2_unit * item2_price

if item2_revenue > 500:
    print(f"item 2 is high value sale base on revenue")
else:
    print(f"item 2 is normal sale base on revenue")

# #3
item3_unit = 5
item3_price = 20

item3_revenue = item3_unit * item3_price

if item3_revenue > 500:
    print(f"item 3 is high value sale base on revenue")
else:
    print(f"item 3 is normal sale base on revenue")

# #4
item4_unit = 2
item4_price = 300

item4_revenue = item4_unit * item4_price

if item4_revenue > 500:
    print(f"item 4 is high value sale base on revenue")
else:
    print(f"item 4 is normal sale base on revenue")
