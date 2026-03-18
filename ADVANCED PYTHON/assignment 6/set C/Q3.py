import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("StudentsPerformance.csv")

print(df.head(10))

print("Missing Values:")
print(df.isnull().sum())

df.fillna(df.mean(numeric_only=True), inplace=True)

avg = df[["math score","reading score","writing score"]].mean()

avg.plot(kind="bar")

plt.title("Average Marks of Students")
plt.ylabel("Marks")

plt.show()