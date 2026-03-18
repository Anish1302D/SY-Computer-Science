class Student:

    def __init__(self, name, roll_number, marks):
        self.name = name
        self.roll_number = roll_number
        self.marks = marks

    def display_details(self):
        print("Name:", self.name)
        print("Roll Number:", self.roll_number)
        print("Marks:", self.marks)


# Accept input from user
name1 = input("Enter student1 name: ")
roll1 = int(input("Enter roll number: "))
marks1 = int(input("Enter marks: "))

name2 = input("Enter student2 name: ")
roll2 = int(input("Enter roll number: "))
marks2 = int(input("Enter marks: "))


# Create objects
s1 = Student(name1, roll1, marks1)
s2 = Student(name2, roll2, marks2)

# Display details
s1.display_details()
s2.display_details()