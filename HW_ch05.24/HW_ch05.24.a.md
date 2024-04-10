## This homework is written by 游政諺 (311707012)
## ch05.24 (a)
Q: Report the results. Are the estimated coefficients significantly different from zero?

The estimated model is

$PRICE = \beta_1 + \beta_2 SQFT + \beta_3 (SQFT * AGE)+e$

```
price <- collegetown$price
sqft <- collegetown$sqft
age <- price*sqft

linear_model <- lm(price~sqft+age)
sum_linear <- summary(linear_model)
sum_linear

```
![image](https://github.com/adni7413/ch05.24.a.1/raw/main/%E4%BD%9C%E6%A5%AD51.png)


H0: estimated coefficients equal zero

H1: estimated coefficients different from zero

At 90% and 95% confidence levels, the p-values ​​of  $\beta_3$ and $\beta_1$ are both less than 0.1 and 0.05, rejecting the null hypothesis. 

However, the p-value of $\beta_2$ is greater than 0.1 and 0.05, so the null hypothesis is not rejected. Assume that it is not significantly different from 0
