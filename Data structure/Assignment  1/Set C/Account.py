class Account:
    def __init__(self, initial_balance=0):
        self.__balance = initial_balance  # Private variable using double underscore

    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            print(f"Deposited ₹{amount}")
        else:
            print("Deposit amount must be positive.")

    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            print(f"Withdrew ₹{amount}")
        else:
            print("Insufficient balance or invalid amount.")

    def check_balance(self):
        print(f"Current Balance: ₹{self.__balance}")

my_account = Account(1000)
my_account.deposit(100)
my_account.withdraw(500)
my_account.check_balance()