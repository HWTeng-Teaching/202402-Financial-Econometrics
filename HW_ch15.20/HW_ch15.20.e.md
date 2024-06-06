## Ch15.20 (f)

This homework is written by 許誌榮 (312707055)

**Question**\
Using the t-test statistic in equation (15.36) and a 5% significance level, test whether there are any
significant differences between the fixed effects and random effects estimates of the coefficients
on SMALL, AIDE, TCHEXPER, WHITE_ASIAN, and FREELUNCH. What are the implications
of the test outcomes? What happens if we apply the test to the fixed and random effects estimates of
the coefficient on BOY?
\
**Answer**
``` r
panel_data = pdata.frame(data, index = c("schid", "id"))
fe_model <- plm(readscore ~ small + aide + tchexper + boy + white_asian + freelunch, 
                data = panel_data, model = "within")
summary(fe_model)
re_model <- plm(readscore ~ small + aide + tchexper + boy + white_asian + freelunch, 
                data = panel_data, model = "random")
summary(re_model)
hausman_test <- phtest(fe_model, re_model)
print(hausman_test)
# Extract coefficients and standard errors
fe_coef <- summary(fe_model)$coefficients
re_coef <- summary(re_model)$coefficients

# Function to calculate t-statistic for each coefficient
t_test_coef <- function(fe_coef, re_coef) {
  t_values <- (fe_coef[, "Estimate"] - re_coef[, "Estimate"]) / 
    sqrt(fe_coef[, "Std. Error"]^2 + re_coef[, "Std. Error"]^2)
  p_values <- 2 * pt(-abs(t_values), df = nrow(panel_data) - length(fe_coef))
  return(data.frame(t_values, p_values))
}

# Apply the t-test function
coef_test_results <- t_test_coef(fe_coef, re_coef)
print(coef_test_results)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145032062/8676e6e7-7a4e-41b1-be81-59fd92378ecc)
The results of the Hausman test indicate that the null hypothesis is rejected at the 5% significance level, suggesting that there is a difference between the fixed effects and random effects, and the fixed effects model should be used.
