# Dijkstra's Algorithm using Adjacency Matrix

import sys

def dijkstra(matrix, source, v):
    dist = [sys.maxsize] * v
    visited = [False] * v
    dist[source] = 0

    for _ in range(v):
        min_dist = sys.maxsize
        u = -1

        for i in range(v):
            if not visited[i] and dist[i] < min_dist:
                min_dist = dist[i]
                u = i

        visited[u] = True

        for i in range(v):
            if matrix[u][i] > 0 and not visited[i]:
                if dist[u] + matrix[u][i] < dist[i]:
                    dist[i] = dist[u] + matrix[u][i]

    print("Shortest distances from source:")
    for i in range(v):
        print(f"Vertex {i} : {dist[i]}")

# Main Program
v = int(input("Enter number of vertices: "))
matrix = []

print("Enter weighted adjacency matrix:")
for _ in range(v):
    row = list(map(int, input().split()))
    matrix.append(row)

source = int(input("Enter source vertex: "))
dijkstra(matrix, source, v)