text = input("Enter a string: ")

ch = input("Enter a character to search: ")

found = False
for i in range(len(text)):
    if text[i] == ch:
        print(f"Character '{ch}' found at position {i + 1}")
        found = True
        break

if not found:
    print("Character not found")
