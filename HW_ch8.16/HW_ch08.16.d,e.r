library(POE5Rdata)
library(tseries)
library(olsrr)
library(car)
library(lmtest)
library(knitr)
library(stargazer) #nice and informative tables
library(stats)
library(devtools)
library(ggplot2)
library(xtable)
library(tseries)
library(printr) # 
library(effects) #
library(AER)#
library(broom)#
# 8.16  
data("vacation")
N = 200;
df = N-4;
# a.  
mile = vacation$miles
income = vacation$income
age = vacation$age
kid = vacation$kids
mod = lm(mile~income+age+kid)
a = 0.05
smod = summary(mod)
hatb4 = coef(smod)[4,1]
seb4 = coef(smod)[4,2]
tc = qt(1-a/2,df)
up = hatb4+tc*seb4
lw = hatb4-tc*seb4
cat("estimate of b4 is",hatb4,"\n")
cat("[",lw,",",up,"]")

# d.  
cov1 = hccm(mod,type = "hc1")
seb4.robust = sqrt(cov1[4,4])
up = hatb4+tc*seb4.robust
lw = hatb4-tc*seb4.robust
cat("[",lw,",",up,"]")

# e.
w = 1/income
mod.gls = lm(mile~income+age+kid,weights = w)
smod.gls = summary(mod.gls)
hatb4.gls = coef(smod.gls)[4,1]
seb4.gls = coef(smod.gls)[4,2]
up = hatb4.gls+tc*seb4.gls
lw = hatb4.gls-tc*seb4.gls
cat("GLS estimate of b4 is",hatb4.gls,"\n")
cat("[",lw,",",up,"]")
