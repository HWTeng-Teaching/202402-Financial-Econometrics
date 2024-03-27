### This homework is written by 林筱慈 (312707042)

# ch04.03(e)

**Question**  
A 95% prediction interval for *y* given *x*<sub>0</sub> = *x̄*.  
Compare the width of this interval to the one computed in part (c).  
  
**Answer**  
$\bar{x} = \frac{\sum{x_i}}{N} = \frac{3+2+1+(-1)+0}{5} = 1$  
$\hat{y_0} = 1.2 + 0.8x_0 = 1.2 + 0.8*1 = 2$  
  
$\hat{\sigma}^2 = \frac{\sum\hat{e_i}^2}{N-2} = \frac{3.6}{5-2} = 1.2$.  
$\hat{var(f)} = \hat{\sigma}^2[1+\frac{1}{N}+\frac{(x_0- \bar{x})^2}{\sum({x_i-\bar{x}})^2}] = 1.2 * (1+\frac{1}{5}+0) = 1.44$  
$se(f) = \sqrt{\hat{var(f)}} = \sqrt{1.44} = 1.2$  

A 100(1−α) prediction interval for y<sub>0</sub> is $\hat{y_0} \pm t_cse(f)$, where $t_c = t_{(n-2),\frac{\alpha}{2}}$

*α* = 0.05, *df* = 5 − 2 = 3, *t*<sub>*c*</sub> = 3.1824  
A 95% prediction interval for *y* given *x* = *x̄* is 
[ 2−3.1824\*1.2, 2+3.1824\*1.2 ] = [ −1.8189, 5.8189 ]  

The width of part (c) is 9.4520 − (−0.6520) = 10.104,  
the width of part (e) is 5.8189 − (−1.8189) = 7.6378.  
The prediction interval is narrower for *x* = *x̄* compared to *x* = 4.  
This is because when we set *x* to a value not in the sample
range(*x*<sub>*i*</sub>=3,2,1,−1,0), such as *x* = 4, the model’s
uncertainty in predicting at this value is higher, leading to a wider
prediction interval.

------------------------------------------------------------------------

code:

``` r
x_i <- c(3,2,1,-1,0)
x_bar <- mean(x_i)
y_hat <- 1.2+0.8*x_bar
t_c <- qt(1-0.05/2, 5-2)
var_hat <- 1.2
var_f_hat <- var_hat*(1+1/5+0)
se_f <- var_f_hat^0.5
cat('95% P.I. for y given x=mean(x) is [', round(y_hat-t_c*se_f,4),',', round(y_hat+t_c*se_f,4), ']', '\n')
```

    ## 95% P.I. for y given x=mean(x) is [ -1.8189 , 5.8189 ]
