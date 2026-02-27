class HashTable:
    def __init__(self, size):
        self.size = size
        self.table = [None] * size
        self.DELETED = "DELETED"

    # Hash function
    def hash_function(self, key):
        return key % self.size

    # a) Insert a key
    def insert(self, key):
        index = self.hash_function(key)
        start_index = index

        while self.table[index] not in (None, self.DELETED):
            index = (index + 1) % self.size
            if index == start_index:
                print("Hash table is full!")
                return

        self.table[index] = key
        print(f"Key {key} inserted at index {index}")

    # b) Search a key
    def search(self, key):
        index = self.hash_function(key)
        start_index = index

        while self.table[index] is not None:
            if self.table[index] == key:
                print(f"Key {key} found at index {index}")
                return index
            index = (index + 1) % self.size
            if index == start_index:
                break

        print(f"Key {key} not found")
        return -1

    # c) Delete a key
    def delete(self, key):
        index = self.search(key)
        if index != -1:
            self.table[index] = self.DELETED
            print(f"Key {key} deleted")

    # d) Display the hash table
    def display(self):
        print("\nHash Table:")
        for i in range(self.size):
            if self.table[i] is None:
                print(f"Index {i}: Empty")
            elif self.table[i] == self.DELETED:
                print(f"Index {i}: Deleted")
            else:
                print(f"Index {i}: {self.table[i]}")


# -------- Main Program --------
size = int(input("Enter size of hash table: "))
ht = HashTable(size)

while True:
    print("\nMenu")
    print("1. Insert key")
    print("2. Search key")
    print("3. Delete key")
    print("4. Display hash table")
    print("5. Exit")

    choice = int(input("Enter your choice: "))

    if choice == 1:
        key = int(input("Enter key to insert: "))
        ht.insert(key)

    elif choice == 2:
        key = int(input("Enter key to search: "))
        ht.search(key)

    elif choice == 3:
        key = int(input("Enter key to delete: "))
        ht.delete(key)

    elif choice == 4:
        ht.display()

    elif choice == 5:
        print("Exiting program.")
        break

    else:
        print("Invalid choice! Try again.")