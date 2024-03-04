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
install.packages("broom") #for tidy
install.packages("stats")
install.packages("lmtest")
install.packages("stargazer")
install.packages("ggplot2")

library(stargazer) #nice and informative tables

library(lmtest)

library(stats)
library(devtools)
library(ggplot2)

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


# 

library(stargazer); library(ggplot2)

#  
x <- seq(-3,3, .2)
plot(x, pnorm(x), type="l", xlab="b1+b2x", ylab="P[y=1]") # probability
plot(x, dnorm(x), type="l")                               # density


# The transportation example
data("transport", package="PoEdata")
dtime = transport$dtime;
auto = transport$auto;
plot(dtime, auto)

auto.probit <- glm(auto~dtime, family=binomial(link="probit"), 
                   data=transport)
kable(tidy(auto.probit), digits=4, align='c', caption=
        "Transport example, estimated by probit")


# partial effects of an increase in dtime by one unit (10 minutes), 
xdtime <- data.frame(dtime=2)
predLinear <- predict(auto.probit, xdtime, 
                      data=transport, type="link")
DpDdtime <- coef(auto.probit)[[2]]*dnorm(predLinear)
DpDdtime


# prediction
xdtime <- data.frame(dtime=3)
predProbit <- predict(auto.probit, xdtime, 
                      data=transport, type="response")
predProbit

# Average marginal effect (AME):Marginal effect at the average 
# predicted value can be determines as follows. 
avgPredLinear <- predict(auto.probit, type="link")
avgPred <- mean(dnorm(avgPredLinear))
AME <- avgPred*coef(auto.probit)[2]
AME


#### 

data("coke", package="PoEdata")
coke.logit <- glm(coke~pratio+disp_coke+disp_pepsi, 
                  data=coke, family=binomial(link="logit"))

coke = coke$coke;
disp_coke = coke$disp_coke;
disp_pepsi = coke$disp_pepsi;
pratio = coke$pratio;

kable(tidy(coke.logit), digits=5, align="c",
      caption="Logit estimates for the 'coke' dataset")


coke.LPM <- lm(coke~pratio+disp_coke+disp_pepsi, 
               data=coke)
coke.probit <- glm(coke~pratio+disp_coke+disp_pepsi, 
                   data=coke, family=binomial(link="probit"))
stargazer(coke.LPM, coke.probit, coke.logit,
          header=FALSE, 
          title="Three binary choice models for the 'coke' dataset",
#          type=.stargazertype,
          type= "text",
          keep.stat="n",digits=4, single.row=FALSE,
          intercept.bottom=FALSE,
          model.names=FALSE,
          column.labels=c("LPM","probit","logit"))

# prediction uses the smae predict function
tble <- data.frame(table(true=coke$coke, 
                         predicted=round(fitted(coke.logit))))
kable(tble, align='c', caption="Logit prediction results")

# The usual functions for hypothesis testing, such as anova, coeftest, waldtest 
# and linearHypothesis are available for these models.
# The following code tests the hypothesis that the effects of 
# displaying coke and displaying pepsi have equal but opposite effects, 
# a null hypothesis that is being rejected by the test.

Hnull <- "disp_coke+disp_pepsi=0"
linearHypothesis(coke.logit, Hnull)


# Here is another example, testing the null hypothesis that displaying 
# coke and pepsi have (jointly) no effect on an individual¡¦s choice. 
# This hypothesis is also rejected.
Hnull <- c("disp_coke=0", "disp_pepsi=0")
linearHypothesis(coke.logit, Hnull)


## Multinomial logit model
library(nnet)
data("nels_small", package="PoEdata")

?nels_small
plot(nels_small$grades, nels_small$psechoice)
nels.multinom <- multinom(psechoice~grades, data=nels_small)
summary(nels.multinom)

## 
medGrades <- median(nels_small$grades)
fifthPercentileGrades <- quantile(nels_small$grades, .05)
nintyfivPercentileGrades <- quantile(nels_small$grades, .95)
newdat <- data.frame(grades=c(medGrades, fifthPercentileGrades, nintyfivPercentileGrades))
pred <- predict(nels.multinom, newdat, "probs")
pred


