## Ch4.28 (b)

This homework is written by 許誌榮 (312707055)

**Question**\
Interpret the coefficient of the time-related variable in your chosen specification.

**Answer**

-   Sample code

``` r
#R square
logline_model = lm(I(log(northampton)) ~ time , data = data)
result4 = summary(logline_model)
coe4 = c(logline_model$coefficients)
plot(logline_model$residuals , main = "log-linear residuals" , xlab = "Time" , ylab = "Residuals") #residuals
plot(data$time , data$northampton , xlab = "Time" , ylab = "Yield" ,
     main = expression(widehat(log(Yield)) == -0.3639+0.0186*Time)) #fitted equations
curve(exp(coe4[1]+ coe4[2]*x) , lwd = 3 , col = "red", add = T)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145032062/b2f812cb-1e2b-48dd-8c73-88215a37faa7)

Based on question a, we use the R-squared to determine that the linear-quadratic model is the best-fitting model. According to the calculation results, we obtain the function of Yield as $$\widehat{\text{YIELD}} = \gamma_0 + \gamma_1 TIME^2  $$\, with $\gamma_0$ = 0.7737, and $\gamma_1$ = 0.0005.

so we have $$\widehat{\text{YIELD}} = 0.7737 + 0.0005 \ TIME^2$$
The elasticity is $$\frac{(2 \gamma_1 TIME)TIME}{YIELD}$$
We can observe a relationship between elasticity and the independent variable. It is not easy  to interpret the slope of a quadratic model, but we can say that when $\gamma_1\$ is greater than 0, the value of  YIELD will increase at an increasing rate.
