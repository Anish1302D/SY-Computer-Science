 # Program to Create BST and Perform Postorder Traversal

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

    def postorder(self, root):
        if root:
            self.postorder(root.left)
            self.postorder(root.right)
            print(root.value, end=" ")

# Main Program
bst = BST()
elements = list(map(int, input("Enter elements separated by space: ").split()))

for el in elements:
    bst.root = bst.insert(bst.root, el)

print("Postorder Traversal:")
bst.postorder(bst.root)