# This homework is written by 黃馨霈

# ch8.28 (a)
set.seed(123)
U1 <- runif(100, 0, 1)
U2 <- runif(100, 0, 1)
X2 <- 1 + 5 * U1
X3 <- 1 + 5 * U2
Z <- rnorm(100, mean = 0, sd = 1)
E <- sqrt(exp(2 + 0.6 * X2)) * Z
Y <- 5 + 4 * X2 + E

beta1 <- 5
beta2 <- 4
beta3 <- 0

mod1 <- lm(Y ~ X2 + X3)
summary(mod1)
# Compare the estimated coefficients to the true values
coef_estimates <- coef(mod1)
true_values <- c(beta1, beta2, beta3)
print("Estimated Coefficients vs True Values:")
print(cbind(coef_estimates, true_values))

# Check if coefficients are significantly different from 0 at 5% level
alpha <- 0.05
cat("critical value =", tc <- qt(1-0.05/2, mod1$df.residual))	# critical value

# CI of beta1
lowb_beta1 <- coef_estimates[1]-5-tc*sqrt(diag(vcov(mod1)))[1] # lower bound
upb_beta1 <- coef_estimates[1]-5+tc*sqrt(diag(vcov(mod1)))[1]  # upper bound
cat("CI of beta1 =", ci_beta1 <- c(lowb_beta1, upb_beta1))

# CI of beta2
lowb_beta2 <- coef_estimates[2]-4-tc*sqrt(diag(vcov(mod1)))[2] # lower bound
upb_beta2 <- coef_estimates[2]-4+tc*sqrt(diag(vcov(mod1)))[2]  # upper bound
cat("CI of beta2 =", ci_beta2 <- c(lowb_beta2, upb_beta2))

#CI of beta3
lowb_beta3 <- coef_estimates[3]-tc*sqrt(diag(vcov(mod1)))[3] # lower bound
upb_beta3 <- coef_estimates[3]+tc*sqrt(diag(vcov(mod1)))[3]  # upper bound
cat("CI of beta3 =", ci_beta3 <- c(lowb_beta3, upb_beta3))

# ch8.28 (b)
resid <- residuals(mod1)
resid_squared <- resid^2
resid_mod1 <- lm(resid_squared ~ X2 + X3)
summary(resid_mod1)
N <- nobs(resid_mod1)
gresid_mod1 <- glance(resid_mod1)
S <- gresid_mod1$df
Rsqres <- gresid_mod1$r.squared
chisq <- N*Rsqres; chisq
pval <- 1-pchisq(chisq,S-1); pval

# ch8.28 (c)
kable(tidy(mod1),caption= "Regular standard errors")
vcov(mod1) # Check the cov 

cov1 <- hccm(mod1, type="hc1") #needs package 'car'
cov1 # check cov1
HC1 <- coeftest(mod1, vcov.=cov1)
kable(tidy(HC1),caption = "Robust (HC1) standard errors")
