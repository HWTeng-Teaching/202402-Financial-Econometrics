# Written by Huei-Wen Teg
# latest update 2017/5/26
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
install.packages("stargazer")
install.packages("ggplot2")

library(stargazer) #nice and informative tables
library(lmtest)
library(stats)
library(devtools)
library(ggplot2)

install_git("https://github.com/ccolonescu/PoEdata")
library(PoEdata) # Makes datasets ready to use

library(xtable)
library(PoEdata)
library(knitr) # kable
library(tseries)

library(printr) # 
library(effects) #
library(car) # linearHypothesis()
library(AER)#
library(broom)# tidy()

rm(list=ls()) # Caution: this clears the Environment


# 

library(stargazer); library(ggplot2)
data("utown", package="PoEdata")
utown$utown <- as.factor(utown$utown)
utown$pool <- as.factor(utown$pool)
utown$fplace <- as.factor(utown$fplace)
kable(summary.data.frame(utown), 
      caption="Summary for 'utown' dataset")
mod4 <- lm(price~utown*sqft+age+pool+fplace, data=utown)
kable(tidy(mod4), caption="The 'house prices' model")


library(PoEdata)
data(cps4_small)
mod5 <- lm(wage~educ+black*female, data=cps4_small)
delta1 <- coef(mod5)[["black"]]
delta2 <- coef(mod5)[["female"]]
gamma <- coef(mod5)[["black:female"]]
blfm <- delta1+delta2+gamma
kable(tidy(mod5), caption="A wage-discrimination model")

hyp <- c("black=0", "female=0", "black:female=0")
tab <- tidy(linearHypothesis(mod5, hyp))
kable(tab, 
      caption="Testing a joint hypothesis for the 'wage' equation")


# The Chow test
dnosouth <- cps4_small[which(cps4_small$south==0),]#no south
dsouth <- cps4_small[which(cps4_small$south==1),] #south
mod5ns <- lm(wage~educ+black*female, data=dnosouth)
mod5s <- lm(wage~educ+black*female, data=dsouth)
mod6 <- lm(wage~educ+black*female+south/(educ+black*female),
           data=cps4_small)
stargazer(mod6, mod5ns, mod5s, header=FALSE, 
          type=.stargazertype,
          title="Model comparison, 'wage' equation",
          keep.stat="n",digits=2, single.row=TRUE,
          intercept.bottom=FALSE)


mod6 <- lm(wage~educ+black*female+south/(educ+black*female),
           data=cps4_small)

kable(anova(mod5, mod6), 
      caption="Chow test for the 'wage' equation")


# log-linear models
library(PoEdata)
data("cps4_small", package="PoEdata")
mod1 <- lm(log(wage)~educ+female, data=cps4_small)
approx <- 100*coef(mod1)[["female"]]
exact <- 100*(exp(coef(mod1)[["female"]])-1)
approx
exact

library(broom)
library(car)
# Linear probability example
data("coke", package="PoEdata")
?coke
mod2 <- lm(coke~pratio+disp_coke+disp_pepsi, data=coke)
kable(tidy(mod2), 
      caption="Linear probability model, the 'coke' example")


# Graph for the linear probability model
b00 <- coef(mod2)[[1]]
b10 <- b00+coef(mod2)[["disp_coke"]]
b11 <- b10+coef(mod2)[["disp_pepsi"]]
b01 <-b11-coef(mod2)[["disp_coke"]]
b2 <- coef(mod2)[["pratio"]]
plot(coke$pratio, coke$coke, 
     ylab="Pr[coke]", xlab="price ratio")
abline(b00, b2, lty=2, col=2)
abline(b10,b2, lty=3, col=3)
abline(b11,b2, lty=4, col=4)
abline(b01,b2, lty=5, col=5)
legend("topright", c("00","10","11","01"),
       lty=c(2,3,4,5), col=c(2,3,4,5))
