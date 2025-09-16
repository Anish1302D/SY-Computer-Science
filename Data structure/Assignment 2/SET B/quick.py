def quick_sort(arr):
    if len(arr) <= 1:
        return arr

    pivot = arr[0]

    left = [x for x in arr[1:] if x <= pivot]
    right = [x for x in arr[1:] if x > pivot]

    return quick_sort(left) + [pivot] + quick_sort(right)

numbers = [5, 8, 1, 2, 6, 3, 9]

print("Original array:", numbers)

sorted_numbers = quick_sort(numbers)

print("Sorted array in ascending order:", sorted_numbers)
