books = ["Algorithms", "Data Structures", "Database Systems", "Machine Learning", "Operating Systems", "Python Programming"]

search_book = input("Enter the book title to search: ")

low = 0
high = len(books) - 1
found = False

while low <= high:
    mid = (low + high) // 2
    if books[mid].lower() == search_book.lower():
        print(f"Book found at position {mid + 1}")
        found = True
        break
    elif books[mid].lower() < search_book.lower():
        low = mid + 1
    else:
        high = mid - 1

if not found:
    print("Book not found")
