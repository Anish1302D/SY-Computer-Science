class HashTable:
    def __init__(self, size):
        self.size = size
        self.table = [-1] * size   # -1 indicates empty slot

    # Hash function
    def hash_function(self, key):
        return key % self.size

    # Insert roll number using linear probing
    def insert(self, roll_no):
        index = self.hash_function(roll_no)

        # Linear probing in case of collision
        start_index = index
        while self.table[index] != -1:
            index = (index + 1) % self.size
            if index == start_index:
                print("Hash Table is Full!")
                return

        self.table[index] = roll_no
        print(f"Roll number {roll_no} inserted at index {index}")

    # Display hash table
    def display(self):
        print("\nHash Table:")
        for i in range(self.size):
            if self.table[i] != -1:
                print(f"Index {i}: {self.table[i]}")
            else:
                print(f"Index {i}: Empty")
class HashTable:
    def __init__(self, size):
        self.size = size
        self.table = [-1] * size   # -1 indicates empty slot

    # Hash function
    def hash_function(self, key):
        return key % self.size

    # Insert roll number using linear probing
    def insert(self, roll_no):
        index = self.hash_function(roll_no)

        # Linear probing in case of collision
        start_index = index
        while self.table[index] != -1:
            index = (index + 1) % self.size
            if index == start_index:
                print("Hash Table is Full!")
                return

        self.table[index] = roll_no
        print(f"Roll number {roll_no} inserted at index {index}")

    # Display hash table
    def display(self):
        print("\nHash Table:")
        for i in range(self.size):
            if self.table[i] != -1:
                print(f"Index {i}: {self.table[i]}")
            else:
                print(f"Index {i}: Empty")


# -------- Main Program --------
size = int(input("Enter size of hash table: "))
hash_table = HashTable(size)

while True:
    print("\n1. Insert Roll Number")
    print("2. Display Hash Table")
    print("3. Exit")

    choice = int(input("Enter your choice: "))

    if choice == 1:
        roll_no = int(input("Enter student roll number: "))
        hash_table.insert(roll_no)

    elif choice == 2:
        hash_table.display()

    elif choice == 3:
        print("Exiting program.")
        break

    else:
        print("Invalid choice! Try again.")


# -------- Main Program --------
size = int(input("Enter size of hash table: "))
hash_table = HashTable(size)

while True:
    print("\n1. Insert Roll Number")
    print("2. Display Hash Table")
    print("3. Exit")

    choice = int(input("Enter your choice: "))

    if choice == 1:
        roll_no = int(input("Enter student roll number: "))
        hash_table.insert(roll_no)

    elif choice == 2:
        hash_table.display()

    elif choice == 3:
        print("Exiting program.")
        break

    else:
        print("Invalid choice! Try again.")
