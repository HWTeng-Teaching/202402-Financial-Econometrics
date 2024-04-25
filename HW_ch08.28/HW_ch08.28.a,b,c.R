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
