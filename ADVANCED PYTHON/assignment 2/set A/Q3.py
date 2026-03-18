class Calculator:

    def __init__(self, a, b):
        self.a = a
        self.b = b

    def add(self):
        print("Addition =", self.a + self.b)

    def subtract(self):
        print("Subtraction =", self.a - self.b)

    def multiply(self):
        print("Multiplication =", self.a * self.b)

    def divide(self):
        print("Division =", self.a / self.b)


# Input numbers
a = int(input("Enter first number: "))
b = int(input("Enter second number: "))

# Create object
c = Calculator(a, b)

# Call methods
c.add()
c.subtract()
c.multiply()
c.divide()