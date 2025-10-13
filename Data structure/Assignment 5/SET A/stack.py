class Stack:
    def __init__(self):
        self.stack = []

    def push(self, data):
        self.stack.append(data)
        print(f"{data} pushed to stack")

    def pop(self):
        if not self.stack:
            print("Stack is empty")
        else:
            removed = self.stack.pop()
            print(f"{removed} popped from stack")

    def peek(self):
        if not self.stack:
            print("Stack is empty")
        else:
            print(f"Top element is: {self.stack[-1]}")

    def display(self):
        if not self.stack:
            print("Stack is empty")
        else:
            print("Stack elements:", self.stack)


s = Stack()
while True:
    print("\n--- Stack Menu ---")
    print("1. Push")
    print("2. Pop")
    print("3. Peek")
    print("4. Display")
    print("5. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        val = input("Enter element to push: ")
        s.push(val)
    elif choice == '2':
        s.pop()
    elif choice == '3':
        s.peek()
    elif choice == '4':
        s.display()
    elif choice == '5':
        break
    else:
        print("Invalid choice!")
