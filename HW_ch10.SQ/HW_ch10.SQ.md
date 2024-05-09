### This homework is written by 陳家祺(312707002)

#### Special Question: Demo using python: sample mean converges to population

Given: $$X \sim \mathcal{N}(10, 5^2)$$

define: $$\overline{X}_{n} = \frac{x_1 + x_2 + \ldots + x_n}{n}$$

We can plot density plots for n=10, n=100, and n=1000.

<img width="866" alt="截圖 2024-05-09 下午2 11 34" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/107116674/0ec071c3-8773-4c87-85ce-32e2e20c7c15">

```{python}
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt 
import seaborn as sns

for i in range(1, 1000):
    a = np.random.normal(loc=10, scale=5, size=1000)
    y[i] = a
x1_bar = y[0]
x2_bar = (y[0]+y[1])/2
x10_bar = y.iloc[:, :10].sum(axis=1)/10
x100_bar = y.iloc[:, :100].sum(axis=1)/100
x1000_bar = y.iloc[:, :1000].sum(axis=1)/1000

plt.figure(figsize=(10, 6))
sns.kdeplot(x1000_bar, color='red', linewidth=2, label='X1000_bar')
sns.kdeplot(x100_bar, color='orange', linewidth=2, label='X100_bar')
sns.kdeplot(x10_bar, color='skyblue', linewidth=2, label='X10_bar')
plt.title('Density plot of sum of different n')
plt.xlabel('Sum')
plt.ylabel('Density')
plt.grid(True)
plt.legend() 
plt.show()
```

Also we can given that: $$X \sim \mathcal{U}(0, 10)$$
We can thus determine that the $\mu$ of X will be (0+10)/2=5.
