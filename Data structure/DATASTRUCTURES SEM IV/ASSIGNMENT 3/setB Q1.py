# Program to Create BST and Perform Inorder Traversal

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

    def inorder(self, root):
        if root:
            self.inorder(root.left)
            print(root.value, end=" ")
            self.inorder(root.right)

# Main Program
bst = BST()
elements = list(map(int, input("Enter elements separated by space: ").split()))

for el in elements:
    bst.root = bst.insert(bst.root, el)

print("Inorder Traversal:")
bst.inorder(bst.root)