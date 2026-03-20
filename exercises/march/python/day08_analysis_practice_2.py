# Speed round

# 1
revenues = [20, 40, 10, 30, 60]

total = 0

for sale in revenues:
    total += sale

print(f"Total Revenue: ${total}")


# 2
numbers = [3, 2, 5, 7, 4, 10, 22]

total = 0

for number in numbers:
    total += number

average = total / len(numbers)
print(f"Average Number: ${average:.2f}")

# 3
transactions = [10, 24, 302, 33, 11, 22]

highest_transaction = transactions[0]

for transaction in transactions:
    if transaction > highest_transaction:
        highest_transaction = transaction

print(f"Highest Value: ${highest_transaction}")

#4
def calculate_sum(transactions):

    total = 0

    for transaction in transactions:
        total += transaction

    return total

total = calculate_sum(transactions)
print (f"Sum Total: ${total}")

#5
def calculate_highest_value(transactions):

    highest_value = transactions[0]

    for transaction in transactions:

        if transaction > highest_value:
            highest_value = transaction

    return highest_value

highest_value = calculate_highest_value(transactions)
print(f"Highest Value: ${highest_value}")


