import matplotlib.pyplot as plt

height = [150,160,165,170,175,180]
weight = [55,60,62,68,75,80]

plt.scatter(height, weight, marker="o")

plt.title("Height vs Weight")
plt.xlabel("Height (cm)")
plt.ylabel("Weight (kg)")

plt.show()