## Conditional logit model
install.packages('MCMCpack')
library(MCMCpack)
data("cola", package="PoEdata")
N <- nrow(cola)
N3 <- N/3
price1 <- cola$price[seq(1,N,by=3)]
price2 <- cola$price[seq(2,N,by=3)]
price3 <- cola$price[seq(3,N,by=3)]

bchoice <- rep("1", N3)
for (j in 1:N3){
  if(cola$choice[3*j-1]==1) bchoice[j] <- "2"
  if(cola$choice[3*j]==1) bchoice[j] <- "3"
}
cola.clogit <- MCMCmnl(bchoice ~ choicevar(price1, "b2", "1")+ choicevar(price2, "b2", "2")+ choicevar(price3, "b2", "3"),
                       baseline="3", mcmc.method="IndMH")
sclogit <- summary(cola.clogit)
sclogit

tabMCMC <- as.data.frame(sclogit$statistics)[,1:2]
row.names(tabMCMC)<- c("b2","b11","b12")
kable(tabMCMC, digits=4, align="c",
      caption="Conditional logit estimates for the 'cola' problem")



pPepsi <- 1
pSevenup <- 1.25
pCoke <- 1.10
b13 <- 0
b2  <- tabMCMC$Mean[1]
b11 <- tabMCMC$Mean[2]
b12 <- tabMCMC$Mean[3]

# The probability that individual i chooses Pepsi:
PiPepsi <- exp(b11+b2*pPepsi)/(exp(b11+b2*pPepsi)+exp(b12+b2*pSevenup)+exp(b13+b2*pCoke))
# The probability that individual i chooses Sevenup:
PiSevenup <- exp(b12+b2*pSevenup)/(exp(b11+b2*pPepsi)+exp(b12+b2*pSevenup)+exp(b13+b2*pCoke))
# The probability that individual i chooses Coke:
PiCoke <- 1-PiPepsi-PiSevenup
PiPepsi
PiSevenup
PiCoke


## Order probit model
install.packages('MCMCpack')
library(MCMCpack)
nels.oprobit <- MCMCoprobit(psechoice ~ grades, 
                            data=nels_small, mcmc=10000)
sOprobit <- summary(nels.oprobit)
sOprobit
tabOprobit <- sOprobit$statistics[, 1:2]
kable(tabOprobit, digits=4, align="c",
      caption="Ordered probit estimates for the 'nels' problem")


mu1 <- -tabOprobit[1]
b <- tabOprobit[2]
mu2 <- tabOprobit[3]-tabOprobit[1]
xGrade <- c(mean(nels_small$grades), 
            quantile(nels_small$grades, 0.05))

# Probabilities:
prob1 <- pnorm(mu1-b*xGrade)
prob2 <- pnorm(mu2-b*xGrade)-pnorm(mu1-b*xGrade)
prob3 <- 1-pnorm(mu2-b*xGrade)

prob1
prob2
prob3


# Marginal effects:
Dp1DGrades <- -pnorm(mu1-b*xGrade)*b
Dp2DGrades <- (pnorm(mu1-b*xGrade)-pnorm(mu2-b*xGrade))*b
Dp3DGrades <- pnorm(mu2-b*xGrade)*b
Dp1DGrades
Dp2DGrades
Dp3DGrades


## Model for count data
data("olympics", package="PoEdata")
medaltot = olympics$medaltot;
pop = olympics$pop;
gdp = olympics$gdp;
plot(pop, medaltot);
plot(gdp, medaltot);

plot(log(pop), medaltot);
plot(log(gdp), medaltot);

olympics.count <- glm(medaltot~log(pop)+log(gdp), 
                      family= "poisson", 
                      na.action=na.omit,
                      data=olympics)
olympics.count

kable(tidy(olympics.count), digits=4, align='c',
      caption="Poisson model for the 'olympics' problem")

plot(log(pop), medaltot);


