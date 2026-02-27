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

def height(root):
    if root is None:
        return 0
    return 1 + max(height(root.left), height(root.right))

# Main
root = None
elements = list(map(int, input("Enter elements: ").split()))
for el in elements:
    root = insert(root, el)

print("Height of BST:", height(root))