import random


# Node class
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


# Circular singly linked list class
class CircularLinkedList:
    def __init__(self):
        self.head = None

    # 1. Append n elements
    def append(self, n, random_elements=False):
        for i in range(n):
            if random_elements:
                data = random.randint(1, 100)  # generate random integers
            else:
                data = int(input(f"Enter element {i + 1}: "))

            new_node = Node(data)
            if self.head is None:
                self.head = new_node
                new_node.next = self.head
            else:
                temp = self.head
                while temp.next != self.head:
                    temp = temp.next
                temp.next = new_node
                new_node.next = self.head
        print(f"{n} elements appended successfully!")

    # 2. Display all elements
    def display(self):
        if self.head is None:
            print("List is empty")
            return

        temp = self.head
        print("Circular Linked List:", end=" ")
        while True:
            print(temp.data, end=" -> ")
            temp = temp.next
            if temp == self.head:
                break
        print("(back to head)")


# -------- Menu-driven program --------
cll = CircularLinkedList()

while True:
    print("\n--- Circular Singly Linked List Menu ---")
    print("1. Append elements")
    print("2. Display list")
    print("3. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        n = int(input("How many elements to append? "))
        mode = input("Input manually or generate randomly? (m/r): ").lower()
        if mode == 'r':
            cll.append(n, random_elements=True)
        else:
            cll.append(n)
    elif choice == '2':
        cll.display()
    elif choice == '3':
        print("Exiting...")
        break
    else:
        print("Invalid choice! Try again.")
