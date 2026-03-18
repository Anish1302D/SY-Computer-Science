from abc import ABC, abstractmethod

class Payment(ABC):

    def __init__(self, amount):
        self._amount = amount

    @property
    def amount(self):
        return self._amount

    @abstractmethod
    def make_payment(self):
        pass


class CreditCardPayment(Payment):
    def make_payment(self):
        print("Credit Card Payment of", self.amount)


class UPIPayment(Payment):
    def make_payment(self):
        print("UPI Payment of", self.amount)


class NetBankingPayment(Payment):
    def make_payment(self):
        print("Net Banking Payment of", self.amount)


amt = float(input("Enter payment amount: "))

c = CreditCardPayment(amt)
u = UPIPayment(amt)
n = NetBankingPayment(amt)

c.make_payment()
u.make_payment()
n.make_payment()