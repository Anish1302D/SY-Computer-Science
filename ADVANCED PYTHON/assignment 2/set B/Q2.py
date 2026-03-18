class ATM:

    def __init__(self, pin):
        self.__pin = pin   # private variable

    def validate_pin(self, entered_pin):
        if entered_pin == self.__pin:
            print("Access Granted")
        else:
            print("Access Denied")


pin = int(input("Set ATM PIN: "))

atm = ATM(pin)

entered = int(input("Enter PIN: "))

atm.validate_pin(entered)