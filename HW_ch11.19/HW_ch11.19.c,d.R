```{r}
#c
library(POE5Rdata)
library(systemfit)
library(broom)

data(mroz)
mroz1 <- mroz[mroz$lfp==1,]
FAMINC<-mroz1$faminc
WAGE<-mroz1$wage
HOURS<-mroz1$hours
nwifeinc <- FAMINC-WAGE*HOURS
m1.ols <- lm(hours~log(wage)+educ+age+kidsl6+kids618+nwifeinc, data=mroz1)
summary(m1.ols)


#d
m2.ols <- lm(log(wage)~educ+age+kidsl6+kids618+nwifeinc+exper, data=mroz1)
summary(m2.ols)
```
