class Vehicle:
    def start(self):
        print("Starting vehicle")


class Car(Vehicle):
    def start(self):
        print("Starting car")


v = Vehicle()
c = Car()

print("Enter ur choice :")
print("1. Vehicle")
print("2. Car")

choice = int(input("Enter 1 or 2 :-"))

if choice == 1:
    v.start()
elif choice == 2:
    c.start()
else:
    print("Invalid choice ")
