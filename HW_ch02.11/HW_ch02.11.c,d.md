### This homework is written by 歐陽君欣 (312707009)
## 02.11 (c)
**Question:**\
Calculate the elasticity of expenditure on food away from home with respect to income when household income is $2000 per month. [ Hint: Elasticity must be calculated for a point on the fitted regression.]

**Ans:**\
The elasticity of mean expenditure with respect to income is:

$$ \varepsilon = \frac{\frac{\Delta y}{y}}{\frac{\Delta x}{x}} = \beta_2 \times \frac{x}{\beta_1 + \beta_2x} $$

When the household income is $2000 per month, the elasticity of expenditure on food away from home with respect to income is 0.4302855. [Teng: Wrong interpretations! 9:11 20240315]

**Sample code**
```
x1 <- 2000 / 100
b1 <- 13.77
b2 <- 0.52
yhat <- b1 + b2 * x1
elas <- b2 * x1 / yhat
print(elas)
```
```
0.4302855
```
## 02.11 (d)
**Question:**\
We estimate the log-linear model to be $\hat{ln(y)}$ = 3.14 + 0.007x. What is the estimated elasticity of expenditure on food away from home with respect to income, if household income is $2000 per month?

**Ans:**\
When it became log-linear model, while the household income is $2000 per month, the estimated elasticity of expendture on food away from home with respect to income is 0.14.

**Sample code**
```
b11 <- 3.14
b22 <- 0.007
x2 <- 2000/100
ln_yhat <- b11 + b22 * x2
yhat <- exp(b11 + b22 * x2)
slope <- b22 * exp(b11 + b22 * x2)
elas1 = slope * x2 / yhat
print(elas1)
```
```
0.14
```
