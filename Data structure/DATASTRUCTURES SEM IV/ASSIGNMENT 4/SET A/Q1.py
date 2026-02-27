# Graph using Adjacency List (Dynamic)

class Graph:
    def __init__(self, vertices):
        self.V = vertices
        self.graph = {i: [] for i in range(vertices)}

    def add_edge(self, u, v):
        self.graph[u].append(v)
        self.graph[v].append(u)   # Remove this line for directed graph

    def display(self):
        print("Adjacency List:")
        for vertex in self.graph:
            print(vertex, "->", self.graph[vertex])

# Main Program
v = int(input("Enter number of vertices: "))
g = Graph(v)

e = int(input("Enter number of edges: "))
for _ in range(e):
    u, v = map(int, input("Enter edge (u v): ").split())
    g.add_edge(u, v)

g.display()

