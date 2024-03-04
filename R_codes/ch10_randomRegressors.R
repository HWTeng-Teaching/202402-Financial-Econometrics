rm(list=ls()) #Removes all items in Environment!
library(AER) #for `ivreg()`
library(lmtest) #for `coeftest()` and `bptest()`.
library(broom) #for `glance(`) and `tidy()`
library(PoEdata) #for PoE4 datasets
library(car) #for `hccm()` robust standard errors
library(sandwich)
library(knitr) #for making neat tables with `kable()`
library(stargazer) 


data("mroz", package="PoEdata")
?mroz

plot(mroz$edu, mroz$wage)
hist(mroz$wage) # Extremely skewed to the right. Take log to the wage
hist(mroz$edu)
min(mroz$wage)

plot(mroz$lfp) # Just to check descriptions about lfp

mroz1 <- mroz[mroz$lfp==1,] #restricts sample to lfp=1
hist(mroz1$wage)
hist(log(mroz1$wage))


# exper, edu

plot(mroz1$exper, mroz1$wage) # not happy because of the outliers
plot(mroz1$exper, log(mroz1$wage)) # happier because of less outliers, think about quadratic terms for curture

plot(mroz1$edu, log(mroz1$wage))
plot(mroz1$exper, log(mroz1$wage))

plot(mroz1$motheredu, mroz1$edu)
plot(mroz1$fatheredu, mroz1$edu)

# Example 10.1
mroz1.ols <- lm(log(wage)~educ+exper+I(exper^2), data=mroz1)
summary(mroz1.ols)

## cofficient estimate for "edu": 0.10
## 1 year increase in eduction, will bring on avage 10% change in wage. 
## Authour: Consider an issue that "ability" an omitted variable. 
## According 10.2: endogenous problem (due to omitted varialbe).
## Solution: Find IVs: motheredu, fatheredu. 
## 2SLS/IV estimation

# endogenous problem exists! 
# (Hold on! We will go back to this issue later after 10.4. ) 

plot(mroz1.ols)

residual = resid(mroz1.ols)
plot(mroz1$educ, residual)

kable(tidy(educ.ols), digits=4, align='c',caption=
  "First stage in the 2SLS model for the 'wage' equation")

# First stage regression
educ.ols <- lm(educ~exper+I(exper^2)+mothereduc, data=mroz1)
kable(tidy(educ.ols), digits=4, align='c',caption=
  "First stage in the 2SLS model for the 'wage' equation")
educHat <- fitted(educ.ols)
## Second stage regression
wage.2sls <- lm(log(wage)~educHat+exper+I(exper^2), data=mroz1)
kable(tidy(wage.2sls), digits=4, align='c',caption=
  "Second stage in the 2SLS model for the 'wage' equation")



mroz1.ols <- lm(log(wage)~educ+exper+I(exper^2), data=mroz1)


mroz1.iv <- ivreg(log(wage)~educ+exper+I(exper^2)|
            exper+I(exper^2)+mothereduc, data=mroz1)
summary(mroz1.iv, diagnostics=TRUE)



mroz1.iv1 <- ivreg(log(wage)~educ+exper+I(exper^2)|
            exper+I(exper^2)+mothereduc+fathereduc,
            data=mroz1)

summary(mroz1.iv1, diagnostics=TRUE)


stargazer(mroz1.ols, wage.2sls, mroz1.iv, mroz1.iv1,
  title="Wage equation: OLS, 2SLS, and IV models compared",
  header=FALSE, 
  type.stargazertype="html", # "html" or "latex" (in index.Rmd) 
  keep.stat="n",  # what statistics to print
  omit.table.layout="n",
  star.cutoffs=NA,
  digits=4, 
  single.row=TRUE,
  intercept.bottom=FALSE, #moves the intercept coef to top
  column.labels=c("OLS","explicit 2SLS", "IV mothereduc", 
                  "IV mothereduc and fathereduc"),
  dep.var.labels.include = FALSE,
  model.numbers = FALSE,
  dep.var.caption="Dependent variable: wage",
  model.names=FALSE,
  star.char=NULL) #supresses the stars)

# To test weak instruments (individually)
educ.ols <- lm(educ~exper+I(exper^2)+mothereduc+fathereduc, 
               data=mroz1)
tab <- tidy(educ.ols)
kable(tab, digits=4,
      caption="The 'educ' first-stage equation")

# To test weak instruments simutaneouly  
linearHypothesis(educ.ols, c("mothereduc=0", "fathereduc=0"))

# 
