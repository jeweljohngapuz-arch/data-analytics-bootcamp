# exercise 1

# def means define a function
# greet is the function name
# () means this function takes no input
# : starts the function block
def greet():
    #Inside the function, tell Python to print hello.
    print("hello")

#Run the function.    
greet()

# exercise 2

all_revenues = [50, 120, 300]

def calculate_total(all_revenues):
    total_revenues = 0

    for sale in all_revenues:
        total_revenues += sale
    return total_revenues
    

result = calculate_total(all_revenues)

print(result)

print()

# exercise 3

revenue_sale = [200, 300, 100]

def calculate_total_revenue(revenue_sale):
    total_revenue = 0

    for sale in revenue_sale:
        total_revenue += sale
    return total_revenue

revenue_result = calculate_total_revenue(revenue_sale)
print(revenue_result)

print()

# exercise 4
# 1 total revenue
# 2 divide by number of sales
# 3 return average

# transactions = [20, 40, 60, 80]
transactions = [10, 20, 30, 40]

def calculate_average_sale(transactions):
    total_average = 0

    # get sum of numbers
    # loop job is to collect total
    for sale in transactions:
        total_average += sale

    # keep in mind, calculate average AFTER the loop. not inside it.
    # after getting total, divide once. sum divided by number of sales transaction
    return total_average / len(transactions)
    # return result

average_result = calculate_average_sale(transactions)
print(average_result)