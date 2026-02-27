# Node class for linked list
class Node:
    def __init__(self, key):
        self.key = key
        self.next = None


# Hash Table class
class HashTable:
    def __init__(self, size):
        self.size = size
        self.table = [None] * size

    # Hash function
    def hash_function(self, key):
        return key % self.size

    # a) Insert a key
    def insert(self, key):
        index = self.hash_function(key)
        new_node = Node(key)

        # Insert at beginning of linked list
        if self.table[index] is None:
            self.table[index] = new_node
        else:
            new_node.next = self.table[index]
            self.table[index] = new_node

        print(f"Key {key} inserted at index {index}")

    # b) Search a key
    def search(self, key):
        index = self.hash_function(key)
        current = self.table[index]

        while current:
            if current.key == key:
                print(f"Key {key} found at index {index}")
                return True
            current = current.next

        print(f"Key {key} not found")
        return False

    # c) Delete a key
    def delete(self, key):
        index = self.hash_function(key)
        current = self.table[index]
        prev = None

        while current:
            if current.key == key:
                if prev:
                    prev.next = current.next
                else:
                    self.table[index] = current.next
                print(f"Key {key} deleted from index {index}")
                return
            prev = current
            current = current.next

        print(f"Key {key} not found, cannot delete")

    # d) Display the hash table
    def display(self):
        print("\nHash Table:")
        for i in range(self.size):
            print(f"Index {i}:", end=" ")
            current = self.table[i]
            if not current:
                print("Empty")
            else:
                while current:
                    print(current.key, end=" -> ")
                    current = current.next
                print("None")


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