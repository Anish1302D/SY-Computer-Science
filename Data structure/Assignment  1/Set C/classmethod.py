class Student:
    def __init__(self, name, roll_no):
        self.name = name
        self.roll_no = roll_no

    def display_details(self):
        print("Student Name: ", self.name)
        print("Student Roll No: ", self.roll_no)


s1 = Student("Anish", "4240038")
s1.display_details()