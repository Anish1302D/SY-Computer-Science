import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("iris.csv")

print(df.head())

print("Species Count:")
print(df["species"].value_counts())

plt.scatter(df["sepal_length"], df["petal_length"])

plt.title("Sepal Length vs Petal Length")
plt.xlabel("Sepal Length")
plt.ylabel("Petal Length")

plt.show()

plt.boxplot(df["sepal_width"])

plt.title("Sepal Width Boxplot")

plt.show()