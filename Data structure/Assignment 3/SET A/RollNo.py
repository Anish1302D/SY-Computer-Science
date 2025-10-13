roll_numbers = [101, 102, 103, 104, 105]

search_roll = int(input("Enter roll number to search: "))

found = False
for i in range(len(roll_numbers)):
    if roll_numbers[i] == search_roll:
        print(f"Roll number found at position {i + 1}")
        found = True
        break

if not found:
    print("Not found")
