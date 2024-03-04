# Written by Huei-Wen Teg
# Created on 2017/5/26
# Update on 2021/4/20
# Modifications from https://bookdown.org/ccolonescu/RPoE4/intro.html#the-rstudio-screen
#install.packages("devtools")
#install.packages("xtable")
#install.packages("knitr")
#install.packages("tseries")
install.packages("printr")
#install.packages("effects")
install.packages("car") # for hccm
install.packages("AER") # coeftest
install.packages("broom")
#install.packages("stats")
#install.packages("lmtest")
#install.packages("stargazer")
#install.packages("ggplot2")
#install.packages("zoo")
library(stargazer) #nice and informative tables
library(lmtest)
library(stats)
library(devtools)
library(ggplot2)
library(PoEdata) # Makes datasets ready to use
library(xtable)
library(knitr)
library(tseries)
library(printr) # 
library(effects) #
library(car) #
library(AER)#
library(broom)#

rm(list=ls()) # Caution: this clears the Environment


# 8.3 Robust variance estimator
# car::hccm, yields a heteroskedasticity-robust coefficient covariance matrix
# compare the following two results. 
data(food)
head(food)
plot(food$income, food$food_exp)

foodeq <- lm(food_exp~income,data=food)
summary(foodeq)
kable(tidy(foodeq),caption= "Regular standard errors in the 'food' equation")
vcov(foodeq) # Check the cov 

cov1 <- hccm(foodeq, type="hc1") #needs package 'car'
cov1 # check cov1
food.HC1 <- coeftest(foodeq, vcov.=cov1)
kable(tidy(food.HC1),caption = "Robust (HC1) standard errors in the 'food' equation")



# Using robust standard errors when performing a fictitious linear hypothesis test on the basic 'andy' model
# to test H0: beta_2 + beta_3 =0
library(car)
library(lmtest)
data("andy", package="PoEdata")
andy.eq <- lm(sales~price+advert, data=andy)
bp <- bptest(andy.eq) #Heteroskedsticity test
bp
b2 <- coef(andy.eq)[["price"]]
b3 <- coef(andy.eq)[["advert"]]
H0 <- "price+advert=0"
kable(tidy(linearHypothesis(andy.eq, H0,
                            vcov=hccm(andy.eq, type="hc1"))),
      caption="Linear hypothesis with robust standard errors")

kable(tidy(linearHypothesis(andy.eq, H0)), 
      caption="Linear hypothesis with regular standard errors")


# This example demonstrates how to introduce robust standards errors in a linearHypothesis function. 
# It also shows that, when heteroskedasticity is not significant 
# (bptst does not reject the homoskedasticity hypothesis) 
# the robust and regular standard errors (and therefore the  FF  statistics of the tests) are very similar.


# 8.4 Generalized Least Squares
# to multiply the model by 1/sqrt(xi), weight should be wi=1/xi.
# With known form of variances
w <- 1/food$income
foodeq <- lm(food_exp~income, data=food) #OLS
food.wls <- lm(food_exp~income, weights=w, data=food) #GLS
vcvfoodeq <- coeftest(foodeq, vcov.=cov1) # White SE

kable(tidy(foodeq),caption="OLS estimates for the 'food' equation")

