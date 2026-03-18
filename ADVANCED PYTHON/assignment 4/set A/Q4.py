try:
    num = int(input("Enter a number: "))
    print("Integer value:", num)

except ValueError:
    print("ValueError: Invalid number")

except TypeError:
    print("TypeError occurred")