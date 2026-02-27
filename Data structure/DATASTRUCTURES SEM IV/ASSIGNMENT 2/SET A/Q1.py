class Node:
    def _init_(self, value):
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

def count_leaf(root):
    if root is None:
        return 0
    if root.left is None and root.right is None:
        return 1
    return count_leaf(root.left) + count_leaf(root.right)

# Main
root = None
elements = list(map(int, input("Enter elements: ").split()))
for el in elements:
    root = insert(root, el)

print("Leaf Nodes:", count_leaf(root))