kable(tidy(vcvfoodeq),caption="OLS estimates for the 'food' equation with robust standard errors" 

kable(tidy(food.wls), caption="WLS estimates for the 'food' equation")


# 8.5 FGLS
# Grouped data: feasible generalized least squares
data("cps2", package="PoEdata")
rural.lm <- lm(wage~educ+exper, data=cps2, subset=(metro==0))
sigR <- summary(rural.lm)$sigma
metro.lm <- lm(wage~educ+exper, data=cps2, subset=(metro==1))
sigM <- summary(metro.lm)$sigma
cps2$wght <- rep(0, nrow(cps2))
# Create a vector of weights
for (i in 1:1000) 
{
  if (cps2$metro[i]==0){cps2$wght[i] <- 1/sigR^2}
  else{cps2$wght[i] <- 1/sigM^2}
}
wge.fgls <- lm(wage~educ+exper+metro, weights=wght, data=cps2)
wge.lm <- lm(wage~educ+exper+metro, data=cps2)
wge.hce <- coeftest(wge.lm, vcov.=hccm(wge.lm, data=cps2))
stargazer(rural.lm, metro.lm, wge.fgls,wge.hce,
          header=FALSE, 
          title="OLS vs. FGLS estimates for the 'cps2' data",
          type="text", # "html" or "latex" (in index.Rmd) 
          keep.stat="n",  # what statistics to print
          omit.table.layout="n",
          star.cutoffs=NA,
          digits=3, 
          #  single.row=TRUE,
          intercept.bottom=FALSE, #moves the intercept coef to top
          column.labels=c("Rural","Metro","FGLS", "HC1"),
          dep.var.labels.include = FALSE,
          model.numbers = FALSE,
          dep.var.caption="Dependent variable: wage",
          model.names=FALSE,
          star.char=NULL) #supresses the stars



# FGLS
data("food", package="PoEdata")
food.ols <- lm(food_exp~income, data=food)
ehatsq <- resid(food.ols)^2
sighatsq.ols  <- lm(log(ehatsq)~log(income), data=food)
vari <- exp(fitted(sighatsq.ols))
food.fgls <- lm(food_exp~income, weights=1/vari, data=food)
stargazer(food.ols, food.HC1, food.wls, food.fgls,
          header=FALSE, 
          title="Comparing various 'food' models",
          type= "text", # "html" or "latex" (in index.Rmd) 
          keep.stat="n",  # what statistics to print
          omit.table.layout="n",
          star.cutoffs=NA,
          digits=3, 
          #  single.row=TRUE,
          intercept.bottom=FALSE, #moves the intercept coef to top
          column.labels=c("OLS","HC1","WLS","FGLS"),
          dep.var.labels.include = FALSE,
          model.numbers = FALSE,
          dep.var.caption="Dependent variable: 'food expenditure'",
          model.names=FALSE,
          star.char=NULL) #supresses the stars



# 8.6.1. informal test
# A scatter diagram of the food dataset with the regression line to 
# show how the observations tend to be more spread at higher income
data("food",package="PoEdata")
mod1 <- lm(food_exp~income, data=food)
plot(food$income,food$food_exp, type="p",
     xlab="income", ylab="food expenditure")
abline(mod1)

# plot residuals against regressors, or, fitted values. 
res <- residuals(mod1)
yhat <- fitted(mod1)
plot(food$income,res, xlab="income", ylab="residuals")
plot(yhat, res, xlab="fitted values", ylab="residuals")



# 8.6.2 The Goldfeld-Quandt test
# The Goldfeld-Quandt heteroskedasticity test is useful 
# when the regression model to be tested includes an indicator variable among its regressors. 
alpha <- 0.05 #two tail, will take alpha/2
data("cps2", package="PoEdata")
?cps2
#Create the two groups, m (metro) and r (rural)
m <- cps2[which(cps2$metro==1),]
r <- cps2[which(cps2$metro==0),]

wg1 <- lm(wage~educ+exper, data=m)
wg0 <- lm(wage~educ+exper, data=r)
df1 <- wg1$df.residual #Numerator degrees of freedom
df0 <- wg0$df.residual #Denominatot df
sig1squared <- glance(wg1)$sigma^2
sig0squared <- glance(wg0)$sigma^2

hist(resid(wg1)^2)
hist(resid(wg0)^2)


fstat <- sig1squared/sig0squared

Flc <- qf(alpha/2, df1, df0)#Left (lower) critical F
Fuc <- qf(1-alpha/2, df1, df0) #Right (upper) critical F
cat(Flc, Fuc, fstat)
# fstat is 2.08, which is greater than the upper critical value, we reject the null
# hypothesis that the two variances are equal. 
# A one-tailed hypothesis is: H0: sig1^2 < sig0^2.
Fc <- qf(1-alpha, df1, df0) #Right-tail test
Fc
# which still implied a rejection of the null hypothesis. 


# The Goldfeld-Quant test can be used when there is no indicator variable in the model or in the dataset.
# H0: sig_hi^2 <= sig_li^2 vs H1: sig_hi^2 > sig_li^2
alpha <- 0.05
data("food", package="PoEdata")
medianincome <- median(food$income)
li <- food[which(food$income<=medianincome),]
hi <- food[which(food$income>=medianincome),]
eqli <- lm(food_exp~income, data=li)
eqhi <- lm(food_exp~income, data=hi)
dfli <- eqli$df.residual
dfhi <- eqhi$df.residual
sigsqli <- glance(eqli)$sigma^2
sigsqhi <- glance(eqhi)$sigma^2
fstat <- sigsqhi/sigsqli #The larger var in numerator
Fc <- qf(1-alpha, dfhi, dfli)
pval <- 1-pf(fstat, dfhi, dfli)
# fstat = 3.61, which is greater than the critical value Fc = 2.22. pval = 0.0046.
# We reject the null hypothesis. 


# Same as above but using lmtest:gqtest
foodeq <- lm(food_exp~income, data=food)
tst <- gqtest(foodeq, point=0.5, alternative="greater",
              order.by=food$income)
kable(tidy(tst), 
      caption="R function `gqtest()` with the 'food' equation")


# 8.6.3 The Breusch-Pagan test
?food
alpha <- 0.05

mod1 <- lm(food_exp~income, data=food)
ressq <- resid(mod1)^2
#The test equation:
modres <- lm(ressq~income, data=food)
N <- nobs(modres)
N
gmodres <- glance(modres)
S <- gmodres$df #Number of Betas in model
S
Rsqres <- gmodres$r.squared
Rsqres


#chisq <- N*Rsqres
#chisq
#pval <- 1-pchisq(chisq,S-1); pval

# The Breusch-Pagan test with the White version
mod1 <- lm(food_exp~income, data=food)
ressq <- resid(mod1)^2
modres <- lm(ressq~income+I(income^2), data=food)
gmodres <- glance(modres)
Rsq <- gmodres$r.squared
Rsq
S <- gmodres$df #Number of Betas in model
S

chisq <- N*Rsq
chisq
pval <- 1-pchisq(chisq, S-1); pval
 
# pval is 0.023, also reject the null hypothesis of homoskedasticity. 

qchisq(0.95, S-1)

?qchisq

# The function bptest() in package lmtest does 
# (the robust version of) the Breusch-Pagan test in  R. 
# The following code applies this function to the basic food equation, showing the results in Table 8.1, where ¡¥statistic¡¦ is the calculated  £q2 .
mod1 <- lm(food_exp~income, data=food)
kable(tidy(bptest(mod1)), 
      caption="Breusch-Pagan heteroskedasticity test")