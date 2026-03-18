numbers = [10, 5, 0, "a", 2]

for n in numbers:
    try:
        print("Reciprocal:", 1/n)

    except ZeroDivisionError:
        print("Cannot divide by zero")

    except TypeError:
        print("Invalid data type")