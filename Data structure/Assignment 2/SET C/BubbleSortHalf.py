def bubble_sort_asc(arr):
    n = len(arr)
    for i in range(n - 1):
        for j in range(n - 1 - i):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

def bubble_sort_desc(arr):
    n = len(arr)
    for i in range(n - 1):
        for j in range(n - 1 - i):
            if arr[j] < arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

numbers = [20, 10, 50, 40, 30, 70, 60, 90]
print("Original array:", numbers)

mid = len(numbers) // 2
first_half = numbers[:mid]
second_half = numbers[mid:]

first_half = bubble_sort_asc(first_half)
second_half = bubble_sort_desc(second_half)

sorted_array = first_half + second_half

print("Sorted array:", sorted_array)
