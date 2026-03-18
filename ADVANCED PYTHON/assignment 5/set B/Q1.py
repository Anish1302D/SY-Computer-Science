import numpy as np

matrix = np.arange(1,17).reshape(4,4)

print("Original Matrix:\n", matrix)

matrix[matrix > 10] = 0

print("Modified Matrix:\n", matrix)