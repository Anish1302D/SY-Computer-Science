import numpy as np

A = np.array([[1,2],[3,4]])
B = np.array([[5,6],[7,8]])

result = np.zeros((2,2))

for i in range(2):
    for j in range(2):
        for k in range(2):
            result[i][j] += A[i][k] * B[k][j]

print("Result:\n", result)