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

def sum_nodes(root):
    if root is None:
        return 0
    return root.value + sum_nodes(root.left) + sum_nodes(root.right)

# Main
root = None
elements = list(map(int, input("Enter elements: ").split()))
for el in elements:
    root = insert(root, el)

print("Sum of Nodes:", sum_nodes(root))