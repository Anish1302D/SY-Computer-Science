# Node class for doubly linked list
class Node:
    def __init__(self, data):
        self.data = data
        self.prev = None
        self.next = None

# Doubly linked list class
class DoublyLinkedList:
    def __init__(self):
        self.head = None

    # 1. Insert at the end
    def insert(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
        else:
            temp = self.head
            while temp.next:
                temp = temp.next
            temp.next = new_node
            new_node.prev = temp
        print(f"{data} inserted")

    # 2. Search for element
    def search(self, x):
        temp = self.head
        pos = 1
        while temp:
            if temp.data == x:
                print(f"{x} found at position {pos}")
                return
            temp = temp.next
            pos += 1
        print("Element not found")

    # 3. Delete a node
    def delete(self, x):
        temp = self.head
        while temp:
            if temp.data == x:
                if temp.prev:
                    temp.prev.next = temp.next
                else:  # Deleting head
                    self.head = temp.next
                if temp.next:
                    temp.next.prev = temp.prev
                print(f"{x} deleted")
                return
            temp = temp.next
        print("Element not found")

    # 4. Display nodes in both directions
    def display(self):
        if self.head is None:
            print("List is empty")
            return

        # Forward direction
        temp = self.head
        print("Forward: ", end="")
        last = None
        while temp:
            print(temp.data, end=" <-> ")
            last = temp
            temp = temp.next
        print("None")

        # Backward direction
        print("Backward:", end=" ")
        while last:
            print(last.data, end=" <-> " if last.prev else "")
            last = last.prev
        print()

# ---------------- Menu-driven program ----------------
dll = DoublyLinkedList()

while True:
    print("\n--- Doubly Linked List Menu ---")
    print("1. Insert")
    print("2. Search")
    print("3. Delete")
    print("4. Display")
    print("5. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        data = int(input("Enter data: "))
        dll.insert(data)
    elif choice == '2':
        x = int(input("Enter element to search: "))
        dll.search(x)
    elif choice == '3':
        x = int(input("Enter element to delete: "))
        dll.delete(x)
    elif choice == '4':
        dll.display()
    elif choice == '5':
        print("Exiting...")
        break
    else:
        print("Invalid choice!")
