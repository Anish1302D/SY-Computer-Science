class University:
    def university_name(self):
        print("Savitribai Phule Pune University")

class College(University):
    def college_name(self):
        print("SP College")

class Student(College):
    def student_name(self):
        print("Student: Madhura")

s = Student()

s.university_name()
s.college_name()
s.student_name()