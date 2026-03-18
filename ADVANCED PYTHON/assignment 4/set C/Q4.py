class InvalidAge(Exception):
    pass

try:
    age = int(input("Enter age: "))

    if age < 18:
        raise InvalidAge("Age must be 18 or above")

    print("You are eligible")

except InvalidAge as e:
    print("Error:", e)