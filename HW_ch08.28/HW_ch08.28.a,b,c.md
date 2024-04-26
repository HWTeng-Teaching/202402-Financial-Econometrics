### This homework is written by  黃馨霈 (312707006)

[20240426 Teng: Please add scatter plot and residuals plots.]

## ch08.28 (a)
Create simulated data with $N$ = 100.  
1. Create $X2 = 1 + 5 \times U1$, where $U1$ is a random number between zero and one.
2. Create $X3 = 1 + 5 \times U2$, where $U2$ is another random number between zero and one.
3. Create $E = \sqrt{exp(2 + 0.6X2)} \times Z$, where $Z \sim N(0, 1)$.
4. Create $Y = 5 + 4X2 + E$

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
$H_0 : b = \beta$ and the critical value = 1.984723  
For $\beta_1$ : $t$-value = -0.6125954  
For $\beta_2$ : $t$-value = -0.2087128  
For $\beta_3$ : $t$-value = 1.17923  
The result shows that $\beta_1$ is not significantly different from 5 at the 5% significance level, $\beta_2$ is not significantly different from 4 at the 5% significance level, and $\beta_3$ is not significantly different from 0 at the 5% significance level

![messageImage_1714097335940](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145751254/befcea04-2626-42f0-9789-e3f2ad9cd154)

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

b1<-coef(OLS)[[1]]
b2<-coef(OLS)[[2]]
b3<-coef(OLS)[[3]]

seb1<-sqrt(vcov(OLS)[1,1])
seb2<-sqrt(vcov(OLS)[2,2])
seb3<-sqrt(vcov(OLS)[3,3])

test1<-(b1-5)/seb1
test2<-(b2-4)/seb2
test3<-b3/seb3

cat("T value1:",test1,"T value2:",test2,"T value3:",test3)
```
---
## ch08.28 (b)
**Question:**\
Calculate the least squares residuals $\widehat{e}$ from the OLS estimation in (a) and regress $\widehat{e}^2$ on X2 and X3.  
What evidence, if any, do you find for the presence of heteroskedasticity?  

**Solution:**\
The estimated regression is $\widehat{e}^2$ = -29.386 + 26.966X2 −0.419X3.
The regression $R^2$ = 0.138 so that the BP test statistic $NR^2$ = 13.8  
Set $\alpha$=0.05, we set $H_0$ : Homoskedasticity v.s. $H_1$ : Hetroskedasticity  
Since the $p$-value in the BP test is 0.000203, conclude that heteroskedasticity may exist.

![messageImage_1714096377121](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145751254/7ac89295-f2df-4b07-ba94-0caf0cbf5d88)
![messageImage_1714096397099](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145751254/8a0dc888-bced-41ca-9e70-a84951c07de8)


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
|  | OLS standard error | Robust standard error |
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
