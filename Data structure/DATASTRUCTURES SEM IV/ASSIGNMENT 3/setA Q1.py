# Program to Create BST and Perform Preorder Traversal

class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

class BST:
    def __init__(self):
        self.root = None

    def insert(self, root, value):
        if root is None:
            return Node(value)
        if value < root.value:
            root.left = self.insert(root.left, value)
        else:
            root.right = self.insert(root.right, value)
        return root

    def preorder(self, root):
        if root:
            print(root.value, end=" ")
            self.preorder(root.left)
            self.preorder(root.right)

# Main Program
bst = BST()
elements = list(map(int, input("Enter elements separated by space: ").split()))

for el in elements:
    bst.root = bst.insert(bst.root, el)

print("Preorder Traversal:")
bst.preorder(bst.root)