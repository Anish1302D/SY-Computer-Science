def reverse_string(string):
    stack = []

    for ch in string:
        stack.append(ch)

    reversed_str = ""
    while stack:
        reversed_str += stack.pop()

    return reversed_str

inp = input("Enter a string to reverse: ")
print("Reversed string:", reverse_string(inp))
