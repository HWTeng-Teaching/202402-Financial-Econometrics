This homework is written by 黃馨霈 312707006

# ch02.25 (c)
Question. Construct a histogram of $\ln(FOODAWAY)$ and its summary statistics. Explain why FOODAWAY and $\ln(FOODAWAY)$ have different numbers of observations.  

Answer. There are some 0 in the raw data of FOODAWAY, but $\ln(0)= - \infty$ .  
Therefore, replace $- \infty$ with NA.  

```
library(POE5Rdata)
data("cex5_small")

cex5_small$lnfoodaway <- log(cex5_small$foodaway)
cex5_small$lnfoodaway[is.infinite(cex5_small$lnfoodaway)] <- NA

hist(cex5_small$lnfoodaway)
```
![hist(lnfoodaway)](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145751254/0275dba5-883a-4524-96bc-c41d60266323)

```{r}
summary(cex5_small$lnfoodaway)
```
![messageImage_1709885096777](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145751254/1da876c1-3b8a-46f3-b1c1-80c23d62e248)

# ch02.25 (d)

Question. Estimate the linear regression $\ln(FOODAWAY)=\beta_1 + \beta_2 INCOME+ e$. Interpret the estimated slope.  

**Ans:**\
When the equation is $\widehat{ln(y)} = \beta_1 + \beta_2\ x$, it is easy to see $\widehat{y} = \exp(\beta_1 + \beta_2\ x)$,  
and the slope $m = dy/dx = \beta_2 \times \exp(\beta_1 + \beta_2 \ x)$. 

The log-linear model here is $\widehat{\ln (\text{FOODAWAY})} = \beta_1 + \beta_2 \ \text{INCOME}$, with $\beta_1$ = 3.1293, and $\beta_2$ = 0.0069.  
Times exponential to both sides, we can get $\widehat{\text{FOODAWAY}}$ = $\exp(3.1293 + 0.0069 \ \text{INCOME})$,  
and the slope is $m=dy/dx=0.0069\times \exp(3.1293+0.0069\text{INCOME})$

[Teng: Revise the above formula!]

The interpretation of slope:  
When the size of one household monthly income during past year is INCOME unit, the estimated food away from home expenditure per month increase about $0.0069\times exp(3.1293+0.0069INCOME)$ unit with an additional one unit of income of one household.  

For example, set the INCOME to be 65.29, which is the average of INCOME,  
then the slope is $0.0069\times \exp(3.1293+0.0069\times 65.29)=0.2475$.

[Teng: Revise the number. ]


```{r}
lm_Income_lnFoodaway <- lm(lnfoodaway ~ income, data = cex5_small)
summary(lm_Income_lnFoodaway)
```
![messageImage_1709885240749](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145751254/f51ad527-5861-4f7f-99d8-1f097c389cf0)

