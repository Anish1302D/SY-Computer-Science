# -------- Hash Functions --------

# a) Division Method
def division_method(key, size):
    return key % size


# b) Mid Square Method
def mid_square_method(key, size):
    square = key * key
    mid = str(square)
    mid_digit = int(mid[len(mid) // 2])   # taking middle digit
    return mid_digit % size


# c) Digit Folding Method
def digit_folding_method(key, size):
    digits = str(key)
    total = 0
    for d in digits:
        total += int(d)
    return total % size


# -------- Main Program --------
size = int(input("Enter hash table size: "))
n = int(input("Enter number of values: "))

values = []
for i in range(n):
    val = int(input(f"Enter value {i + 1}: "))
    values.append(val)

print("\n--- Division Method ---")
division_table = {}

for v in values:
    index = division_method(v, size)
    if index in division_table:
        print(f"Collision occurred for value {v} at index {index}")
    else:
        division_table[index] = v
        print(f"Value {v} placed at index {index}")

print("\n--- Mid Square Method ---")
mid_square_table = {}

for v in values:
    index = mid_square_method(v, size)
    if index in mid_square_table:
        print(f"Collision occurred for value {v} at index {index}")
    else:
        mid_square_table[index] = v
        print(f"Value {v} placed at index {index}")

print("\n--- Digit Folding Method ---")
digit_folding_table = {}

for v in values:
    index = digit_folding_method(v, size)
    if index in digit_folding_table:
        print(f"Collision occurred for value {v} at index {index}")
    else:
        digit_folding_table[index] = v
        print(f"Value {v} placed at index {index}")
