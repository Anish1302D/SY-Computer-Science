class ATM:

    def __init__(self):
        self.__pin = 1234   # private variable

    def validate_pin(self, entered_pin):
        if entered_pin == self.__pin:
            print("Access Granted")
        else:
            print("Access Denied")

pin = int(input('Enter a pin'))
atm = ATM()
atm.validate_pin(pin)
