## This homework is written by 韓淨貽(312707015)

Question:\
Consider the data file mroz on working wives. Use the 428 observations on married women who participate in the labor force. In this exercise, we examine the effectiveness of a parent’s college education as an instrumental variable.

## 10.18 (e)

Question:\
Estimate the wage equation in Example 10.5 using MOTHERCOLL and FATHERCOLL as the instrumental variables. What is the 95% interval estimate for the coefficient of EDUC? Is it nar- rower or wider than the one in part (c)?

Answer:\
The wage equation in Example 10.5 is $\ln(\text{WAGE}) = \beta_1 + \beta_2 \text{EXPER} + \beta_3 \text{EXPER}^2 + \beta_4 \text{EDUC} + \epsilon$\
In the repeated sampling, the 95% interval estimate for the coefficient of EDUC using MOTHERCOLL and FATHERCOLL as the instrumental variables is [0.02752 0.1482].\
So we can konw that the 95% interval is slightly narrower than the one in part(c).

**code**

```
mroz.iv2 <- ivreg(log(wage) ~ educ + exper + I(exper^2) | MOTHERCOLL + FATHERCOLL + exper + I(exper^2), data
                   = mroz)
conf_int_e <- confint(mroz.iv2, level = 0.95)["educ",]
print(conf_int_e)

```

## 10.18 (f)

Question:\
For the problem in part (e), estimate the first-stage equation. Test the joint significance of MOTHERCOLL and FATHERCOLL. Do these instruments seem adequately strong?

Answer:\
The first-stage equation is:\
$x = \gamma_1 + \theta_1 z_1 + \theta_2 z_2 + v$\
which is $\text{EDUC} = \gamma_1 + \theta_1 \text{MOTHERCOLL} + \theta_2\text{FATHERCOLL} + v$\
So we get that：\
$\widehat{x} = \widehat{\gamma_1} + \widehat{\theta_1}z_1 + \widehat{\theta_2}z_2$\
which is $\widehat{\text{EDUC}} = \widehat{\gamma_1} + \widehat{\theta_1} \text{MOTHERCOLL} + \widehat{\theta_2} \text{FATHERCOLL}$\
\
The F-test statistic of the joint significance of the two IV is 57.59666 , is far greater than the rule of thumb value of 10 for a weak IV.\
Thus we reject the null hypothesis that the instruments are weak.

**code**

```
mroz.lm2 <- lm(educ ~ MOTHERCOLL + FATHERCOLL, data = mroz)
f_test_f <- summary(mroz.lm2)$fstatistic[1]
cat("F-test statistic for the joint significance of MOTHERCOLL and FATHERCOLL:", f_test_f, "\n")

```

## 10.18 (g)

Question:\
For the IV estimation in part (e), test the validity of the surplus instrument. What do you conclude?

Answer:\
When we have surplus instrument, we can use sargan test to estimate that the instrument is vaild or not.\
So we can have a hypothesis that the surplus instrument is vaild from useing $\{NR}^2$\

**code**

```
summary_mroz_iv3 <- summary(mroz.iv2, diagnostics=TRUE)
g_test <- summary_mroz_iv3$diagnostics["Sargan", "statistic"]
cat("Sargan-Hansen statistic for the validity of the surplus instrument:", g_test, "\n")

```
