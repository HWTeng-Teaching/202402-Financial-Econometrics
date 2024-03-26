### This homework is written by 林筱慈 (312707042)

# ch04.03(d)

**Question**\
A 99% prediction interval for *y* given *x*<sub>0</sub> = 4.

**Answer**\
A 100(1−*α*) prediction interval for *y*<sub>0</sub> is $\hat{y_0} \pm t_cse(f)$, where $t_c = t_{(n-2),\frac{\alpha}{2}}$\
*α* = 0.01, *df* = 5 − 2 = 3, *t*<sub>*c*</sub> = 5.8409\
$\hat{y_0}=4.4, se(f) = 1.5875$\
A 99% prediction interval for *y* given *x*<sub>0</sub> = 4 is\
[ 4.4−5.8409\*1.5875, 4.4+5.8409\*1.5875 ] = [ −4.8722, 13.6722 ]

------------------------------------------------------------------------

code:

``` r
y_hat <- 4.4
t_c <- qt(1-0.01/2, 5-2)
se_f <- sqrt(2.52)
cat('99% P.I. for y given x=4 is [', round(y_hat-t_c*se_f,4),',', round(y_hat+t_c*se_f,4), ']')
```

```         
## 99% P.I. for y given x=4 is [ -4.8722 , 13.6722 ]
```
