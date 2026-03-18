import pandas as pd

data = {
    "Name": ["A","B","C","D"],
    "Class": ["A","A","B","B"],
    "Marks": [80,90,70,85]
}

df = pd.DataFrame(data)

avg = df.groupby("Class")["Marks"].mean()

print(avg)