# In-degree and Out-degree using Adjacency Matrix

v = int(input("Enter number of vertices: "))
matrix = [[0 for _ in range(v)] for _ in range(v)]

e = int(input("Enter number of edges: "))
for _ in range(e):
    u, w = map(int, input("Enter directed edge (u v): ").split())
    matrix[u][w] = 1

print("Vertex\tIn-degree\tOut-degree")
for i in range(v):
    out_degree = sum(matrix[i])
    in_degree = sum(matrix[j][i] for j in range(v))
    print(i, "\t", in_degree, "\t\t", out_degree)