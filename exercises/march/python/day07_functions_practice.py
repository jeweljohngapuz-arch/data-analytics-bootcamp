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

# exercise 3
