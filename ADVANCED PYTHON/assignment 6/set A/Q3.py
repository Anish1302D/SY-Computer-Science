import matplotlib.pyplot as plt

brands = ["Samsung","Apple","Xiaomi","Others"]
share = [35,25,20,20]

plt.pie(share, labels=brands, autopct='%1.1f%%')

plt.title("Mobile Market Share")

plt.show()