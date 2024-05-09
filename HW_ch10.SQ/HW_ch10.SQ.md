### This homework is written by 陳家祺(312707002)

#### Special Question: Demo using python: sample mean converges to population

Given: $$X \sim \mathcal{N}(10, 5^2)$$

define: $$\bar{X_n} = \frac{x_1 + x_2 + \ldots + x_n}{n}$$

We can plot distribution of Means for $n$=10, $n$=100, and $n$=1000.

<img width="849" alt="截圖 2024-05-09 下午2 34 40" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/107116674/2b9595dd-67a0-4f74-b7cc-3f993ea6de28">


```{python}
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt 
import seaborn as sns

y = np.random.normal(loc=10, scale=5, size=(1000,1000))
y = pd.DataFrame(y)
y

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
We can thus determine that the mean of $X$ is $\\mu = \frac{{0+10}}{2} = 5\$.
We can plot distribution of Means for $n$=10, $n$=100, and $n$=1000,too.
<img width="850" alt="截圖 2024-05-09 下午2 35 56" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/107116674/0d38c5f4-940b-4b16-bf9f-b1335fefd6ab">

```{python}
#uniform
X = np.random.uniform(0, 10, size=(1000, 1000))
X = pd.DataFrame(X)
X

x1_bar = X[0]
x2_bar = (X[0]+X[1])/2
x10_bar = X.iloc[:, :10].sum(axis=1)/10
x100_bar = X.iloc[:, :100].sum(axis=1)/100
x1000_bar = X.iloc[:, :1000].sum(axis=1)/1000

plt.figure(figsize=(10, 6))
sns.kdeplot(x1000_bar, color='red', linewidth=2, label='X1000_bar')
sns.kdeplot(x100_bar, color='orange', linewidth=2, label='X100_bar')
sns.kdeplot(x10_bar, color='skyblue', linewidth=2, label='X10_bar')
plt.title('Distribution of Means')
plt.xlabel('X_bar')
plt.ylabel('Frequency')
plt.grid(True)
plt.legend() 
plt.show()
```

From the above two examples, we can observe that as $n$ becomes larger, the distribution plot of $\bar{X_n}$ becomes narrower. Moreover, as $\lim_{n \to \infty}\{\bar{X_n} \to \mu}$


