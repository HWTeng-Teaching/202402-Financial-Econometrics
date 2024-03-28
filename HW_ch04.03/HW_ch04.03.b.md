### This homework is written by 312707041張滕淇

# ch04.03(b)

**Question**

The se(f) corresponding to part(a).

**Answer**

$\hat{\sigma}^2 = \frac{\sum\hat{e_i}^2}{N-2} = \frac{3.6}{3} = 1.2$

$\bar{x} = \frac{\sum{x_i}}{N} = \frac{3+2+1-1+0}{5} = 1$

$se(f) = \sqrt{\hat{var(f)}} = \sqrt{ \hat{\sigma}^2[1+\frac{1}{N}+ \frac{(x_0- \bar{x})^2}{\sum({X_i- \bar{x}})^2}]} = \sqrt{1.2(1+ \frac{1}{5}+ \frac{3^2}{10})} = 1.5875$
--------------------------------------------------------------------------------------------------

code:
```{r}
x_0 <- 4
Sxx <- 10
x_bar <- (3+2+1-1+0)/5
sigma_sqrt <- (3.6)/(5-2)
se_f <- sqrt(sigma_sqrt*(1+1/5+((x_0-x_bar)^2)/Sxx))
```
