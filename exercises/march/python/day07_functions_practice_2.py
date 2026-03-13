# speed round

# 1
def greet():
    print("hello")

greet()

print()

# 2
numbers = [1, 3, 4, 8]

def count_total_numbers(numbers):

    total_numbers = 0
    for number in numbers:
        total_numbers += number
    return total_numbers

total_numbers = count_total_numbers(numbers)
print(f"Total numbers: {total_numbers}")

print()

# 3
number_set = [200, 300, 100, 400]

def calculate_average_numbers(number_set):

    average_numbers = 0
    for numbers in number_set:
        average_numbers += numbers

    return average_numbers / len(number_set)

average = calculate_average_numbers(number_set)
print(f"Average number: {average}")

print()

# 4
def product_name():
    print("ThinkPad")

product_name()

print()

# 5

revenues = [200, 300, 300, 100, 100]

def calculate_revenues(revenues):
    total_revenue = 0

    for sale in revenues:
        total_revenue += sale
    return total_revenue

total_revenue = calculate_revenues(revenues)
print(f"Total Revenue: ${total_revenue}")