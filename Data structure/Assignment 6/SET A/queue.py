# Static Queue class
class Queue:
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
        return self.rear == self.max_size - 1

    # Enqueue element
    def enqueue(self, data):
        if self.isFull():
            print("Queue is full! Cannot enqueue.")
            return
        if self.isEmpty():  # first element
            self.front = 0
        self.rear += 1
        self.queue[self.rear] = data
        print(f"{data} enqueued.")

    # Dequeue element
    def dequeue(self):
        if self.isEmpty():
            print("Queue is empty! Cannot dequeue.")
            return
        removed = self.queue[self.front]
        if self.front == self.rear:  # last element removed
            self.front = self.rear = -1
        else:
            self.front += 1
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
        else:
            print("Queue elements:", end=" ")
            for i in range(self.front, self.rear + 1):
                print(self.queue[i], end=" <- ")
            print("Rear")


# -------- Menu-driven program --------
max_size = int(input("Enter maximum size of the queue: "))
q = Queue(max_size)

while True:
    print("\n--- Queue Menu ---")
    print("1. Enqueue")
    print("2. Dequeue")
    print("3. Peek")
    print("4. Display")
    print("5. Check Empty/Full")
    print("6. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        data = input("Enter element to enqueue: ")
        q.enqueue(data)
    elif choice == '2':
        q.dequeue()
    elif choice == '3':
        q.peek()
    elif choice == '4':
        q.display()
    elif choice == '5':
        print("Queue is empty." if q.isEmpty() else "Queue is not empty.")
        print("Queue is full." if q.isFull() else "Queue is not full.")
    elif choice == '6':
        print("Exiting...")
        break
    else:
        print("Invalid choice!")
