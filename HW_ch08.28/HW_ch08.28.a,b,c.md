#
### This homework is written by  黃馨霈 (312707006)
## ch08.28 (a)
**Question:**\
Regress Y on X2 and X3 and obtain conventional OLS standard errors. Compare the estimeted coefficients to the true values of the regression parameters, $\beta_1=5$, $\beta_2=4$, $\beta_3=0$.  
Do the $t$-values suggest that the coefficients are significantly different from 0 at the 5% level?


**Solution:**
|  | OLS standard error |
|:---:|:---:|
| intercept | 3.2067977 |
| X2 | 0.5719662 |
| X3 | 0.6179807 |

|  | Estimated coefficients | True values |
|:---:|:---:|:---:|
| $b_1$ / $\beta_1$ | 5.086 | 5 |
| $b_2$ / $\beta_2$ | 3.933 | 4 |
| $b_3$ / $\beta_3$ | -0.184 | 0 |

##### Test the coefficients are significantly different from zero on not.
|  | 95% CI of the coefficients |
|:---:|:---:|
| $\beta_1$ | [-1.28 , 11.5] |
| $\beta_2$ | [2.8 , 5.07] |
| $\beta_3$ | [-1.41 , 1.04] |
#### The coefficient of X2 are significantly different from zero at 5%.  

**Code:**
```
mod1 <- lm(Y ~ X2 + X3)
summary(mod1)
coef_estimates <- coef(mod1)
std_errors <- summary(mod1)$coefficients[, "Std. Error"]
cat("Estimated Coefficients:\n")
print(coef_estimates)
cat("\nStandard Errors:\n")
print(std_errors)
true_values <- c(beta1, beta2, beta3)
print("Estimated Coefficients vs True Values:")
print(cbind(coef_estimates, true_values))
alpha <- 0.05
cat("critical value =", tc <- qt(1-0.05/2, mod1$df.residual))	# critical value

# CI of beta1
lowb_beta1 <- coef_estimates[1]-tc*sqrt(diag(vcov(mod1)))[1] # lower bound
upb_beta1 <- coef_estimates[1]+tc*sqrt(diag(vcov(mod1)))[1]  # upper bound
cat("CI of beta1 =", ci_beta1 <- c(lowb_beta1, upb_beta1))

# CI of beta2
lowb_beta2 <- coef_estimates[2]-tc*sqrt(diag(vcov(mod1)))[2] # lower bound
upb_beta2 <- coef_estimates[2]+tc*sqrt(diag(vcov(mod1)))[2]  # upper bound
cat("CI of beta2 =", ci_beta2 <- c(lowb_beta2, upb_beta2))

#CI of beta3
lowb_beta3 <- coef_estimates[3]-tc*sqrt(diag(vcov(mod1)))[3] # lower bound
upb_beta3 <- coef_estimates[3]+tc*sqrt(diag(vcov(mod1)))[3]  # upper bound
cat("CI of beta3 =", ci_beta3 <- c(lowb_beta3, upb_beta3))
```
---
## ch08.28 (b)
**Question:**\
Calculate the least squares residuals $\widehat{e}$ from the OLS estimation in (a) and regress $\widehat{e}^2$ on X2 and X3.  
What evidence, if any, do you find for the presence of heteroskedasticity?  

**Solution:**\
The estimated regression is $\widehat{e}^2$ = -29.386 + 26.966X2 −0.419X3.
The regression $R^2$ = 0.138 so that the BP test statistic $NR^2$ = 13.8  
Set $\alpha$=0.05. Since the $p$-value in the BP test is 0.000203, conclude that heteroskedasticity may exist.

**Code:**
```
# Calculate the least squares residuals
resid <- residuals(mod1)

# Regress squared residuals on X2 and X3
resid_squared <- resid^2
resid_mod1 <- lm(resid_squared ~ X2 + X3)
N <- nobs(resid_mod1)
gresid_mod1 <- glance(resid_mod1)
S <- gresid_mod1$df
Rsqres <- gresid_mod1$r.squared
chisq <- N*Rsqres; chisq
pval <- 1-pchisq(chisq,S-1); pval
```
---
## ch08.28 (c)
**Question:**\
Regress Y on X2 and X3 and obtain robust standard errors. Compare these to the conventional standard errors in (a).

**Solution:**
|  | OLS standard error | Robust standare error |
|:---:|:---:|:---:|
| intercept | 3.2067977 | 3.2172642 |
| X2 | 0.5719662 | 0.6648557 |
| X3 | 0.6179807 | 0.5731666 |

The robust standard errors are larger for constant term and X2 but not for the X3 .

**Code:**
```
kable(tidy(mod1),caption= "Regular standard errors")
vcov(mod1) # Check the cov 

cov1 <- hccm(mod1, type="hc1") #needs package 'car'
cov1 # check cov1
HC1 <- coeftest(mod1, vcov.=cov1)
kable(tidy(HC1),caption = "Robust (HC1) standard errors")
```
