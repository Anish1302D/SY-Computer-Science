try:
    num = int(input("Enter number: "))

    try:
        result = 100 / num
        print("Result:", result)

    except ZeroDivisionError:
        print("Inner Error: Division by zero")

except ValueError:
    print("Outer Error: Invalid input")