# Written by Huei-Wen Teg
# latest update 2017/4/14
# Basically from the follwoing link
# https://bookdown.org/ccolonescu/RPoE4/intro.html#the-rstudio-screen

# Before the class starts, 
# let us install required packages... 

install.packages("devtools")
install.packages("xtable")
install.packages("knitr")
install.packages("tseries")
install.packages("printr")
install.packages("effects")
install.packages("car")
install.packages("AER")
install.packages("broom")
install.packages("stats")
install.packages("lmtest")
library(lmtest)

library(stats)


library(devtools)

install_git("https://github.com/ccolonescu/PoEdata")
library(PoEdata) # Makes datasets ready to use

library(xtable)
library(PoEdata)
library(knitr)
library(tseries)
library(printr) # 
library(effects) #
library(car) #
library(AER)#
library(broom)#
rm(list=ls()) # Caution: this clears the Environment


# 1. 
alpha <- 0.05
data("andy", package="PoEdata")
N <- NROW(andy) #Number of observations in dataset
K <- 4 #Four Betas in the unrestricted model
J <- 2 #Because Ho has two restrictions
fcr <- qf(1-alpha, J, N-K)
mod1 <- lm(sales~price+advert+I(advert^2), data=andy)
anov <- anova(mod1)
anov # prints 'anova' table for the unrestricted model
SSEu <- anov[4, 2]
mod2 <- lm(sales~price, data=andy) # restricted
anov <- anova(mod2)
anov # prints the 'anova' table for the restrictred model
SSEr <- anov[2,2]
fval <- ((SSEr-SSEu)/J) / (SSEu/(N-K))
pval <- 1-pf(fval, J, N-K)
pval

Hnull <- c("advert=0", "I(advert^2)=0")
linearHypothesis(mod1,Hnull)


## test of overall 

library(broom)
summary(mod1);
smod1 <- summary(mod1)
kable(tidy(smod1), caption="Tidy 'summary(mod1)' output")
fval <- smod1$fstatistic
fval
glance(mod1)$statistic #Retrieves the F-statistic
names(glance(mod1)) #Shows what is available in 'glance'
kable(glance(mod1), 
 caption="Function 'glance(mod1)' output", digits=2, 
 col.names=(c("Rsq","AdjRsq","sig","F",
 "pF","K","logL","AIC","BIC","dev","df.res")))




# just test 
hyp <- c("advert+3.8*I(advert^2)=1")
lhout <- tidy(linearHypothesis(mod1,hyp))
kable(lhout,
 caption="Joint hypotheses with the 'linearHypothesis' function")

## test two hypothesis

hyp <- c("advert+3.8*I(advert^2)=1", 
"(Intercept)+6*price+1.9*advert+3.61*I(advert^2)=80")
lhout <- tidy(linearHypothesis(mod1,hyp))
kable(lhout,
 caption="Joint hypotheses with the 'linearHypothesis' function")


## 
data(edu_inc)

mod1 <- lm(faminc~he, data=edu_inc)
mod2 <- lm(faminc~he+we, data=edu_inc)
mod3 <- lm(faminc~he+we+kl6, data=edu_inc)
mod4 <- lm(faminc~he+we+kl6+xtra_x5+xtra_x6, data=edu_inc)
r1 <- as.numeric(glance(mod1))
r2 <- as.numeric(glance(mod2))
r3 <- as.numeric(glance(mod3))
r4 <- as.numeric(glance(mod4))
tab <- data.frame(rbind(r1, r2, r3, r4))[,c(1,2,8,9)]
row.names(tab) <- c("he","he, we","he, we, kl6",
                    "he, we, kl6, xtra_x5, xtra_x6")
kable(tab, 
 caption="Model comparison, 'faminc' ", digits=4, 
 col.names=c("Rsq","AdjRsq","AIC","BIC"))


library(stats)
smod1 <- summary(mod1)
Rsq <- smod1$r.squared
AdjRsq <- smod1$adj.r.squared
aic <- AIC(mod1)
bic <- BIC(mod1)
c(Rsq, AdjRsq, aic, bic)


# Omitted variables


data("edu_inc", package="PoEdata")
mod1 <- lm(faminc~he+we, data=edu_inc)
mod2 <- lm(faminc~he, data=edu_inc)
kable(tidy(mod1), caption="The correct model")
kable(tidy(mod2), 
      caption="The incorrect model ('we' omitted)")

# Irrelevant variables

mod3 <- lm(faminc~he+we+kl6, data=edu_inc)
mod4 <- lm(faminc~he+we+kl6+xtra_x5+xtra_x6, data=edu_inc)
kable(tidy(mod3), caption="Correct 'faminc' model")

kable(tidy(mod4), 
      caption="Incorrect 'faminc' with irrelevant variables")

# RESET test
install.packages("lmtest")
library(lmtest)
mod3 <- lm(faminc~he+we+kl6, data=edu_inc)
resettest(mod3, power=2, type="fitted")
resettest(mod3, power=2:3, type="fitted")





# 6.4 Collinearity 
install.packages("car")
libra
data("cars", package="PoEdata")
mod1 <- lm(mpg~cyl, data=cars)
kable(tidy(mod1), caption="A simple linear 'mpg' model")

mod2 <- lm(mpg~cyl+eng+wgt, data=cars)
kable(tidy(mod2), caption="Multivariate 'mpg' model")
tab <- tidy(vif(mod2))
kable(tab, 
      caption="Variance inflation factors for the 'mpg' regression model",
      col.names=c("regressor","VIF"))


## 6.5 Prediction
data(andy)
predpoint <- data.frame(price=6, advert=1.9)
mod3 <- lm(sales~price+advert+I(advert^2), data=andy)
kable(tidy(predict(mod3, newdata=predpoint,
                   interval="prediction")), 
      caption="Forecasting in the quadratic 'andy' model")