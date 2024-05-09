---
title: "10.18 e.f.g"
output: html_document
date: "2024-05-09"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
```{r}
#10.18 e

mroz.iv2 <- ivreg(log(wage) ~ educ + exper + I(exper^2) | MOTHERCOLL + FATHERCOLL + exper + I(exper^2), data
                   = mroz)
# 95% interval estimate for the coefficient of educ
conf_int_e <- confint(mroz.iv2, level = 0.95)["educ",]
print(conf_int_e)

#10.18 f

mroz.lm2 <- lm(educ ~ MOTHERCOLL + FATHERCOLL, data = mroz)
f_test_f <- summary(mroz.lm2)$fstatistic[1]
cat("F-test statistic for the joint significance of MOTHERCOLL and FATHERCOLL:", f_test_f, "\n")

#10.18 g

summary_mroz_iv3 <- summary(mroz.iv2, diagnostics=TRUE)
g_test <- summary_mroz_iv3$diagnostics["Sargan", "statistic"]
cat("Sargan-Hansen statistic for the validity of the surplus instrument:", g_test, "\n")
```

