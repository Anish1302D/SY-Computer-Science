import matplotlib.pyplot as plt

subjects = ["Python","Java","C++","JS"]
students = [50,40,30,45]

plt.bar(subjects, students, label="Students")

plt.title("Students Enrolled in Subjects")
plt.xlabel("Subjects")
plt.ylabel("Number of Students")
plt.legend()

plt.show()