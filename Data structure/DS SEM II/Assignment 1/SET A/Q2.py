class HashTable:
    def __init__(self, size):
        self.size = size
        self.table = [-1] * size   # -1 indicates empty slot

    # Hash function
    def hash_function(self, key):
        return key % self.size

    # a) Hash (insert) an element
    def insert(self, key):
        index = self.hash_function(key)
        start_index = index

        # Linear probing for collision handling
        while self.table[index] != -1:
            index = (index + 1) % self.size
            if index == start_index:
                print("Hash table is full!")
                return

        self.table[index] = key
        print(f"Element {key} hashed at index {index}")

    # b) Display the hash table
    def display(self):
        print("\nHash Table:")
        for i in range(self.size):
            if self.table[i] != -1:
                print(f"Index {i}: {self.table[i]}")
            else:
                print(f"Index {i}: Empty")


# -------- Main Program --------
size = int(input("Enter hash table size: "))
ht = HashTable(size)

while True:
    print("\nMenu")
    print("1. Hash an element")
    print("2. Display hash table")
    print("3. Exit")

    choice = int(input("Enter your choice: "))

    if choice == 1:
        key = int(input("Enter element to hash: "))
        ht.insert(key)

    elif choice == 2:
        ht.display()

    elif choice == 3:
        print("Exiting program.")
        break

    else:
        print("Invalid choice! Try again.")
