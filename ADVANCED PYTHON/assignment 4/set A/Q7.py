try:
    num = int(input("Enter number: "))
    result = 100 / num

except ZeroDivisionError:
    print("Cannot divide by zero")

else:
    print("Result:", result)

finally:
    print("Program finished")