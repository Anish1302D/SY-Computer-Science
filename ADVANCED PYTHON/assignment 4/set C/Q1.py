class LengthError(Exception):
    pass

try:
    text = input("Enter string: ")

    if len(text) > 10:
        raise LengthError("String length exceeded limit")

    print("String accepted")

except LengthError as e:
    print("Error:", e)