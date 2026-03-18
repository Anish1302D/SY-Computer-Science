from abc import ABC, abstractmethod


class Appliance(ABC):

    @abstractmethod
    def operate(self):
        pass


class WashingMachine(Appliance):
    def operate(self):
        print("Washing Machine is washing clothes")


class Microwave(Appliance):
    def operate(self):
        print("Microwave is heating food")


w = WashingMachine()
m = Microwave()

w.operate()
m.operate()