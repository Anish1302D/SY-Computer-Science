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

def are_identical(r1, r2):
    if r1 is None and r2 is None:
        return True
    if r1 is None or r2 is None:
        return False
    return (r1.value == r2.value and
            are_identical(r1.left, r2.left) and
            are_identical(r1.right, r2.right))

# Main
root1 = None
root2 = None

elements1 = list(map(int, input("Enter elements of BST1: ").split()))
elements2 = list(map(int, input("Enter elements of BST2: ").split()))

for el in elements1:
    root1 = insert(root1, el)

for el in elements2:
    root2 = insert(root2, el)

if are_identical(root1, root2):
    print("Both BSTs are Identical")
else:
    print("BSTs are Not Identical")