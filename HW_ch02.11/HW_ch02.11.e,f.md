### This homework is written by 吳亭儀 (312707011)
## 02.11 (e)
**Question:**\
For the log-linear model in part (d), calculate $\hat{y}$ = exp(3.14 + 0.007 $x$) when $x$ = 20 and when $x$ = 30. Evaluate the slope of the relation between $y$ and $x$, dy/dx, for each of these $\hat{y}$ values. Based on these calculations for the log-linear model, is expenditure on food away from home increasing with respect to income at an increasing or decreasing rate?

**Ans:**\
When the equation is $y$ = exp($\beta_1$ + $\beta_2$ $x$), the slope m = dy/d$x$ = $\beta_2$*exp($\beta_1$ + $\beta_2$ $x$).

When $x$ = 20, the slope of the relation between $y$ and $x$ is 0.1860304.

When $x$ = 30, the slope of the relation between $y$ and $x$ is 0.1995191.

The increasing of slope when $x$ is increasing shows that $y$ increases with respect to $x$ at an increasing rate.

Therefore, we can conclude that expenditure on food away from home is increasing with respect to income at an increasing rate.


**Sample code**
```
x1 <- 20
slope1 <- 0.007*exp(3.14 + 0.007*x1)
print(slope1)
```
```
0.1860304
```
```
x2 <- 30
slope2 <- 0.007*exp(3.14 + 0.007*x2)
print(slope2)
```
```
0.1995191
```
## 02.11 (f)
**Question:**\
When estimating the log-linear model in part (d), the number of observations used in the regression falls to N = 2005. How many households in the sample reported no expenditures on food away from home in the past quarter?

**Ans:**\
Since natural logarithm cannot be taken when the argument is zero, it means that there are 2334 - 2005 = 329 householdes in the sample reported no expenditures on food away from home in the past quarter.
