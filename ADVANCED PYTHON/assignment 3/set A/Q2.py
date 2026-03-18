class Vehicle:
    def start(self):
        print("Starting vehicle")


class Car(Vehicle):
    def start(self):
        print("Starting car")


v = Vehicle()
c = Car()

v.start()
c.start()