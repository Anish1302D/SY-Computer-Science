# Adjacency Matrix + DFS

def dfs(matrix, node, visited, v):
    visited[node] = True
    print(node, end=" ")

    for i in range(v):
        if matrix[node][i] == 1 and not visited[i]:
            dfs(matrix, i, visited, v)

# Main Program
v = int(input("Enter number of vertices: "))
matrix = [[0 for _ in range(v)] for _ in range(v)]

e = int(input("Enter number of edges: "))
for _ in range(e):
    u, w = map(int, input("Enter edge (u v): ").split())
    matrix[u][w] = 1
    matrix[w][u] = 1

print("Adjacency Matrix:")
for row in matrix:
    print(row)

start = int(input("Enter starting vertex: "))
visited = [False] * v

print("DFS Traversal:")
dfs(matrix, start, visited, v)