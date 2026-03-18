import pandas as pd

data = {
    "Name": ["A","B","B","C"],
    "Marks": [80,None,90,70],
    "Age": [20,21,21,19]
}

df = pd.DataFrame(data)

# Remove duplicates
df = df.drop_duplicates()

# Fill missing values with mean
df["Marks"] = df["Marks"].fillna(df["Marks"].mean())

# Sort by two columns
df = df.sort_values(by=["Marks","Age"], ascending=[True, False])

print(df)
 