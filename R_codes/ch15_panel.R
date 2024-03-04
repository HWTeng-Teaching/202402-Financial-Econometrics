# chapter 15. Panel data models

# modified by Huei-Wen Teng on 2022/5/10


rm(list=ls()) #Removes all items in Environment!
#install.packages('plm') # panel data linear model
library(plm) 
library(tseries) # for `adf.test()`
install.packages('dynlm')
library(dynlm) #for function `dynlm()`
install.packages(vars)
library('vars') # for function `VAR()` fail!
install.pacakaage(nlWladTest) # fail
library(nlWaldTest) # for the `nlWaldtest()` function 
library(lmtest) #for `coeftest()` and `bptest()`.
library(broom) #for `glance(`) and `tidy()`
library(PoEdata) #for PoE4 datasets
library(car) #for `hccm()` robust standard errors
library(sandwich)
library(knitr) #for `kable()`
install.packages(forecast) # fails
library(forecast) 
#install.packages('systemfit')
library(systemfit)
library(AER)
library(xtable)



data("nls_panel", package="PoEdata")
?nls_panel
str(nls_panel)
head(nls_panel)
tail(nls_panel)
# plot(nls_panel) # providing a static pairwise scatter plots
# and a vedio of each scatter plot

hist(nls_panel$lwage)
plot(nls_panel$exper, nls_panel$lwage)
plot(nls_panel$exper2, nls_panel$lwage)

plot(nls_panel$tenure, nls_panel$lwage)
plot(nls_panel$tenure2, nls_panel$lwage)


# organize the data as a panel data
nlspd <- pdata.frame(nls_panel, index=c("id", "year"))
smpl <- nlspd[nlspd$id %in% c(1,2),c(1:6, 14:15)]
tbl <- xtable(smpl) 
kable(tbl, digits=4, align="c",
      caption="A data sample")

# pdim() extracts the dimension of the data
pdim(nlspd)

# How to fit the pooled model: 

wage.pooled <- plm(lwage~educ+exper+I(exper^2)+
  tenure+I(tenure^2)+black+south+union, model="pooling", data=nlspd)

kable(tidy(wage.pooled), digits=5, caption="Pooled model")


# 15.2 The fixed effects model 

# find a small subset of the data
nls10 <- pdata.frame(nls_panel[nls_panel$id %in% 1:10,])


# method (1) factor(id)
nls10
wage10.fixed <- lm(lwage~exper+I(exper^2)+
                  tenure+I(tenure^2)+union+factor(id)-1,
                  data=nls10)
kable(tidy(wage10.fixed), digits=5, 
      caption="Fixed effects in a subsample")


# method (2) model = "within"
wage10.within <- plm(lwage~exper+I(exper^2)+
                  tenure+I(tenure^2)+union,
                  data=nls10, 
                  model="within")
tbl <- tidy(wage10.within)
kable(tbl, digits=5, caption=
  "Fixed effects using the 'within' model option for n=10")


# F-test for the small dataset: nls10. 

wage10.pooled <- plm(lwage~educ+exper+I(exper^2)+
  tenure+I(tenure^2)+black+south+union, model="pooling", data=nls10)

kable(tidy(pFtest(wage10.within, wage10.pooled)), caption=
        "Fixed effects test: Ho:'No fixed effects'")


# F-test for the whole dataset: nlspd
# Table 15.7 shows that the null hypothesis of no fixed effects is rejected.
# We conclude that there exist significant individual effects 

wage.within <- plm(lwage~exper+I(exper^2)+
                  tenure+I(tenure^2)+union,
                  data=nlspd, 
                  model="within")


kable(tidy(pFtest(wage.within, wage.pooled)), caption=
        "Fixed effects test: Ho:'No fixed effects'")




# the fixed effects model in the full model 
wage.within <- plm(lwage~exper+I(exper^2)+
                  tenure+I(tenure^2)+south+union,
                  data=nlspd, 
                  model="within")
tbl <- tidy(wage.within)
kable(tbl, digits=5, caption=
"Fixed effects using 'within' with full sample")


# 15.3 With cluster-robust standard error
 

# Fit the pooled model: 
wage.pooled <- plm(lwage~educ+exper+I(exper^2)+
  tenure+I(tenure^2)+black+south+union, model="pooling", data=nlspd)

kable(tidy(wage.pooled), digits=5, caption="Pooled model")


# plm(formula, data, subset, na.action, effect = c("individual", "time", "twoways"), model = c("within", "random", "ht", "between", "pooling", "fd"),...)

tbl <- tidy(coeftest(wage.pooled, vcov=vcovHC(wage.pooled,
                    type="HC0",cluster="group")))
kable(tbl, digits=5, caption= "Pooled 'wage' model with cluster robust standard errors")



# 
data(chemical)
