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


library(devtools)

#install_github("ccolonescu/PoEdata")  # Fixed by TA

library(PoEdata) # Makes datasets ready to use

library(xtable)
library(PoEdata)
library(knitr)
library(tseries)
library(xtable)
library(printr) # 
library(effects) #
library(car) #
library(AER)#
library(broom)#



rm(list=ls()) # Caution: this clears the Environment


## 5.2

# Summary statistics

data(andy)

?andy
plot(andy$price, andy$sales)
plot(andy$advert, andy$sales)


tidy(andy)			# summary statitsics for the data. need 'broom' package
tidy(andy)
s=tidy(andy)[,c(1:5,8,9)]
s
kable(s,caption="Summary statistics for dataset $andy$")

mod1 <- lm(sales~price+advert, data=andy)
smod1 <- data.frame(xtable(summary(mod1)))

smod1 

kable(smod1, 
caption="The basic multiple regression model", 
col.names=c("coefficient", "Std. Error", "t-value", "p-value"),
align="c", digits=3)

## My favorite function for multiple regression

effprice <- effect("price", mod1)
plot(effprice)
summary(effprice)
alleffandy <- allEffects(mod1)
plot(alleffandy)



##
# Another example of using the function effect()
mod2 <- lm(sales~price+advert+I(advert^2), data=andy)
summary(mod2)
plot(effect("I(advert^2)", mod2))
plot(effect("advert", mod2))
plot(allEffects(mod2))


## all functions in simple linear regression can be used for multiple regression
mod1 <- lm(sales~price+advert, data=andy)
smod1 <- summary(mod1)
df <- mod1$df.residual
N <- nobs(mod1)
b1 <- coef(mod1)[[1]] #or
b2 <- coef(mod1)[["price"]]
b3 <- coef(mod1)[["advert"]]
sighat2 <- smod1$sigma^2
anov <- anova(mod1)
SSE <- anov[3,2]
SSE
SST <- sum(anov[,2]) #sum of column 2 in anova
SSR <- SST-SSE

# Show the estimated covariance matrix
vcov(mod1)

kable(data.frame(vcov(mod1)), align='c', digits=3,
      caption="The coefficient covariance matrix",
      col.names=c("(Intercept)", "price", "advert"))


## 5.3 interval estimation
#With the calculated standard error of  b2b2 ,  se(b2)=1.096se(b2)=1.096 , we can now determine a  95%95%  confidence interval, as shown in the following code lines. The code also shows using the  RR  function confint(model, parm, level) to check our results.
varb1 <- vcov(mod1)[1,1]
varb2 <- vcov(mod1)[2,2]
varb3 <- vcov(mod1)[3,3]
covb1b2 <- vcov(mod1)[1,2]
covb1b3 <- vcov(mod1)[1,3]
covb2b3 <- vcov(mod1)[2,3]
seb2 <- sqrt(varb2) #standard error of b2
seb3 <- sqrt(varb3)
alpha <- 0.05
tcr <- qt(1-alpha/2, df)
lowb2 <- b2-tcr*seb2
upb2 <- b2+tcr*seb2
lowb3 <- b3-tcr*seb3
upb3 <- b3+tcr*seb3
cat('b2: [', lowb2, ',', upb2,'],  b3:[', lowb3, '.', upb3);

confints <- confint(mod1, parm=c("price", "advert"), level=0.95)
kable(data.frame(confints), 
  caption="Confidence intervals for 'price' and 'advert'", 
  align="c", col.names=c("lowb", "upb"), digits=4)


#Finding an interval estimate for a linear combination of the parameters is often needed. 
# Suppose one is interested in determining an interval estimate for sales when the price decreases by  4040  cents and the advertising expenditure increases by  $800  (see Equation  33 ) in the andy basic equation.

alpha <- 0.1
tcr <- qt(1-alpha/2, df)
a1 <- 0
a2 <- -0.4
a3 <- 0.8
L <- a1*b1+a2*b2+a3*b3
varL <- a1^2*varb1+a2^2*varb2+a3^2*varb3+
  2*a1*a2*covb1b2+2*a1*a3*covb1b3+2*a2*a3*covb2b3
