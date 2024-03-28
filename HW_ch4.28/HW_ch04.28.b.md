## Ch4.28 (b)

This homework is written by 許誌榮 (312707055)

**Question**\
Interpret the coefficient of the time-related variable in your chosen specification.

**Answer**

-   Sample code

``` r
#R square
R_square <- matrix(c("linear-linear","linear-log","linear-quadratic","log-linear"
,round(result1$r.squared,digits = 4),round(result2$r.squared, digits = 4)
,round(result3$r.squared, digits = 4),round(result4$r.squared, digits = 4)) , ncol = 2) 
R_square <- t(R_square)
R_square
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145032062/7cc82469-4e98-4217-95d2-74d73fe3943b) 

Based on question a, we use the R-squared to determine that the linear-quadratic model is the best-fitting model. According to the calculation results, we obtain the function of Yield as $$\widehat{\text{YIELD}} = \gamma_0 + \gamma_1 TIME^2  $$\, with $\gamma_0$ = 0.7737, and $\gamma_1$ = 0.0005.

so we have $$\widehat{\text{YIELD}} = 0.7737 + 0.0005 \ TIME^2$$
The elasticity is $$\frac{(2 \gamma_1 TIME)TIME}{YIELD}$$
We can observe a relationship between elasticity and the independent variable. It is not easy for us to interpret the slope of a quadratic model, but we can say that when $\gamma_1\$ is greater than 0, the value of  YIELD will increase at an increasing rate.
