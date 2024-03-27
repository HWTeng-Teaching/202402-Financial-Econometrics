### This homework is written by 林筱慈 (312707042)

# ch04.03(c)

**Question**  
A 95% prediction interval for *y* given *x*<sub>0</sub> = 4.  
  
**Answer**  
A 100(1−*α*) prediction interval for *y*<sub>0</sub> is
$\hat{y_0} \pm t_cse(f)$, where $t_c = t_{(n-2),\frac{\alpha}{2}}$  
*α* = 0.05, *df* = 5 − 2 = 3, *t*<sub>*c*</sub> = 3.1824  
$\hat{y_0}=4.4, se(f) = 1.5875$  
A 95% prediction interval for *y* given *x*<sub>0</sub> = 4 is  
[ 4.4−3.1824\*1.5875, 4.4+3.1824\*1.5875 ] = [ −0.6520, 9.4520 ]  

------------------------------------------------------------------------

code:

``` r
y_hat <- 4.4
t_c <- qt(1-0.05/2, 5-2)
se_f <- sqrt(2.52)
cat('95% P.I. for y given x=4 is [', round(y_hat-t_c*se_f,4),',', round(y_hat+t_c*se_f,4), ']', '\n')
```

    ## 95% P.I. for y given x=4 is [ -0.652 , 9.452 ]
