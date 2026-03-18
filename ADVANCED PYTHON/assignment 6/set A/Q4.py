import matplotlib.pyplot as plt

marks = [55,60,65,70,72,75,80,82,85,90,92]

plt.hist(marks)

plt.title("Marks Distribution")
plt.xlabel("Marks")
plt.ylabel("Frequency")

plt.show()