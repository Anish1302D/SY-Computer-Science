class Book:

    def __init__(self, title, author, price):
        self.title = title
        self.author = author
        self.price = price

    def show_book_info(self):
        print("Title:", self.title)
        print("Author:", self.author)
        print("Price:", self.price)


# Input from user
title = input("Enter book title: ")
author = input("Enter author name: ")
price = float(input("Enter price: "))

# Create object
b1 = Book(title, author, price)

# Display information
b1.show_book_info()