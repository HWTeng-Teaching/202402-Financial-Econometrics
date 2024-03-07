##

This homework is written by NAME (ID)...

## ch02.01 (c)
Compute $\sum_{i=1}^{5} x^2_i, \sum_{i=1}^{5}x_i y_i $ Using these numerical values, show that $\sum{(x_i-\bar{x})^2} = \sum{x^2_i - N \bar{x}^2}$ and $\sum{(x_i - \bar{x}) (y_i - \bar{i}) = \sum{x_i y_i - N \bar{x} \bar{y}}}$ 
```
N = length(x)

x_square = x^2
sum_of_x_square = sum(x_square)
x_mul_y = x*y
sum_x_mul_y = sum(x_mul_y)

sum_of_square == (sum_of_x_square - (N*mean_x^2)) # True
covariance_xy == (sum_x_mul_y - (N*mean_x*mean_y)) # True
```

---
# ch02.01 (d)
Use the least squares estimates from part (b) to compute the fitted values of $y$, and complete the remainder of the table below. Put the sums in the last row.
Calculate the sample variance of $y$, $s^2_y = \sum_{i=1}^{N}(y_i - \bar{y})^2 / (N-1)$, the sample variance of $x$,  $s^2_x = \sum_{i=1}^{N}(x_i - \bar{x})^2 / (N-1)$, the sample correlation between $x$ and $y$, $r_{xy} = s_{xy} / (s_x s_y)$ and the coeeficient of variation of $x$, $CV_x= 100(s_x/\bar{x})$. What is the median, 50th percentile, of $x$?
### The Ordinary LEast Squares (OLS) Estimators
$b2 = \frac{\sum{(x_i-\bar{x}) \cdot (y_i -\bar{y})}}{\sum{(x_i - \bar{x})^2}} \quad (2.7)$\
$b1 = \bar{y} - b_2\bar{x} \quad (2.8)$
```
mean_x = mean(x)
mean_y = mean(y)

sum_of_square = sum((x-mean_x)^2)
covariance_xy = sum((x-mean_x)*(y-mean_y))

N = length(x)

b2 = covariance_xy / sum_of_square # 0.8
b1 = mean_y - b2*mean_x # 1.2

```
Following the code line 25 - 32, we will get the table below:

|$x_i$|$y_i$ |$\hat{y}_i$|$\hat{e}_i  $         |$\hat{e}_i^2$| $ x_i \hat{e}_i$       |
|:---:|:---:|:---------:|:---------------------:|:-----------:|:---------------------:|
| 3   | 4   | 3.6       | 0.4                   | 0.16        | 1.2                   |
| 2   | 2   | 2.8       | -0.8                  | 0.64        | -1.6                  |
| 1   | 3   | 2         | 1                     | 1           | 1                     |
| -1  | 1   | 0.4       | 0.6                   | 0.36        | -0.6                  |
| 0   | 0   | 1.2       | -1.2                  | 1.44        | 0                     |
| 5   | 10  | 10        | -2.22e-16             | 3.6         | -1.33e-15             |

---

The questions remainder just follow the code line 34 - 44\
As the <font color=red> precision error </font>, the sum of $\hat{e_i}$ & $x_i \hat{e}_i$ is not zero.
