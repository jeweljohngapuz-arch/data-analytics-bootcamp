# exercise 1
# Create a list of revenues
revenues = [50, 1200, 300, 150, 400]
print(revenues)

print()

# exercise 2
# Create a function: Use a loop to calculate total revenue. Return the result.
def calculate_total(revenues):

    total = 0

    for sale in revenues:
        total += sale

    return total

total_revenue = calculate_total(revenues)
print(f"Total Revenue: ${total_revenue}")

print()

# exercise 3
# Return the average
def calculate_average(revenues):
    
    total = 0

    for sale in revenues:
        total += sale
    return total / len(revenues)

average_sale = calculate_average(revenues)
print(f"Average Sale: ${average_sale}")

print()

# exercise 4
# Return the largest value
def calculate_highest_sale(revenues):

    highest = revenues[0]

    for sale in revenues:
        if sale > highest:
            highest = sale
    return highest

highest_sale = calculate_highest_sale(revenues)
print(f"Highest Sale: $ {highest_sale}")
