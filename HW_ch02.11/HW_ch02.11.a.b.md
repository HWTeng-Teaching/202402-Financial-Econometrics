#### This homework is written by 施昱全 (312707008)
## 02.11
## Let y = expenditure($) on food away from home per household member per month in the past quarter and x = monthly household income(in hundreds of dollars) during the past year.

### 02.11(a)
**Question:**\
Using 2013 data from three-person households (N = 2334), we obtain least squares estimates $\hat{y}$ = 13.77 + 0.52x. Interpret the estimated slope and intercept from this relation.

**Ans:**\
Slope 0.52 means when monthly household income increases $100 per month, there would be an additional $0.52 expenditure, on average, on food away from home. Intercept 13.77 means if monthly household income is zero, we estimate, on average, the household will spend $13.77 on food away.

### 02.11(b)
**Question:**\
Predict the expenditures on food away from home for a household with $2000 amonth income.

**Ans:**\
We know that when household income is $2000 per month, on average, the expenditure on food away per month is $24.17.

**Sample code**
```
y = 13.77 + 0.52 * (2000 / 100)
cat(y)
```
```
24.17
```
