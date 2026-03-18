import pandas as pd

data = {
    "Name": ["Amit","Neha","Riya"],
    "Age": [20,21,19]
}

df = pd.DataFrame(data)

print("Age column:\n", df["Age"])