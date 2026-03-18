class Employee:

    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    def display(self):
        print("Name:", self.name)
        print("Salary:", self.salary)


class Developer(Employee):

    def role(self):
        print("Role: Developer")


class Tester(Employee):

    def role(self):
        print("Role: Tester")


class Manager(Employee):

    def role(self):
        print("Role: Manager")


d = Developer("Rahul", 60000)
d.display()
d.role()

t = Tester("Neha", 50000)
t.display()
t.role()

m = Manager("Amit", 80000)
m.display()
m.role()