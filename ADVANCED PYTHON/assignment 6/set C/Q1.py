import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("student_marks.csv")

print("Columns:", df.columns)
print("Shape:", df.shape)

print("Random 5 rows:")
print(df.sample(5))

print("Maximum Marks:", df["Marks"].max())
print("Minimum Marks:", df["Marks"].min())

plt.hist(df["Marks"])

plt.title("Student Marks Distribution")
plt.xlabel("Marks")
plt.ylabel("Frequency")

plt.show()