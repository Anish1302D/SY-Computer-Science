class Person:
    def __init__(self, name, age):
        self._name = name
        self._age = age

    @property
    def name(self):
        return self._name

    @property
    def age(self):
        return self._age

    def display(self):
        print("Name:", self.name)
        print("Age:", self.age)


class Student(Person):
    def __init__(self, name, age, roll, marks):
        super().__init__(name, age)
        self._roll = roll
        self._marks = marks

    @property
    def roll(self):
        return self._roll

    @property
    def marks(self):
        return self._marks


name = input("Enter name: ")
age = int(input("Enter age: "))
roll = int(input("Enter roll number: "))
marks = float(input("Enter marks: "))

s = Student(name, age, roll, marks)

s.display()
print("Roll No:", s.roll)
print("Marks:", s.marks)