def is_palindrome(string):
    stack = []
    for ch in string:
        stack.append(ch)

    reversed_str = ""
    while stack:
        reversed_str += stack.pop()

    if string.upper() == reversed_str.upper():
        print(f"{string} → Palindrome")
    else:
        print(f"{string} → Not a palindrome")

inp = input("Enter a string to check palindrome: ")
is_palindrome(inp)
