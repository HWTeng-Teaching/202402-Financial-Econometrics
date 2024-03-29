
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

plot(a_residual~sqft, main = "The relationship between log_linear residual and sqft")
plot(b_residual~sqft, main = "The relationship between log_log residual and sqft")
plot(c_residual~sqft, main = "The relationship between linear_linear residual and sqft")

```



![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/4f3dbebd-9753-4390-a55c-bb4b0cde0131)



![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/36be4db4-99c9-4844-b5b7-b6a63723840f)



![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/a8fd7f80-0f23-4d30-94f0-36c693f4010f)




## From log-linear to log_log and finally to linear_linear. The data becomes more and more concentrated and towards when x equals 20


