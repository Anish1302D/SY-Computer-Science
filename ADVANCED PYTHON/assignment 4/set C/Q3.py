try:
    num = int(input("Enter number: "))

    if num < 0:
        raise ValueError("Number cannot be negative")

except ValueError as e:
    print("Error:", e)

else:
    print("Number is:", num)

finally:
    print("Program executed")