seL <- sqrt(varL)
lowbL <- L-tcr*seL
upbL <- L+tcr*seL

cat('L: ', L, 'with 90% interval estimate [', lowbL, ', ', upbL, ']')

# A different way to calculate the variance of L using vector operation. 
a <- c(0, -0.4, 0.8) # vector
b <- as.numeric(coef(mod1))# vector of coefficients
L <- sum(a*b) # sum of elementwise products
V <- vcov(mod1) # the variance-covariance matrix
A <- as.vector(a) # (indeed not necessary)
varL <- as.numeric(t(A) %*% V %*% A) 


## 5.5 Hypothesis testing

# H0: beta2 = 0

alpha <- 0.05
df <- mod1$df.residual
tcr <- qt(1-alpha/2, df)
b2 <- coef(mod1)[["price"]]
seb2 <- sqrt(vcov(mod1)[2,2])
t <- b2/seb2
pval <- 2*(1-pt(abs(t), df)) #two-tail test
pval

# Let us do the same for $H_0: \beta_3=0$
alpha <- 0.05
df <- mod1$df.residual
tcr <- qt(1-alpha/2, df)
b3 <- coef(mod1)[[3]]
seb3 <- sqrt(vcov(mod1)[3,3])
tval <- b3/seb3
pval <- 2*(1-pt(abs(tval), df))


## One-tail hpothesis testing 
# H_0: beta2>0 
alpha <- 0.05
tval <- b2/seb2
tcr <- -qt(1-alpha, df) #left-tail test
pval <- pt(tval, df)

## H0: \beta_3 < 1  
b3 <- coef(mod1)[[3]]
seb3 <- sqrt(vcov(mod1)[3,3])
tval <- (b3-1)/seb3
pval <- 1-pt(tval,df)
pval


## H0: 0 beta_1 -0.2 beta2 -0.5 beta3 <= 0
A <- as.vector(c(0, -0.2, -0.5))
V <- vcov(mod1)
L <- as.numeric(t(A) %*% coef(mod1))
seL <- as.numeric(sqrt(t(A) %*% V %*% A))
tval <- L/seL
pval <- 1-pt(tval, df) # the result (p-value) 
pval


## 5.6 Polynomial
data(andy)
# 
mod2 <- lm(sales~price+advert+I(advert^2),data=andy)
smod2 <- summary(mod2)
tabl <- data.frame(xtable(smod2))
names(tabl) <- c("Estimate", 
                 "Std. Error", "t", "p-Value")
kable(tabl, digits=3, align='c',
  caption="The quadratic version of the $andy$ model")


##
advlevels <- c(0.5, 2)
b3 <- coef(mod2)[[3]]
b4 <- coef(mod2)[[4]]
DsDa <- b3+2*b4*advlevels
DsDa

##
alpha <- 0.05
df <- mod2$df.residual
tcr <- qt(1-alpha/2, df)
g <- (1-b3)/(2*b4)
g3 <- -1/(2*b4)
g4 <- -(1-b3)/(2*b4^2)
varb3 <- vcov(mod2)[3,3]
varb4 <- vcov(mod2)[4,4]
covb3b4 <- vcov(mod2)[3,4]
varg <- g3^2*varb3+g4^2*varb4+2*g3*g4*covb3b4
seg <- sqrt(varg)
lowbg <- g-tcr*seg
upbg <- g+tcr*seg
cat('g is estimated as ', g, 'with 95% interval estaimtes [', lowbg, ', ', upbg, ']'); 

## 5.8
data(andy)
mod1 <- lm(sales~price+advert, data=andy)
smod1 <- summary(mod1)
Rsq <- smod1$r.squared
anov <- anova(mod1)
dfr <- data.frame(anov)
kable(dfr, caption="Anova table for the basic *andy* model")

