### This homework is written by 鄧筠潔 (312707031)

### 11.19(c)
#### Estimate the supply equation in (b) using OLS regression on only the women who worked (LFP = 1). Did things come out as expected? If not, why not?

***Answer:***

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786558/9d0fc5d6-ad9e-4d26-8512-3304805b3a93)

We did not expect the coefficient of $ln(WAGE)$ to be negative and insignificant.\
It is meant to be a supply equation so that coefficient should be positive and significant.

```{r}
data(mroz)
mroz1 <- mroz[mroz$lfp==1,]
FAMINC<-mroz1$faminc
WAGE<-mroz1$wage
HOURS<-mroz1$hours
nwifeinc <- FAMINC-WAGE*HOURS
m1.ols <- lm(hours~log(wage)+educ+age+kidsl6+kids618+nwifeinc, data=mroz1)
summary(m1.ols)
```

### 11.19(d)
#### Estimate the reduced-form equation by OLS for the women who worked, using work experience, $EXPER$, as an additional exogenous variable. $$ln(WAGE)=\pi_1 +\pi_2EDUC+\pi_3AGE+\pi_4KIDSL6+\pi_5KIDS618+\pi_6NWIFEINC+\pi_7EXPER+\nu$$ Based on the estimated reduced form, what is the effect upon wage of an additional year of education?

***Answer:***

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786558/f8176a14-1342-4bd7-ad94-c5a73d6ff7a1)

The coefficient of education implies an additional year of education will increase wages by approximately 10.11% holding other factors constant.\
And the estimate is statistically significant a the 1% level.

```{r}
m2.ols <- lm(log(wage)~educ+age+kidsl6+kids618+nwifeinc+exper, data=mroz1)
summary(m2.ols)
```
