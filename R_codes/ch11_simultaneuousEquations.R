library(PoEdata)

#install.packages('systemfit') # for simulataneuous equations using 2SLS
#install.packages('broom')
#install.packages('knitr')


library(systemfit)
library(broom) #for `glance(`) and `tidy()`
library(PoEdata) #for PoE4 dataset
library(knitr) #for kable()

# example 1 

data(truffles)	
?truffles
truffles
str(truffles)
plot(truffles)
head(truffles)
tail(truffles)

truffles
names(truffles)

?truffles
plot(truffles$q, truffles$p)
# Procedures in R for 2SLS estimation
# 1. identify your demand and supply model 
D <- q~p+ps+di
S <- q~p+pf
# 2. Specify your simultaneous equations
sys <- list(D,S)
# 3. Identify IVs,
instr <- ~ps+di+pf
# 4. 
truff.sys <- systemfit(sys, inst=instr, 
                       method="2SLS", data=truffles)
summary(truff.sys)


# An illustration of page 17 in slides
plot(truffles$q[truffle$di<3], truffles$p)
plot(truffles$q[truffle$di<3], truffles$p[truffle$di<3])


Q.red <- lm(q~ps+di+pf, data=truffles)
P.red <- lm(p~ps+di+pf, data=truffles)
kable(tidy(Q.red), digits=4,
      caption="Reduced form for quantity")

kable(tidy(P.red), digits=4,
      caption="Reduced form for price")

# example 2


data(fultonfish)
?fultonfish
names(fultonfish)
fultonfish

hist(fultonfish$quan)
hist(fultonfish$lquan)
hist(fultonfish$lprice)
hist(fultonfish$stormy)


plot(fultonfish$lquan, fultonfish$lprice)

data("fultonfish", package="PoEdata")
fishQ.ols <- lm(lquan~mon+tue+wed+thu+stormy, data=fultonfish)
kable(tidy(fishQ.ols), digits=4,
      caption="Reduced 'Q' equation for the fultonfish example")

fishP.ols <- lm(lprice~mon+tue+wed+thu+stormy, data=fultonfish)
kable(tidy(fishP.ols), digits=4,
      caption="Reduced 'P' equation for the fultonfish example")



fish.D <- lquan~lprice+mon+tue+wed+thu
fish.S <- lquan~lprice+stormy
fish.eqs <- list(fish.D, fish.S)
fish.ivs <- ~mon+tue+wed+thu+stormy
fish.sys <- systemfit(fish.eqs, method="2SLS", 
              inst=fish.ivs, data=fultonfish)
summary(fish.sys)