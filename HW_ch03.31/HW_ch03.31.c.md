## This homework is written by 李昀庭 (312707034)

## Exercise 3.31 (c)

Create the variable $PRICE1 = 100 \times APR1$.

Estimate the linear regression $SAL1 = \beta_1 + \beta_2 \times PRICE1 + e$.

**Question:**

What is the point estimate for the effect of a one cent increase in the price of brand no.1 on the sales of brand no.1 ?

What is a 95% interval estimate for the effect of a one cent increase in the price of brand no.1 on the sales of brand no.1 ?

**Answer:**

The effect of a one cent increase in the price means the margin effect of ***PRICE1***,that is $\frac{∂SAL1}{∂PRICE1} = \beta_2$.

The point estimator for $\beta_2$ is $b_2=-434.4473$.

For 95%C.I.

We need to calculate the standard deviation of $b_2$. SE($b_2$) = $\frac{\hat{\sigma}^2}{\sum(x_i-\bar{x})^2}$ and t-statistic $t_\frac{\alpha}{2}(n-2)$.

The interval is $b_2 \pm SE(b_2) \cdot t_\frac{\alpha}{2}(n-2)=[-592.2897,-276.6049$.

Code :

``` r
#Denote Critial Value  by cv
#Denote Confidence Interval  by CI
load("C:/Users/USER/Desktop/tuna.rdata")
SAL1 <- tuna$sal1
APR1 <- tuna$apr1
PRICE1 <- 100*APR1
linear_model <- lm(SAL1~PRICE1)
sum_linear <- summary(linear_model)
b1 <- coef(sum_linear)[1]
b2 <- coef(sum_linear)[2]
se_b2 <-coef(sum_linear)[4]
df <- sum_linear$df[2]
cv <- qt(0.975,df)
CI_LowerBound <- b2-cv*se_b2
CI_UpperBound <- b2+cv*se_b2
```

From R.studio ,we get $b_2=-434.4473$, SE($b_2$)=78.5848, $t_\frac{0.05}{2}(52-2)$=2.009

So,

Point estimator : -434.4473

95%C.I. : [-592.2897,-276.6049]


**[Reviewed by Yenting 20240327.]** 
