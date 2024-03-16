## This homework is written by 韓淨貽(312707015)

Question:\
How much does education affect wage rates? The data file cps5_small contains 1200 observations on hourly wage rates, education, and other variables from the 2013 Current Population Survey (CPS).
[Note: cps5 is a larger version with more observations and variables.]

## 2.29 (e)
Question:\
Plot the fitted values $\widehat{W A G E}=\exp \left(b_{1}+b_{2} E D U C\right)$ versus EDUC in a graph. Also include in the graph the fitted linear relationship. Based on the graph, which model seems to fit the data better,
the linear or log-linear model?

Answer:\

![e](https://github.com/hhhellahhh/mmmmm/blob/main/2.29%20e.png)

We can see from the picture above, the log-linear-model seems to fit the data better.

**code**

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


## 2.29 (f)
Question:\
Using the fitted values from the log-linear model, compute $\sum(WAGE - \widehat{W A G E})^2$.Compare this 
value to the sum of squared residuals from the estimated linear relationship. Using this as a basis of comparison, which model fits the data better?

Answer:\
![f](https://github.com/hhhellahhh/mmmmm/blob/main/2.29%20f.png)

So, we can know that the linear model fits the data better, because its SSR is smaller.

**code**

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
