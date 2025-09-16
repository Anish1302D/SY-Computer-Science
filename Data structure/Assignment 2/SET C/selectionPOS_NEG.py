def selection_sort(arr):
    n = len(arr)
    for i in range(n - 1):
        mini = i
        for j in range(i + 1, n):
            if arr[j] < arr[mini]:
                mini = j
        arr[i], arr[mini] = arr[mini], arr[i]
    return arr

numbers = [12, -7, 5, -3, 9, -1, 4, -6]
print("Original array:", numbers)

negatives = [x for x in numbers if x < 0]
positives = [x for x in numbers if x >= 0]

negatives = selection_sort(negatives)
positives = selection_sort(positives)

sorted_array = negatives + positives

print("Sorted array:", sorted_array)
