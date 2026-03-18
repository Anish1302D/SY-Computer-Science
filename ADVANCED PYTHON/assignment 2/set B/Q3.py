class User:

    def __init__(self, name):
        self.name = name

    def show_user(self):
        print("User Name:", self.name)


class Customer(User):

    def customer_info(self):
        print("This is a Customer")


class DeliveryPerson(User):

    def delivery_info(self):
        print("This is a Delivery Person")


c = Customer("Riya")
c.show_user()
c.customer_info()

d = DeliveryPerson("Arjun")
d.show_user()
d.delivery_info()