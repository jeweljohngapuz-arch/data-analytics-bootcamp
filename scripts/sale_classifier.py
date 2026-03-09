# Script: sale_classifier.py
# Author: Jewel
# Lesson: Day02 – Conditions
# Description:
# Classifies sales as high or normal value

product1_name = "mini pc"
product1_unit = 3
product1_price = 280

product1_revenue = product1_unit * product1_price

print(f"Product 1: {product1_name}")
print(f"Revenue: {product1_revenue}")

if product1_revenue > 500:
    print(f"Classification: High Value Sale")
else:
    print(f"Classification: Normal Value Sale")

product2_name = "monitor"
product2_unit = 2
product2_price = 850

product2_revenue = product2_unit * product2_price

print(f"Product 2: {product2_name}")
print(f"Revenue: {product2_revenue}")

if product2_revenue > 500:
    print(f"Classification: High Value Sale")
else:
    print(f"Classification: Normal Value Sale")

product3_name = "desk"
product3_unit = 10
product3_price = 30

product3_revenue = product3_unit * product3_price

print(f"Product 3: {product3_name}")
print(f"Revenue: {product3_revenue}")

if product3_revenue > 500:
    print(f"Classification: High Value Sale")
else:
    print(f"Classification: Normal Value Sale")







