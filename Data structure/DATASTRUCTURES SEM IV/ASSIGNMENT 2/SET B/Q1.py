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

def find_min(root):
    if root is None:
        return None
    while root.left:
        root = root.left
    return root.value

def find_max(root):
    if root is None:
        return None
    while root.right:
        root = root.right
    return root.value

# Main
root = None
elements = list(map(int, input("Enter elements: ").split()))
for el in elements:
    root = insert(root, el)

print("Minimum:", find_min(root))
print("Maximum:", find_max(root))