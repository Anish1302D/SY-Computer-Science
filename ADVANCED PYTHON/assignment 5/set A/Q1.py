import numpy as np

arr = np.arange(1, 11)

print("Array:", arr)

even = arr[arr % 2 == 0]

print("Even numbers:", even)