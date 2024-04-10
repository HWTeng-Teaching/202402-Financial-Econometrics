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

以 90% 以及 95% 信心水準來說，檢定量 $\beta_3$ 以及 $\beta_1$ 的 p value 皆遠小於 0.1 以及 0.05，拒絕虛無假設，顯著異於0

而 $\beta_2$ 的 p value 因大於於 0.1 以及 0.05，故不拒絕虛無假設，不顯著異於0
