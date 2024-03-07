#
## This homework is written by 312707001 葉宗翰
# ch02.25 (e)
Plot ln(FOODAWAY) against INCOME, and include the fitted line from part (d).
```
setwd("C:/Users/User/Desktop")
cex5_small <- read.csv("cex5_small.csv")
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
Calculate the least squares residuals from the estimation in part (d). Plot them vs. INCOME. 
Do you find any unusual patterns, or do they seem completely random?
```
plot(resid(regmod3) ~income, data = cex5_small)
residuals<- residuals(regmod3)
print(residuals)
```
![Rplot01](https://github.com/HWTeng-Course/202402-FinEco/assets/150407278/98827e1e-067f-41e1-9468-a4cd84454db2)
---
The least squares residuals are a 1200*1 matrix,due to layout constraints, it is not suitable to display the results.\
The patterns of the OLS residuals versus income seem completely random.
