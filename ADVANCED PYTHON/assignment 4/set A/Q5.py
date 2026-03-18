try:
    num = int(input("Enter number: "))
    result = 10 / num
    print("Result:", result)

except (ZeroDivisionError, ValueError):
    print("Error: Invalid input or division by zero")