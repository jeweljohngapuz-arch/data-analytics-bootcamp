# 4 stages of loop structure

# dataset
# the data to process
revenues = [50, 1200, 300, 150, 400]

# container
# where we store results
# start at 0 because nothing has been counted yet
total = 0

# loop (the engine)
# For each value inside dataset(revenues), store that value in the variable sale
for sale in revenues:
    # the calculation 
    # meaning: total = total + sale
    # it adds the numbers in the list one by one 
    total += sale

# output
print(f"Total revenue: {total}")

