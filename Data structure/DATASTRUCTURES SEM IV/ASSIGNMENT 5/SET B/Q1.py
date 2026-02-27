# Prim's Algorithm using Adjacency Matrix

import sys

def prim(matrix, v):
    selected = [False] * v
    selected[0] = True

    print("Edges in MST:")
    for _ in range(v - 1):
        minimum = sys.maxsize
        x = y = 0

        for i in range(v):
            if selected[i]:
                for j in range(v):
                    if not selected[j] and matrix[i][j] != 0:
                        if matrix[i][j] < minimum:
                            minimum = matrix[i][j]
                            x, y = i, j

        print(f"{x} - {y} : {matrix[x][y]}")
        selected[y] = True

# Main Program
v = int(input("Enter number of vertices: "))
matrix = []

print("Enter adjacency matrix:")
for _ in range(v):
    row = list(map(int, input().split()))
    matrix.append(row)

prim(matrix, v)