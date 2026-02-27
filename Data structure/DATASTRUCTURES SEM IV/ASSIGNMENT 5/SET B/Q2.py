# Kruskal's Algorithm

class Graph:
    def __init__(self, vertices):
        self.V = vertices
        self.edges = []

    def add_edge(self, u, v, w):
        self.edges.append((w, u, v))

    def find(self, parent, i):
        if parent[i] == i:
            return i
        return self.find(parent, parent[i])

    def union(self, parent, rank, x, y):
        root_x = self.find(parent, x)
        root_y = self.find(parent, y)

        if rank[root_x] < rank[root_y]:
            parent[root_x] = root_y
        elif rank[root_x] > rank[root_y]:
            parent[root_y] = root_x
        else:
            parent[root_y] = root_x
            rank[root_x] += 1

    def kruskal(self):
        result = []
        i = 0
        e = 0

        self.edges.sort()
        parent = []
        rank = []

        for node in range(self.V):
            parent.append(node)
            rank.append(0)

        while e < self.V - 1:
            w, u, v = self.edges[i]
            i += 1
            x = self.find(parent, u)
            y = self.find(parent, v)

            if x != y:
                e += 1
                result.append((u, v, w))
                self.union(parent, rank, x, y)

        print("Edges in MST:")
        for u, v, weight in result:
            print(f"{u} - {v} : {weight}")

# Main Program
v = int(input("Enter number of vertices: "))
e = int(input("Enter number of edges: "))

g = Graph(v)

for _ in range(e):
    u, v1, w = map(int, input("Enter edge (u v weight): ").split())
    g.add_edge(u, v1, w)

g.kruskal()