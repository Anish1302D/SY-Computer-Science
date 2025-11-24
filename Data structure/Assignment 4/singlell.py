class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None

    # Insert at the end
    def insert(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
        else:
            temp = self.head
            while temp.next:
                temp = temp.next
            temp.next = new_node

    # Search for a value
    def search(self, x):
        temp = self.head
        pos = 1
        while temp:
            if temp.data == x:
                print(f"Found {x} at position {pos}")
                return
            temp = temp.next
            pos += 1
        print(f"{x} not found")

    # Delete a value
    def delete(self, x):
        temp = self.head
        prev = None
        while temp:
            if temp.data == x:
                if prev:
                    prev.next = temp.next
                else:
                    self.head = temp.next
                print(f"{x} deleted")
                return
            prev = temp
            temp = temp.next
        print(f"{x} not found")

    # Display elements
    def display(self):
        temp = self.head
        if not temp:
            print("List is empty")
            return
        print("Linked List:", end=" ")
        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next
        print("None")

# Simple menu
ll = LinkedList()
while True:
    print("\n1. Insert\n2. Search\n3. Delete\n4. Display\n5. Exit")
    choice = input("Choice: ")
    if choice == '1':
        ll.insert(int(input("Enter data: ")))
    elif choice == '2':
        ll.search(int(input("Enter element to search: ")))
    elif choice == '3':
        ll.delete(int(input("Enter element to delete: ")))
    elif choice == '4':
        ll.display()
    elif choice == '5':
        break
    else:
        print("Invalid choice!")