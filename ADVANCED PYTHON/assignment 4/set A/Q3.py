try:
    file = open("sample.txt", "r")
    data = file.read()
    print(data)
    file.close()

except FileNotFoundError:
    print("Error: File not found")