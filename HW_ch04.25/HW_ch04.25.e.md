
## This homework is written by 梁宏宇 (312707050)

## ch04.25(e)

**Question** \
For each of the models in (a)-(c), plot the least squares residuals against SQFT. Do you observe any patterns?

## Ans 

Code :

``` r
library(POE5Rdata)
data(collegetown)
price = collegetown$price   
sqft = collegetown$sqft     

log_linear = lm(log(price)~sqft)     # The model from 4.25 a
log_log = lm(log(price)~log(sqft))   # The model from 4.25 b
linear_linear = lm(price~sqft)       # The model from 4.25 c

a_residual = resid(log_linear)       # Residual of log-linear model
b_residual = resid(log_log)          # Residual of log-log model
c_residual = resid(linear_linear)    # Residual of linear_linear model

plot(a_residual~sqft, main = "The relationship between log_linear residual and sqft",,ylim=c(-200,200))   
plot(b_residual~sqft, main = "The relationship between log_log residual and sqft",ylim=c(-200,200))
plot(c_residual~sqft, main = "The relationship between linear_linear residual and sqft",ylim=c(-200,200))   # To control residuals value in the same range of y axis

```


![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/aa0c4612-0e2b-490a-aea4-9cd258447745)

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/9aaecdcc-cb1c-4824-acf6-3abc1a999931)

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/01dd7c87-1e0c-418e-b402-655bd1c52cdf)





## The residual fluctuations of models log-linear and log-log are smaller than linear_linear. Given SQFT, the MODELs of models log-linear and log-log satisfy that the expected residual value is 0. However, the linear-linear model does not completely satisfy this condition. 


