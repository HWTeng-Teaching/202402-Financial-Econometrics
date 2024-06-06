# This homework is written by 張家榮 (312707049)

## ch15.17(b)
### **Question:**
Estimate the model $LIQUOR_it$ = b1 + b2 $INCOME_it$ + $u_i$ + $e_it$ using random effects. 
Construct a 95% interval estimate of the coefficient on $INCOME$.
How does it compare to the interval in part(a)?

### **answer:**
The 95% interval eatimate for the coefficient of $INCOME$ is [0.01283 , 0.04032].
We estimate with 95% confidence that for each additional 1000 dollar income the household will spend between 12.83 and 40.32 dollar more on liquor. 
The random effects coefficient estimate is slightly smaller than the difference estimator coefficient, but the standrad error of the random effects
estimator is about 25% of the standard error of the difference estimator's standard error, yeilding a statistical significance.

![1717681821447](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161788384/1e4c1c27-6ae3-46d0-818b-b463c50ac8eb)

![1717681752524](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161788384/40755de8-b46f-4047-afc2-9fdc165bb5a1)


```{r setup, include=FALSE}
library(devtools)
library(POE5Rdata)
library(plm)
library(lmtest)
data = (liquor5)

data_p <- pdata.frame(data, index = c("hh", "year"))

model_re <- plm(liquor ~ income, data = data_p, model = "random")

summary(model_re)

conf_interval_re <- confint(model_re, level = 0.95)

conf_interval_re
```
