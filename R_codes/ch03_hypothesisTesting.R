install.packages('xtable')
install.packages('knitr')

library(xtable)
library(PoEdata)
library(knitr)

# 3.3
## Let us calculate a 95% confidence interval for the coefficient on  incomeincome  in the food expenditure model. library(PoEdata)
data("food")
?food
food
plot(food$income, food$food_exp)

alpha <- 0.05 # chosen significance level
mod1 <- lm(food_exp~income, data=food)
b2 <- coef(mod1)[[2]]
df <- df.residual(mod1) # degrees of freedom
smod1 <- summary(mod1)
seb2 <- coef(smod1)[2,2] # se(b2)
tc <- qt(1-alpha/2, df)	# critical value
lowb <- b2-tc*seb2  # lower bound
upb <- b2+tc*seb2   # upper bound
lowb; upb;
ci <- confint(mod1)
print(ci)

# CI with a different alpha level
ci <- confint(mod1, level=0.99)
print(ci)

##                2.5 %   97.5 %
## (Intercept) -4.46328 171.2953
## income       5.97205  14.4472
lowb_b2 <- ci[2, 1] # lower bound
upb_b2 <- ci[2, 2]  # upper bound.

# 3.4 confidence intervals in repeated samples
# I rewrite by myself to implement Monte Carlo simulation to investigate what it means by repeated samples. 
alpha = 0.05;
beta1 = 10;
beta2 = 5;
sig2 = 100;
N = 30;
n = 1000;  # Number of Monte Carlo scenarios
x = runif(N, 0, 10);

# Initiate two vectors that will store the results:
lowb1 <- numeric(n) # 'repeat 0 ten times'
upb1 <- numeric(n)  # (alternatively, 'numeric(10)')


# Each loop generates random data y = beta1+beta2 * x + e
for(idx in 1: n)
{
  y = beta1 + beta2 * x + rnorm(N, 0, sqrt(sig2));
  mod1 = lm(y~ x);
  smod1 <- summary(mod1);
  df  = df.residual(mod1);
  tc = qt(1-alpha/2,df);
  b1 <- coef(mod1)[[1]]
  b2 <- coef(mod1)[[2]]
  seb1 <- coef(smod1)[1,2]
  seb2 <- coef(smod1)[2,2]
  lowb1[idx] <- b1-tc*seb1
  upb1[idx] <- b1+tc*seb1
ifCover = (beta1>lowb1[idx]) * (upb1[idx]>beta1)

if(ifCover){
	cat("true beta1: ", beta1, ", CI: [", lowb1[idx], upb1[idx], "],  \n")
}else{cat("true beta1: ", beta1, "CI: [", lowb1[idx], upb1[idx], "], this CI does not cover beta1 \n")}

}


frequencyBeta1 = mean((beta1>lowb1) * (upb1>beta1))
cat("About", frequencyBeta1* 100, "% CIs contains beta1");




table <- data.frame(lowb1, upb1, lowb2, upb2)
kable(table, caption="Confidence intervals for $b_{1}$ and $b_{2}$", 
      align="c")

# Check the proportion that beta_k falls into its confidence intervals
 frequencyBeta1 = mean((beta1>lowb1) * (upb1>beta1))
 frequencyBeta2 = mean((beta2>lowb2) * (upb2>beta2))
 cat("About", frequencyBeta1* 100, "%CIs contains beta1");
 cat("About", frequencyBeta2* 100, "%CIs contains beta2");

 
# 3.5 

alpha <- 0.05
library(PoEdata); library(xtable); library(knitr)
data("food")
mod1 <- lm(food_exp~income, data=food) 
smod1 <- summary(mod1)
table <- data.frame(xtable(mod1))
kable(table, 
  caption="Regression output showing the coefficients")
