import matplotlib.pyplot as plt

x = [1,2,3,4,5]
y = [5,10,15,8,20]

plt.plot(x, y, color="red", linestyle="--", marker="o", label="Line Data")

plt.title("Customized Line Chart")
plt.xlabel("X Axis")
plt.ylabel("Y Axis")
plt.legend()

plt.show()