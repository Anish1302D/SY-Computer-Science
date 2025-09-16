def bubble_sort_employees(data):
    n = len(data)
    for i in range(n - 1):
        for j in range(n - 1 - i):
            if data[j][2] > data[j + 1][2]:
                data[j], data[j + 1] = data[j + 1], data[j]
    return data

employees = []
with open("employee.txt", "r") as file:
    for line in file:
        parts = line.strip().split()
        name = parts[0]
        designation = parts[1]
        salary = int(parts[2])
        employees.append((name, designation, salary))

sorted_employees = bubble_sort_employees(employees)

with open("newemp.txt", "w") as file:
    for emp in sorted_employees:
        file.write(f"{emp[0]} {emp[1]} {emp[2]}\n")

print("Employees sorted by salary written to newemp.txt")
