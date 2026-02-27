# Degree of Each Vertex using Adjacency Matrix

v = int(input("Enter number of vertices: "))
matrix = [[0 for _ in range(v)] for _ in range(v)]

e = int(input("Enter number of edges: "))
for _ in range(e):
    u, w = map(int, input("Enter edge (u v): ").split())
    matrix[u][w] = 1
    matrix[w][u] = 1

print("Degree of each vertex:")
for i in range(v):
    degree = sum(matrix[i])
    print("Vertex", i, "Degree:", degree)

