### This homework is written by 歐陽君欣 (312707009)
## 02.11 (c)
**Question:**\
Calculate the elasticity of expenditure on food away from hohme with respect to income when household income is $2000 per month. [ Hint: Elasticity must be calculated for a point on the fitted regression.]

**Ans:**\
When the household income is $2000 per month, the elasticity of expenditure on food away from home with respect to income is 0.4302855.

**Sample code**
```
x1 <- 2000 / 100
b1 <- 13.77
b2 <- 0.52
yhat <- b1 + b2 * x1
elas <- b2 * x1 / yhat
print(elas)
```
## 02.11 (d)
**Question:**\
We estimate the log-linear model to be $\hat{ln(y)}$ = 3.14 + 0.007x. What is the estimated elasticity of expenditure on food away from home with respect to income, if household income is $2000 per month?

**Ans:**\
