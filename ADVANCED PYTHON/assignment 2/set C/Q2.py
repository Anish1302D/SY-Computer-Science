# Base class
class Employee:

    def calculate_salary(self):
        print("Salary calculation for employee")


# Derived class Manager
class Manager(Employee):

    def calculate_salary(self):
        salary = 50000 + 10000   # base + bonus
        print("Manager Salary =", salary)


# Derived class Developer
class Developer(Employee):

    def calculate_salary(self):
        salary = 40000 + 5000   # base + project bonus
        print("Developer Salary =", salary)


# Runtime polymorphism
e1 = Manager()
e2 = Developer()

e1.calculate_salary()
e2.calculate_salary()