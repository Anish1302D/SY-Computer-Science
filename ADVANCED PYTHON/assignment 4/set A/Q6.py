class NegativeNumberError(Exception):
    pass

def check_number(num):
    if num < 0:
        raise NegativeNumberError("Negative number not allowed")
    else:
        print("Number is:", num)

try:
    n = int(input("Enter a number: "))
    check_number(n)

except NegativeNumberError as e:
    print("Error:", e)