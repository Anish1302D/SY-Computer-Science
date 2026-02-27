class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

def insert(root, value):
    if root is None:
        return Node(value)
    if value < root.value:
        root.left = insert(root.left, value)
    else:
        root.right = insert(root.right, value)
    return root

def nodes_at_level(root, level):
    if root is None:
        return 0
    if level == 0:
        return 1
    return nodes_at_level(root.left, level-1) + nodes_at_level(root.right, level-1)

# Main
root = None
elements = list(map(int, input("Enter elements: ").split()))
for el in elements:
    root = insert(root, el)

level = int(input("Enter level: "))
print("Nodes at level", level, ":", nodes_at_level(root, level))