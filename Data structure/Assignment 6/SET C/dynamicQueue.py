# Node class
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

# Dynamic Circular Queue class
class CircularQueue:
    def __init__(self):
        self.front = None
        self.rear = None

    # Check if queue is empty
    def isEmpty(self):
        return self.front is None

    # Enqueue element at rear
    def enqueue(self, data):
        new_node = Node(data)
        if self.isEmpty():
            self.front = self.rear = new_node
            new_node.next = new_node  # circular link
        else:
            new_node.next = self.front
            self.rear.next = new_node
            self.rear = new_node
        print(f"{data} enqueued.")

    # Dequeue element from front
    def dequeue(self):
        if self.isEmpty():
            print("Queue is empty! Cannot dequeue.")
            return
        removed = self.front.data
        if self.front == self.rear:  # only one element
            self.front = self.rear = None
        else:
            self.front = self.front.next
            self.rear.next = self.front
        print(f"{removed} dequeued.")

    # Peek front element
    def peek(self):
        if self.isEmpty():
            print("Queue is empty.")
        else:
            print(f"Front element is: {self.front.data}")

    # Display all elements
    def display(self):
        if self.isEmpty():
            print("Queue is empty.")
            return
        print("Queue elements:", end=" ")
        temp = self.front
        while True:
            print(temp.data, end=" -> ")
            temp = temp.next
            if temp == self.front:
                break
        print("(back to front)")

# -------- Menu-driven program --------
cq = CircularQueue()

while True:
    print("\n--- Dynamic Circular Queue Menu ---")
    print("1. Enqueue")
    print("2. Dequeue")
    print("3. Peek")
    print("4. Display")
    print("5. Check if Empty")
    print("6. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        data = input("Enter element to enqueue: ")
        cq.enqueue(data)
    elif choice == '2':
        cq.dequeue()
    elif choice == '3':
        cq.peek()
    elif choice == '4':
        cq.display()
    elif choice == '5':
        print("Queue is empty." if cq.isEmpty() else "Queue is not empty.")
    elif choice == '6':
        print("Exiting...")
        break
    else:
        print("Invalid choice!")
