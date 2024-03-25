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
    residuals](https://github.com/ivywu0807/try/blob/main/截圖%202024-03-25%2010.14.31.png)


A studentized residual is a residual divided by its estimated standard
deviation. Typically, any observation has an absolute value of 2 is an
outlier. Observation 14, 28, 43 are outliers.

-   Data Visualization
    ![DFBETA](https://github.com/ivywu0807/try/blob/main/截圖%202024-03-25%2010.08.37.png)

We can see observation 6, 14 has a great influence on the intercept.
Observation 14, 43, 44, 48 has a great influence on the quadratic term.

-   Data Visualization
    ![DFFIT](https://github.com/ivywu0807/try/blob/main/截圖%202024-03-25%2010.18.59.png)
    DFFIT stands for difference in fits, is used to identify influential
    data points. It quantifies the number of standard deviation that the
    fitted value changes when its data point is omitted. Observation 14,
    43, 48 has a great influence.

-   Data Visualization
    ![LEVERAGE](https://github.com/ivywu0807/try/blob/main/截圖%202024-03-25%2010.24.04.png)

An observation is considered to have high leverage if it has a value for
the predictor variables that are much more extreme compared to the rest
of the observations in the dataset. Observation 14, 28, 43 has a great
influence.
