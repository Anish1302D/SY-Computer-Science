numbers = [64, 25, 12, 22, 11]
n = len(numbers)

print("Original list:", numbers)

for i in range(n - 1):
    mini = i
    for j in range(i + 1, n):
        if numbers[j] < numbers[mini]:
            mini = j

    numbers[i], numbers[mini] = numbers[mini], numbers[i]

print("Sorted list in ascending order:", numbers)

