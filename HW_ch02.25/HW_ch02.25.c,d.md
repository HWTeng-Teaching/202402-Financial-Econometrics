This homework is written by 黃馨霈 312707006

# ch02.25 (c)
Question. Construct a histogram of $\ln(FOODAWAY)$ and its summary statistics. Explain why FOODAWAY and $\ln(FOODAWAY)$ have different numbers of observations.  

Answer. There are some 0 in the raw data of FOODAWAY, but $\ln(0)= - \infty$ .  
Therefore, change $- \infty$ into NA.  

```
library(POE5Rdata)
data("cex5_small")

cex5_small$lnfoodaway <- log(cex5_small$foodaway)
cex5_small$lnfoodaway[is.infinite(cex5_small$lnfoodaway)] <- NA

hist(cex5_small$lnfoodaway)
```
![hist(lnfoodaway)](https://github.com/hsin456/NYCU/raw/main/FinEco_HW/hist(lnfoodaway).png)


```{r}
summary(cex5_small$lnfoodaway)
```
![hist(lnfoodaway)](https://github.com/hsin456/NYCU/raw/main/FinEco_HW/messageImage_1709885096777.jpg)

# ch02.25 (d)

Question. Estimate the linear regression $\ln(FOODAWAY)=\beta_1 + \beta_2 INCOME+ e$. Interpret the estimated slope.  

Answer.  $\hat{\ln(FOODAWAY)}=3.1293 + 0.0069 INCOME$  
Interpretation of slope: When the size of one household monthly income is $100 units, the expected food away from home expenditure per month(FOODAWAY) increases about $0.0069\times \exp(3.1293+0.0069INCOME)$ unit with an additional $100 units.  

```{r}
lm_Income_lnFoodaway <- lm(lnfoodaway ~ income, data = cex5_small)
summary(lm_Income_lnFoodaway)
```

![hist(lnfoodaway)](https://github.com/hsin456/NYCU/raw/main/FinEco_HW/messageImage_1709885240749.jpg)
