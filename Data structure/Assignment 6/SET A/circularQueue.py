# Circular Queue class
class CircularQueue:
    def __init__(self, max_size):
        self.queue = [None] * max_size
        self.front = -1
        self.rear = -1
        self.max_size = max_size

    # Check if queue is empty
    def isEmpty(self):
        return self.front == -1

    # Check if queue is full
    def isFull(self):
        return (self.rear + 1) % self.max_size == self.front

    # Enqueue element
    def enqueue(self, data):
        if self.isFull():
            print("Queue Overflow! Cannot enqueue.")
            return
        if self.isEmpty():
            self.front = 0
        self.rear = (self.rear + 1) % self.max_size
        self.queue[self.rear] = data
        print(f"{data} enqueued.")

    # Dequeue element
    def dequeue(self):
        if self.isEmpty():
            print("Queue Underflow! Cannot dequeue.")
            return
        removed = self.queue[self.front]
        if self.front == self.rear:  # Only one element
            self.front = self.rear = -1
        else:
            self.front = (self.front + 1) % self.max_size
        print(f"{removed} dequeued.")

    # Peek front element
    def peek(self):
        if self.isEmpty():
            print("Queue is empty.")
        else:
            print(f"Front element is: {self.queue[self.front]}")

    # Display all elements
    def display(self):
        if self.isEmpty():
            print("Queue is empty.")
            return
        print("Queue elements:", end=" ")
        i = self.front
        while True:
            print(self.queue[i], end=" <- ")
            if i == self.rear:
                break
            i = (i + 1) % self.max_size
        print("Rear")


# -------- Menu-driven program --------
max_size = int(input("Enter maximum size of the circular queue: "))
cq = CircularQueue(max_size)

while True:
    print("\n--- Circular Queue Menu ---")
    print("1. Enqueue")
    print("2. Dequeue")
    print("3. Peek")
    print("4. Display")
    print("5. Check Empty/Full")
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
        print("Queue is full." if cq.isFull() else "Queue is not full.")
    elif choice == '6':
        print("Exiting...")
        break
    else:
        print("Invalid choice!")
