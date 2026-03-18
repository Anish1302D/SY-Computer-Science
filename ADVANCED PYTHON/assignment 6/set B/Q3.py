import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

data = {
"Maths":[78,82,85,90,88,76],
"Science":[70,75,80,85,82,78],
"English":[65,70,72,75,78,80]
}

df = pd.DataFrame(data)

sns.boxplot(data=df)

plt.title("Subject Marks Boxplot")

plt.show()