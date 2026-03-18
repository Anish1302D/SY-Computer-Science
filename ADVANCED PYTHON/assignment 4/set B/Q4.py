try:
    file = open("numbers.txt", "r")

    for line in file:
        try:
            num = int(line.strip())
            print("Number:", num)

        except ValueError:
            print("Invalid data skipped")

    file.close()

except FileNotFoundError:
    print("File not found")