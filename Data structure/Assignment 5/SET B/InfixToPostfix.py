def precedence(op):
    if op == '+' or op == '-':
        return 1
    if op == '*' or op == '/':
        return 2
    if op == '^':
        return 3
    return 0

def infix_to_postfix(expression):
    stack = []
    output = ""

    for char in expression:
        if char.isalnum():
            output += char
        elif char == '(':
            stack.append(char)
        elif char == ')':
            while stack and stack[-1] != '(':
                output += stack.pop()
            stack.pop()
        else:
            while stack and precedence(stack[-1]) >= precedence(char):
                output += stack.pop()
            stack.append(char)

    while stack:
        output += stack.pop()

    return output

expr = input("Enter infix expression: ")
postfix = infix_to_postfix(expr)
print("Postfix expression:", postfix)
