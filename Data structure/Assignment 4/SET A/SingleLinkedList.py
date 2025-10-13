# Node class
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

# Singly Linked List class
class LinkedList:
    def __init__(self):
        self.head = None

    # 1. Insert a node at a given position
    def insert(self, data, position):
        new_node = Node(data)
        if position == 1:
            new_node.next = self.head
            self.head = new_node
            return

        temp = self.head
        count = 1
        while temp is not None and count < position - 1:
            temp = temp.next
            count += 1

        if temp is None:
            print("Position out of range!")
        else:
            new_node.next = temp.next
            temp.next = new_node

    # 2. Search for an element
    def search(self, x):
        temp = self.head
        position = 1
        while temp is not None:
            if temp.data == x:
                print(f"Element {x} found at position {position}")
                return
            temp = temp.next
            position += 1
        print("Element not found")

    # 3. Delete a node by value
    def delete(self, x):
        temp = self.head

        # If list is empty
        if temp is None:
            print("List is empty")
            return

        # If head node is to be deleted
        if temp.data == x:
            self.head = temp.next
            temp = None
            print(f"Element {x} deleted")
            return

        # Search for the node to be deleted
        prev = None
        while temp is not None and temp.data != x:
            prev = temp
            temp = temp.next

        # If not found
        if temp is None:
            print("Element not found")
            return

        # Unlink the node
        prev.next = temp.next
        temp = None
        print(f"Element {x} deleted")

    # 4. Display all nodes
    def display(self):
        temp = self.head
        if temp is None:
            print("List is empty")
            return
        print("Linked List:", end=" ")
        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next
        print("None")


# --- Menu-driven program ---
if __name__ == "__main__":
    ll = LinkedList()

    while True:
        print("\n--- Singly Linked List Menu ---")
        print("1. Insert")
        print("2. Search")
        print("3. Delete")
        print("4. Display")
        print("5. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            data = int(input("Enter data: "))
            pos = int(input("Enter position: "))
            ll.insert(data, pos)
        elif choice == '2':
            x = int(input("Enter element to search: "))
            ll.search(x)
        elif choice == '3':
            x = int(input("Enter element to delete: "))
            ll.delete(x)
        elif choice == '4':
            ll.display()
        elif choice == '5':
            print("Exiting program...")
            break
        else:
            print("Invalid choice! Try again.")
