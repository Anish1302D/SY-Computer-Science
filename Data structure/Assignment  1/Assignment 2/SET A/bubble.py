numbers = [50, 40, 30, 10]

print("Original list:", numbers)

n = len(numbers)

for i in range(n - 1):
    swapped = False

    for j in range(n - 1 - i):
        if numbers[j] > numbers[j + 1]:
            numbers[j], numbers[j + 1] = numbers[j + 1], numbers[j]
            swapped = True

    if not swapped:
        break

print("Sorted list in ascending order:", numbers)
