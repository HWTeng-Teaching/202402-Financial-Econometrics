This homework is written by 趙悅豪（312707051）
## ch15.17(d)
**Question:**
For each individual, compute the time averages for the variable INCOME. Call this variable *INCOMEM*. 
Estimate the model *LIQUOR~it~* = β~1~ + β~2~*INCOME~it~* + γ*INCOMEM~i~* + c~i~ + e~it~ using the random effects estimator. Test the significance of the coefficient γ at the 5% level. 
Based on this test, what can we conclude about the correlation between the random effect u~i~ and *INCOME*? Is it OK to use the random effects estimator for the model in (b)?

**Ans:**
1. Calculate the average income.
```r
data(liquor5)

uhh = unique(liquor5$hh)
for (hh in uhh) {
  hh_data = liquor5[liquor5$hh == hh, ]
  mean_income = mean(hh_data$income)
  liquor5$incomem[liquor5$hh == hh] = mean_income
}
```
2. Const the regression model. Use the random effects estimator.
```r
pd=pdata.frame(liquor5, index = c("hh", "year"))
mod=plm(liquor ~ income+incomem, data = pd, model = "random")
summary(mod)

summary(mod)$coefficients["incomem",]
```
![QQ图片20240607014200](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/101499792/67033917-e860-4305-abd0-0c4b3739210d)


The p-value of gamma is much bigger than 0.05, so it's not significant. And we don't have enough evidence that there is a correlation between the random effects variable u~i~ and *INCOME*. Which means the assumptions of the random effects model are reasonable. It's OK to use the random effects estimator for the model in (b).

**Code:**
```r
library(devtools)
library(POE5Rdata)
library(plm)

data(liquor5)
uhh = unique(liquor5$hh)
for (hh in uhh) {
  hh_data = liquor5[liquor5$hh == hh, ]
  mean_income = mean(hh_data$income)
  liquor5$incomem[liquor5$hh == hh] = mean_income
}

pd=pdata.frame(liquor5, index = c("hh", "year"))
mod=plm(liquor ~ income+incomem, data = pd, model = "random")
summary(mod)
summary(mod)$coefficients["incomem",]
