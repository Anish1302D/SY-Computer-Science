# Patient Queue class
class HospitalQueue:
    def __init__(self):
        self.queue = []  # list of tuples: (patient_name, priority, arrival_order)
        self.counter = 0  # to track order of arrival

    # Enqueue patient
    def enqueue(self, patient_name, priority):
        self.counter += 1
        self.queue.append((patient_name, priority, self.counter))
        # Sort by priority first, then by arrival order
        self.queue.sort(key=lambda x: (x[1], x[2]))
        print(f"Patient '{patient_name}' with priority {priority} added to queue.")

    # Dequeue patient
    def dequeue(self):
        if not self.queue:
            print("Queue is empty! No patient to treat.")
            return
        patient_name, priority, _ = self.queue.pop(0)
        print(f"Treating patient '{patient_name}' with priority {priority}.")

    # Peek next patient
    def peek(self):
        if not self.queue:
            print("Queue is empty.")
            return
        patient_name, priority, _ = self.queue[0]
        print(f"Next patient to treat: '{patient_name}' with priority {priority}.")

    # Display all patients
    def display(self):
        if not self.queue:
            print("Queue is empty.")
            return
        print("Patients in queue (patient -> priority):")
        for patient_name, priority, _ in self.queue:
            print(f"{patient_name} -> {priority}")


# -------- Menu-driven program --------
hq = HospitalQueue()

while True:
    print("\n--- Hospital Patient Queue ---")
    print("1. Add Patient")
    print("2. Treat Next Patient")
    print("3. Peek Next Patient")
    print("4. Display Queue")
    print("5. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        name = input("Enter patient name: ")
        priority = int(input("Enter priority (lower number = higher urgency): "))
        hq.enqueue(name, priority)
    elif choice == '2':
        hq.dequeue()
    elif choice == '3':
        hq.peek()
    elif choice == '4':
        hq.display()
    elif choice == '5':
        print("Exiting...")
        break
    else:
        print("Invalid choice!")
