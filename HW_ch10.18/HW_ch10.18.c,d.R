# 10.18 (c)

library(POE5Rdata)
library(AER)
data("mroz")

# restricts sample to married women
mroz1 <- mroz[mroz$lfp==1,] 
mroz1$MOTHERCOLL <- ifelse(mroz1$mothereduc > 12, 1, 0)

wage_iv_model <- ivreg(log(wage) ~ educ + exper + I(exper^2) | MOTHERCOLL + exper + I(exper^2), data = mroz1)

educ_95percent_interval <- confint(wage_iv_model, level = 0.95)["educ",]

cat("The 95% interval estimate for the coefficient of EDUC is [",round(educ_95percent_interval,4),"]")

## Answer:
## In the repeated sampling, the 95% interval estimate for the coefficient of EDUC using MOTHERCOLL as the instrumental variable is [-0.0012, 0.1533].

# 10.18 (d)
wage_ols_model <- lm(educ ~ MOTHERCOLL, data = mroz1)

f_test <- summary(wage_ols_model)$fstatistic[1]

cat("F-test statistic for the hypothesis that MOTHERCOLL has no effect on EDUC:", f_test, "\n")

## Answer:
## The F-test statistic for the hypothesis that MOTHERCOLL has no effect on EDUC is 63.21602.
## Since 63.21602 is greater than the rule of the thumb value of 10, we reject the notion that the IV is weak.