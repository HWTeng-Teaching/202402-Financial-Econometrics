
## This homework is written by 梁宏宇 (312707050)

## ch04.25(e)

**Question** \
For each of the models in (a)-(c), plot the least squares residuals against SQFT. Do you observe any patterns?

## Ans 

Code :

``` r
library(POE5Rdata)
data(collegetown)
price = collegetown$price   #擷取price
sqft = collegetown$sqft     #擷取sqft

log_linear = lm(log(price)~sqft)     #a小題のmodel
log_log = lm(log(price)~log(sqft))   #b小題のmodel
linear_linear = lm(price~sqft)        #c小題のmodel  

a_residual = resid(log_linear)       #log_linearのresidual
b_residual = resid(log_log)          #log_logのresidual
c_residual = resid(linear_linear)    #linear_linearのresidual

plot(a_residual~sqft, main = "The relationship between log_linear residual and sqft")
plot(b_residual~sqft, main = "The relationship between log_log residual and sqft")
plot(c_residual~sqft, main = "The relationship between linear_linear residual and sqft")
summary(a_residual)
summary(b_residual)
summary(c_residual)
```



![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/4f3dbebd-9753-4390-a55c-bb4b0cde0131)



![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/36be4db4-99c9-4844-b5b7-b6a63723840f)



![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/a8fd7f80-0f23-4d30-94f0-36c693f4010f)




![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/127933479/0c761d69-1b7b-4d1f-9868-5abd5d88c8b1)

## From log-linear to log_log and finally to liner_liner. Data is becoming more and more concentrated.
TO BE CONTINUE

