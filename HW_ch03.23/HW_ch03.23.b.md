### This homework is written by 鄭宇翔 (312707029)
Question:
#### 3.23 The file collegetown.dat contains data on 500 single-family houses sold in Baton Rouge, Louisiana, during 2009-2013. The data include sale price in $1000 units, PRICE, and total interior area in hundreds of square feet, SQFT. 
#### b. Using the quadratic regression model in part (a), test the hypothesis that the marginal effect on expected house price of increasing the size of a 4000 square foot house by 100 square feet is less than or equal to $13,000 against the alternative that the marginal effect will be greater than $13,000. 
#### Use the 5% level of significance. Clearly state the test statistic used, the rejection region, and the test p-value. What do you conclude?

```{r}
price <- collegetown$price
sqft <- collegetown$sqft
qrmodel <- lm(price~I(sqft^2))
qrmodel_A1 <- coef(qrmodel)[1]
qrmodel_A2 <- coef(qrmodel)[2]
qrsummary <- summary(qrmodel)
qrmodel_A2_se <- qrsummary$coef[4]
df <- qrsummary$df[2]
```
<img width="426" alt="截圖 2024-03-20 晚上8 01 38" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/67742647/901a74e2-5b1e-4060-a8bb-1ff8f12dea33">\
The estimated model is  $\hat{PRICE}=93.56585+0.18452\ {SQFT}^2$.\
The degree of freedom is $df=498$.

```{r}
# test the marginal effect
sqft_2 <- 40
marginal_effect_2 <- 2*qrmodel_A2*sqft_2
se <- (qrmodel_A2_se*2*sqft_2)
t_statistic_2 <- (marginal_effect_2 - 13)/se
critical_2 <- qt(0.95, df)
pvalue_2 <- 1-pt(t_statistic_2,df)
```
<img width="135" alt="截圖 2024-03-20 晚上8 16 08" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/67742647/cd4de94a-0f73-4d98-a223-0466bf6cf4b5">\
The degree of freedom is $df=498$.\
We can get the function of marginal effect by differentiating the model.\
Marginal effect is $\frac{d\ PRICE}{d\ SQFT}=2SQFT\hat{\alpha_2}=2(40)\hat{\alpha_2}=14.762$.\
We want to test the hypothesis:$H_0:2SQFT\hat{\alpha_2}\leq13 \ v.s.\ H_a:2SQFT\hat{\alpha_2}>13$.\
The standard error is $\sqrt{\hat{var}(2SQFT\hat{\alpha_2})}=2SQFTse(\alpha_2)=0.4205$.\
The test statistic is $t=\frac{2SQFT\hat{\alpha_2}-13}{2SQFTse(\alpha_2)}=\frac{2(40)(0.18452)}{2(0.18452)0.0053}=4.189\sim t_{(498)}$.\
RR is { $t>1.645$ }, and the p-value is $0.00001654$.\
which means the test statistic $t$ falls in rejection region. \
We do have evdience that the marginal effect is not less or equal to $13000.
