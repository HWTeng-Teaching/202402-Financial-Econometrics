#
## This homework is written by  葉宗翰 (312707001)
# ch02.25 (e)
Question:\
Plot ln(FOODAWAY) against INCOME, and include the fitted line from part (d).


Solution:
```
library(POE5Rdata)
data("cps5_small")
lnfoodaway <- log(cex5_small$foodaway)
lnfoodaway[is.infinite(lnfoodaway)] <- NA
plot(cex5_small$income, cex5_small$lnfoodaway, xlab = "Income",ylab = "ln(foodaway)",main = "Scatterplot + Fitted Line")
intercept <- coef(regmod3)[1]
slope <- coef(regmod3)[2]
abline(a = intercept, b = slope, col = "red")
```

![Rplot02](https://github.com/HWTeng-Course/202402-FinEco/assets/150407278/ea070fcf-5471-40f5-9bc0-dec7ac9b3d0c)


---
# ch02.25 (f)
Question: \
Calculate the least squares residuals from the estimation in part (d).\
Plot them vs. INCOME. Do you find any unusual patterns, or do they seem completely random?

Solution:
```
plot(resid(regmod3) ~income, data = cex5_small)
residuals<- residuals(regmod3)
print(residuals)
```

![24](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/150407278/f1f26d76-8a38-40f7-960d-60d4304d8314)

![Rplot01](https://github.com/HWTeng-Course/202402-FinEco/assets/150407278/98827e1e-067f-41e1-9468-a4cd84454db2)
---
The least squares residuals is a 1*1200 vector, due to layout constraints, I only display partial results.\
The patterns of the OLS residuals versus income seem completely random.
