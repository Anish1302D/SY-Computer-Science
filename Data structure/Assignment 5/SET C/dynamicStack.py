class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class Stack:
    def __init__(self):
        self.top = None

    def push(self, data):
        new_node = Node(data)
        new_node.next = self.top
        self.top = new_node
        print(f"{data} pushed to stack")

    def pop(self):
        if self.top is None:
            print("Stack is empty")
            return
        removed = self.top.data
        self.top = self.top.next
        print(f"{removed} popped from stack")

    def peek(self):
        if self.top is None:
            print("Stack is empty")
        else:
            print(f"Top element is: {self.top.data}")

    def display(self):
        if self.top is None:
            print("Stack is empty")
            return
        temp = self.top
        print("Stack elements (top to bottom):", end=" ")
        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next
        print("None")

stack = Stack()

while True:
    print("\n--- Stack Menu ---")
    print("1. Push")
    print("2. Pop")
    print("3. Peek")
    print("4. Display")
    print("5. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        data = input("Enter element to push: ")
        stack.push(data)
    elif choice == '2':
        stack.pop()
    elif choice == '3':
        stack.peek()
    elif choice == '4':
        stack.display()
    elif choice == '5':
        print("Exiting...")
        break
    else:
        print("Invalid choice!")
