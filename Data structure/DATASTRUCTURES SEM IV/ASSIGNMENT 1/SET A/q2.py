class hashtable:
    def __init__(self, size):
        self.size = size
        self.table = [-1] * size

    def hash_function(self, key):
        return key % self.size

    def insert(self, key):
        index = self.hash_function(key)
        start_index = index

        while self.table[index] != -1 :
            index = (index + 1) % self.size
            if index == start_index:
                print("hash table is full")
                return

        self.table[index] = key
        print(f"element{key} hashed at index {index}")

    def display(self):
        print("\n hash table")
        for i in range(self.size):
            if self.table[i] != -1:
                print(f" index{i} : {self.table[i]}")
            else:
                print(f" index{i} : empty")

size = int(input("enter size of hash table: "))
ht = hashtable(size)

while True:
    print("\n menu")
    print("1. Insert hash an element")
    print("2. Display hash table")
    print("3. Exit")

    choice = int(input("enter choice: "))

    if choice == 1:
        key = int(input("enter element to hash: "))
        ht.insert(key)

    elif choice == 2:
        ht.display()

    elif choice == 3:
        print("exit")
        break
    else:
        print(" invalid choice! please try again. ")