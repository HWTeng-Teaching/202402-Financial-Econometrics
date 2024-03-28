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

Based on question a, we use the R-squared to determine that the linear-quadratic model is the best-fitting model. According to the calculation results, we obtain the function of Yield as $$YIELD_t = \gamma_0 + \gamma_1 Time^2 + \epsilon_{3t}$$\

