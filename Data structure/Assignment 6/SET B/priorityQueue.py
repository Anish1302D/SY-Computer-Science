# Priority Queue class
class PriorityQueue:
    def __init__(self, max_size):
        self.queue = []  # list of tuples (element, priority)
        self.max_size = max_size

    # Check if queue is empty
    def isEmpty(self):
        return len(self.queue) == 0

    # Check if queue is full
    def isFull(self):
        return len(self.queue) >= self.max_size

    # Enqueue element with priority
    def enqueue(self, element, priority):
        if self.isFull():
            print("Queue Overflow! Cannot enqueue.")
            return
        self.queue.append((element, priority))
        # Sort queue based on priority (lowest number = highest priority)
        self.queue.sort(key=lambda x: x[1])
        print(f"{element} with priority {priority} enqueued.")

    # Dequeue element with highest priority
    def dequeue(self):
        if self.isEmpty():
            print("Queue Underflow! Cannot dequeue.")
            return
        element, priority = self.queue.pop(0)
        print(f"{element} with priority {priority} dequeued.")

    # Peek element with highest priority
    def peek(self):
        if self.isEmpty():
            print("Queue is empty.")
        else:
            element, priority = self.queue[0]
            print(f"Front element: {element} with priority {priority}")

    # Display all elements
    def display(self):
        if self.isEmpty():
            print("Queue is empty.")
            return
        print("Priority Queue elements (element -> priority):")
        for element, priority in self.queue:
            print(f"{element} -> {priority}")

# ---------------- Menu-driven program ----------------
max_size = int(input("Enter maximum size of the priority queue: "))
pq = PriorityQueue(max_size)

while True:
    print("\n--- Priority Queue Menu ---")
    print("1. Enqueue")
    print("2. Dequeue")
    print("3. Peek")
    print("4. Display")
    print("5. Check Empty/Full")
    print("6. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        element = input("Enter element: ")
        priority = int(input("Enter priority (lower number = higher priority): "))
        pq.enqueue(element, priority)
    elif choice == '2':
        pq.dequeue()
    elif choice == '3':
        pq.peek()
    elif choice == '4':
        pq.display()
    elif choice == '5':
        print("Queue is empty." if pq.isEmpty() else "Queue is not empty.")
        print("Queue is full." if pq.isFull() else "Queue is not full.")
    elif choice == '6':
        print("Exiting...")
        break
    else:
        print("Invalid choice!")
