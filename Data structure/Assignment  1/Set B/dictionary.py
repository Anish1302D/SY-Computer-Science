student = {
    "name": "Anish",
    "age": 19,
    "course": "Computer Science"
}

print("Keys: ")
for key in student:
    print(key)

print("\nValues: ")
for value in student.values():
    print(value)

print("\nKey-value pairs:")
for key, value in student.items():
    print(key,":", value)

student["age"] = 20

print("Updated dictionary is: \n", student)