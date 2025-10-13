salaries = [20000, 25000, 30000, 35000, 40000, 45000, 50000]

key = int(input("Enter the salary to search: "))

low = 0
high = len(salaries) - 1
found = False

while low <= high:
    mid = (low + high) // 2
    if salaries[mid] == key:
        print(f"Salary found at position {mid + 1}")
        found = True
        break
    elif salaries[mid] < key:
        low = mid + 1
    else:
        high = mid - 1

if not found:
    print("Salary not found")