#b2 <- coef(mod1)[["income"]] #coefficient on income
# or:
b2 <- coef(mod1)[[2]] # the coefficient on income
seb2 <- sqrt(vcov(mod1)[2,2]) #standard error of b2
df <- df.residual(mod1) # degrees of freedom      
t <- b2/seb2
tcr <- qt(1-alpha/2, df)
pt <-2*pt(1-abs(t),df)
t
tcr
pt


# Plot the density function and the values of t:
curve(dt(x, df), -2.5*seb2, 2.5*seb2, ylab=" ", xlab="t")
abline(v=c(-tcr, tcr, t), col=c("red", "red", "blue"), 
       lty=c(2,2,3))
legend("topleft", legend=c("-tcr", "tcr", "t"), col=
         c("red", "red", "blue"), lty=c(2, 2, 3))

c <- 5.5
alpha <- 0.05
t <- (b2-c)/seb2
tcr <- qt(1-alpha, df) # note: alpha is not divided by 2
curve(dt(x, df), -2.5*seb2, 2.5*seb2, ylab=" ", xlab="t")
abline(v=c(tcr, t), col=c("red", "blue"), lty=c(2, 3))
legend("topleft", legend=c("tcr", "t"), 
       col=c("red", "blue"), lty=c(2, 3))

c <- 15
alpha <- 0.05
t <- (b2-c)/seb2 
tcr <- qt(alpha, df) # note: alpha is not divided by 2
curve(dt(x, df), -2.5*seb2, 2.5*seb2, ylab=" ", xlab="t")
abline(v=c(tcr, t), col=c("red", "blue"), lty=c(2, 3))
legend("topleft", legend=c("tcr", "t"), 
       col=c("red", "blue"), lty=c(2, 3))

library(PoEdata)
data("food")
mod1 <- lm(food_exp ~ income, data = food)
table <- data.frame(round(xtable(summary(mod1)), 3))
kable(table, caption = "Regression output for the 'food' model")


# 3.6
# Calculating the p-value for a right-tail test
c <- 5.5
t <- (b2-c)/seb2
p <- 1-pt(t, df) # pt() returns p-values;

#
# Calculating the p-value for a left-tail test
c <- 15
t <- (b2-c)/seb2
p <- pt(t, df) 

# Calculating the p-value for a two-tail test
c <- 0
t <- (b2-c)/seb2
p <- 2*(1-pt(abs(t), df)) 

curve(dt(x, df), from=-2.5*seb2, to=2.5*seb2)
abline(v=c(-t, t), col=c("blue", "blue"), lty=c(2, 2))
legend("topright", legend=c("-t", "t"), 
       col=c("blue", "blue"), lty=c(2, 4))

table <- data.frame(xtable(smod1))
knitr::kable(table, caption=
   "Regression output showing p-values")

# 3.7

library(PoEdata)
data("food")

names(food)

plot(food$income, food$food_exp)
abline(b1, b2)



alpha <- 0.05
df <- df.residual(m1)
df
x <- 20 # income is in 100s, remember?

m1 <- lm(food_exp~income, data=food)
m1

m2 <- lm(food_exp~1+income, data=food)
m2


tcr <- qt(1-alpha/2, df) # rejection region right of tcr.

vcov(m1)

b1 <- m1$coef[1]
b2 <- m1$coef[2]

varb1 <- vcov(m1)[1, 1]
varb2 <- vcov(m1)[2, 2]
covb1b2 <- vcov(m1)[1, 2]

L <- b1+b2*x  # estimated L
L

varL = varb1 + x^2 * varb2 + 2*x*covb1b2 # var(L)
seL <- sqrt(varL) # standard error of L
lowbL <- L-tcr*seL
upbL <- L+tcr*seL
c(lowbL, upbL)


# 
c <- 250 
alpha <- 0.05
t <- (L-c)/seL  # t < tcr --> Reject Ho.
tcr <- qt(1-alpha/2, df)

# Or, we can calculate the p-value, as follows:
p_value <- 2*(1-pt(abs(t), df)) #p<alpha -> Reject Ho

