# BFS Traversal using Adjacency List

from collections import deque

class Graph:
    def __init__(self, vertices):
        self.V = vertices
        self.graph = {i: [] for i in range(vertices)}

    def add_edge(self, u, v):
        self.graph[u].append(v)
        self.graph[v].append(u)

    def bfs(self, start):
        visited = [False] * self.V
        queue = deque()
        visited[start] = True
        queue.append(start)

        while queue:
            vertex = queue.popleft()
            print(vertex, end=" ")

            for neighbor in self.graph[vertex]:
                if not visited[neighbor]:
                    visited[neighbor] = True
                    queue.append(neighbor)

# Main Program
v = int(input("Enter number of vertices: "))
g = Graph(v)

e = int(input("Enter number of edges: "))
for _ in range(e):
    u, w = map(int, input("Enter edge (u v): ").split())
    g.add_edge(u, w)

start = int(input("Enter starting vertex: "))
print("BFS Traversal:")
g.bfs(start)

Q2
# DFS Traversal using Adjacency List

class Graph:
    def __init__(self, vertices):
        self.V = vertices
        self.graph = {i: [] for i in range(vertices)}

    def add_edge(self, u, v):
        self.graph[u].append(v)
        self.graph[v].append(u)

    def dfs(self, vertex, visited):
        visited[vertex] = True
        print(vertex, end=" ")

        for neighbor in self.graph[vertex]:
            if not visited[neighbor]:
                self.dfs(neighbor, visited)

# Main Program
v = int(input("Enter number of vertices: "))
g = Graph(v)

e = int(input("Enter number of edges: "))
for _ in range(e):
    u, w = map(int, input("Enter edge (u v): ").split())
    g.add_edge(u, w)

start = int(input("Enter starting vertex: "))
visited = [False] * v

print("DFS Traversal:")
g.dfs(start, visited)