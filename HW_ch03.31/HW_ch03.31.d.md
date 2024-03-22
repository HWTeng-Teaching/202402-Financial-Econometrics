#### This homework is written by 黃子騏 (312707036)
### (d)
**Question:**\
Construct a 90% interval estimate for the expected number of cans sold in a week when the 
price per can is 70 cents.

**Ans:**\
To estimate $E(Y_i)$, one needs to calculate $\hat{Y_i}$ first. We start with the formula that $\hat{Y_i}$ = $\hat{\beta_1}$ + $\hat{\beta_2}$ $\times$ $X_0$. Given $X_0$ = 70 and based on the results in part(c), we can obtain $\hat{Y_i}$ roughly equals 10,302.9. Also, by the formula of standard error of $\hat{Y_i}$, which is $\sqrt{ MSE \left( \frac{1}{n} + \frac{(X_i - \bar{X})^2}{S_{XX}} \right) }$,
we can obtain the value roughly equals 1,001.231. At last, we can construct a 90% interval estimate by using $\hat{Y_i}$ $\pm$ $t_{\alpha/2}(n-2)$ $\times$ **SE**($\hat{Y_i}$) to get $[8,624.934, 11,980.87]$. In repeated sampling, about 90 percent interval constructed this way will contain the true value of the parameter.

```r
data_tuna <- read.csv('C:/Users/zxc00/Desktop/tuna.csv')
library(dplyr)
data_tuna_a <- data_tuna%>%mutate(week = 1:52)
data_tuna_b <- data_tuna_a%>%mutate(price1 = 100*apr1)
reg_c <- lm(sal1 ~ price1, data = data_tuna_b)
summary(reg_c)
```

```
## 
## Call:
## lm(formula = sal1 ~ price1, data = data_tuna_b)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10869.5  -1588.3   -499.3   1626.2  18607.1 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 40714.22    6196.42   6.571 2.82e-08 ***
## price1       -434.45      78.58  -5.528 1.17e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 5502 on 50 degrees of freedom
## Multiple R-squared:  0.3794,	Adjusted R-squared:  0.367 
## F-statistic: 30.56 on 1 and 50 DF,  p-value: 1.172e-06
```

```r
sreg_c <- summary(reg_c)
yi_hat <- coef(reg_c)[[1]]+coef(reg_c)[[2]]*70
yi_hat
```

```
## [1] 10302.9
```

```r
alpha_d <- 0.1
tc_d <- qt(1 - alpha_d/2, 50)
sse_d <- sum(resid(reg_c)^2)
#mean of price1 = 78.25
#summary(data_tuna_b$price1)
mse_d <- sse_d/50
sxx_d <- sum((data_tuna_b$price1-78.25)^2)
se_yi_hat_d <- sqrt(mse_d*(1/52+(70-78.25)^2/sxx_d))
upper_bound <- yi_hat + tc_d*se_yi_hat_d 
lower_bound <- yi_hat - tc_d*se_yi_hat_d 
upper_bound
```

```
## [1] 11980.87
```

```r
lower_bound
```

```
## [1] 8624.934
```
