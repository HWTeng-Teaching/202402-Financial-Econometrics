## Ch4.28 (b)

This homework is written by 許誌榮 (312707055)

**Question**\
Interpret the coefficient of the time-related variable in your chosen specification.

**Answer**

-   Sample code

``` r
#R square
R_square <- matrix(c("linear-linear","linear-log","linear-quadratic","log-linear"
              ,result1$r.squared,result2$r.squared,result3$r.squared,result4$r.squared) , ncol = 2) 
R_square <- t(R_square)
R_square

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145032062/c0f06b7e-66aa-4890-9ebc-c02a59bc8186)
