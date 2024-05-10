## This homework is written by 許雯娟(312707014)

Question:\
Consider the data file mroz on working wives. Use the 428 observations on married women who participate in the labor force. In this exercise, we examine the effectiveness of a parent’s college education as an instrumental variable.

## 10.18 (c)

Question:\
Estimate the wage equation in Example 10.5 using MOTHERCOLL as the instrumental variable.\
What is the 95% interval estimate for the coefficient of EDUC?

Answer:\
The wage equation in Example 10.5 is $\ln(\text{WAGE}) = \beta_1 + \beta_2 \text{EXPER} + \beta_3 \text{EXPER}^2 + \beta_4 \text{EDUC} + \epsilon$\
First, we take MOTHERCOLL to substitute EDUC, and get first-stage equation is $\text{EDUC} = \gamma_1 + \theta_1 \text{MOTHERCOLL} + v$\
Next, we take first-stage equation into orginal model to get second-stage equation is $\ln(\text{WAGE}) = \beta_1 + \beta_2 \text{EXPER} + \beta_3 \text{EXPER}^2 + \beta_4 \text{MOTHERCOLL} + \epsilon^*$\.
The 95% interval estimate of $\beta_4$[ is -0.0012, 0.1533]. Interpretatinos: In repeated sampling, about 95% interval estimate for the coefficient of EDUC using MOTHERCOLL as the instrumental variable constructed this way will contain the true value of the the parameter $\beta_4$ is.

**code**

```
library(POE5Rdata)
library(AER)
data("mroz")

# restricts sample to married women
mroz1 <- mroz[mroz$lfp==1,] 
mroz1$MOTHERCOLL <- ifelse(mroz1$mothereduc > 12, 1, 0)

wage_iv_model <- ivreg(log(wage) ~ educ + exper + I(exper^2) | MOTHERCOLL + exper + I(exper^2), data = mroz1)

educ_95percent_interval <- confint(wage_iv_model, level = 0.95)["educ",]

cat("The 95% interval estimate for the coefficient of EDUC is [",round(educ_95percent_interval,4),"]")

```


## 10.18 (d)

Question:\
For the problem in part(c), estimate the first-stage equation. What is the value of the F-test statistic for the hypothesis that MOTHERCOLL has no effect on EDUC? Is MOTHERCOLL a strong instrument?

Answer:\
The first-stage equation is:\
$x = \gamma_1 + \theta_1 z + v$\
which is $\text{EDUC} = \gamma_1 + \theta_1 \text{MOTHERCOLL} + v$\
Estimate the first-stage equation by OLS and obtain the fitted value:\
$\widehat{x} = \widehat{\gamma_1} + \widehat{\theta_1}z$\
which is $\widehat{\text{EDUC}} = \widehat{\gamma_1} + \widehat{\theta_1} \text{MOTHERCOLL}$\
The F-test statistic for the hypothesis that MOTHERCOLL has no effect on EDUC is 63.21602.\
Since 63.21602 is greater than the rule of the thumb value of 10, we reject the null hypothesis that the IV which is MOTHERCOLL is weak.

**code**

```
wage_ols_model <- lm(educ ~ MOTHERCOLL, data = mroz1)

f_test <- summary(wage_ols_model)$fstatistic[1]

cat("F-test statistic for the hypothesis that MOTHERCOLL has no effect on EDUC:", f_test, "\n")

```
