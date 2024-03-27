## Ch4.28 (c)

This homework is written by 吳悅寧 (312707056)

**Question**\
Use your chosen specification, identify any unusual observations, based
on the studentized residuals, LEVERAGE, DFBETAS, and DFFITS.

**Answer**

-   Sample code

``` r
library(olsrr)     
ols_plot_resid_stand(quardratic_model)
ols_plot_resid_lev(quardratic_model)
ols_plot_dfbetas(quardratic_model)
ols_plot_dffits(quardratic_model)
```

-   Data Visualization ![studentized
    residuals]<img width="780" alt="截圖 2024-03-25 10 14 31" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/62731023/999fffb3-a0f9-4809-8932-b2590b262ce0">



    A studentized residual is a residual divided by its estimated standard
    deviation. Typically, any observation has an absolute value of 2 is an
    outlier. Observation 14, 28, 43 are outliers.

-   Data Visualization
    ![DFBETA]<img width="490" alt="截圖 2024-03-25 10 08 37" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/62731023/fe6b8dc9-dcca-4c10-9be9-c5bd3560ecec">


    We can see observation 6, 14 has a great influence on the intercept.
    Observation 14, 43, 44, 48 has a great influence on the quadratic term.

-   Data Visualization
    ![DFFIT]<img width="626" alt="截圖 2024-03-25 10 18 59" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/62731023/8a30f112-7724-401b-be08-8df4de0bc86e">

    DFFIT stands for difference in fits, is used to identify influential
    data points. It quantifies the number of standard deviation that the
    fitted value changes when its data point is omitted. Observation 14,
    43, 48 has a great influence.

-   Data Visualization
    ![LEVERAGE]<img width="605" alt="截圖 2024-03-25 10 24 04" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/62731023/ff49eeea-f992-472e-896b-049f691ad9f0">


    An observation is considered to have high leverage if it has a value for
    the predictor variables that are much more extreme compared to the rest
    of the observations in the dataset. Observation 14, 28, 43 has a great
    influence.
