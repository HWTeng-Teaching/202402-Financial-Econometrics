---
title: "29 e f"
output: html_document
date: "2024-03-14"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
```{r}
#2.29 e
wage <- cps5_small$wage
educ <- cps5_small$educ
model222 = lm(wage~educ, data=cps5_small)

log_linear <- exp(b1 + b2 * educ)
plot(educ,wage,col="blue")
abline(model222, col ="red", lwd = 2)
curve(exp(b1 + b2 * x), add = TRUE, col = "green", lwd = 2)

legend("topleft", legend = c("Actual Data", "Linear", "log-linear"),
       col = c("blue", "red", "green"), pch = c(1, NA, NA), lwd = c(NA, 1, 2))
```
```{r}
#2.29 f

linear_resdiuals = model222$residuals

fitted_log_linear <- exp(b1 + b2 * educ)

log_linear_residuals = wage - fitted_log_linear

SSR_linear <- sum(linear_resdiuals^2)
SSR_log_linear <- sum(log_linear_residuals^2)

cat("Sum of squared residuals (linear model):", SSR_linear, "\n")
cat("Sum of squared residuals (log-linear model):", SSR_log_linear, "\n")
```



