# HW_4.25.b

## This homework is written by 吳日為 (312707044)

## ch04.25(b)

### **Question:**

Estimate the log-log model ln(PRICE)=α1 + α2ln(SQFT) + e. Interpret the estimated parameters.
Calculate the slope and elasticity at the sample means, if necessary

### **answer:**

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162611288/36e39547-946a-4eaf-b1ea-e908a229d2ce)




$\alpha_1$=2.04965<br>
$\alpha_2$=1.02483<br>
$\bar{PRICE}$=250.2369<br>
$\bar{SQFT}$=27.28212<br>

$\alpha_1$: This represents the intercept of the log-log model. It indicates the expected value of ln(PRICE) is 2.04965 when ln(SQFT) is zero.

$\alpha_2$: This represents the slope of the log-log model. It indicates  PRICE will change by 1.02483% when SQFT changes by 1%.

At sample mean, slope = 1.02482818334365 elasticity = 0.111732064605034


```{r setup, include=FALSE}
rm(list = ls())

library(POE5Rdata)
data(collegetown)

model <- lm(log(price) ~ log(sqft), data = collegetown)
summary(model)

slope <- coef(model)[2]
elasticity <- slope * (mean(collegetown$sqft) / mean(collegetown$price))

print(paste("斜率：", slope))
print(paste("彈性：", elasticity))

price_mean <- mean(collegetown$price)
sqft_mean <- mean(collegetown$sqft)
print(paste("price平均數", price_mean))
print(paste("sqft平均數", sqft_mean))
knitr::opts_chunk$set(echo = TRUE)
```

