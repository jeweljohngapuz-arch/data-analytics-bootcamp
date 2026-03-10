# list of revenue
revenues = [50, 1200, 300, 150, 400]
print(revenues)

print()

# TOTAL REVENUE
# calculate total revenue using sum() function
total = sum(revenues)
print(f"the total revenue: {total}")

# result for [50, 1200, 300] is 1550
# result for [50, 1200, 300, 150, 400] is 2100

print()

# AVERAGE SALE
# calculate the average sale using len() and sum() function
# 1550 / 3
average = sum(revenues) / len(revenues)

# print with :.2f is safe in using print
print(f"the average sale: {average:.2f}")

# result for [50, 1200, 300] is 516.67
# result for [50, 1200, 300, 150, 400] is 420.00

print()

# SPEED ROUND

#1
revenues = [50, 120, 200]
print(revenues)

#2
units = [2, 1, 5]
print(sum(units))

#3
prices = [25, 300, 1200]
print(sum(prices) / len(prices))

#4 FIND THE SUM
earnings = [100, 200, 300, 400]
print(sum(earnings))

#5
sales_revenues = [5000, 200, 300, 200, 100]
print(f"max: the highest value is {max(sales_revenues)}")
print(f"average: {sum(sales_revenues) / len(sales_revenues)}")
print(f"min: {min(sales_revenues)}")

print()

# MISSION — DAILY SALES SUMMARY 
revenues = [6540, 50, 1200, 300, 150, 400]

print(f"Revenue List: {revenues}")
print(f"Total Revenue: {sum(revenues)}")
print(f"Average Sale: {sum(revenues) / len(revenues):.2f}")
print(f"Highest Sale: {max(revenues)}")