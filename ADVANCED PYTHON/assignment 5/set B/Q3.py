import pandas as pd

df = pd.read_csv("students.csv")

result = df[df["Marks"] > 80]

print(result)