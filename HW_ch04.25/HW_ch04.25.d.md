
## This homework is written by 張家榮 (312707049)

## ch04.25(d)

**Question** \
Construct histograms of the least squares residuals from each of the models in (a)~(c) and obtain the Jarque-Bera statistics. Based on your observations of the residuals to be compatible with an assumption of normality ?

## *Ans* 

**No,the distributions of the residuals do not follow the assumption of normality.**

Code : 

``` r
library(POE5Rdata)
data = data("collegetown")

collegetown$ln_sqft = log(collegetown$sqft)
collegetown$ln_price = log(collegetown$price)

mod1 = lm(ln_price~sqft,data = collegetown)     #log_linear
mod2 = lm(ln_price~ln_sqft,data = collegetown)  #log_log
mod3 = lm(price~sqft,data = collegetown)        #linear

res_mod1 = residuals(mod1)
hist(res_mod1,breaks = 20,main = 'Log-Linear residual')
jarque.test(res_mod1)

res_mod2 = residuals(mod2)
hist(res_mod2,breaks = 20,main = 'Log-Log residual')
jarque.test(res_mod2)

res_mod3 = residuals(mod3)
hist(res_mod3,breaks = 20,main = 'Linear residual')
jarque.test(res_mod3)

```

![log_linear_residual](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161788384/36ee8230-b26b-4e83-97e8-105b63cdfb65)
![log_log_residual](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161788384/0aaa9c04-807d-43dc-b6f0-cbe4645fde7c)
![linear_residual](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161788384/33007d62-c57e-45bc-8c0c-3dcd93c835e6)
![1711533034362](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161788384/8f70fe19-131c-4c20-a2e8-3e13714d3876)

Jarque-Bera test is usually used to test whether the data follows a Normal distribution. The null hypothesis is that the data follows a Normal distribution, and the alternative hypothesis is that the data does not follow a Normal distribution. Since we observe that the JB statistics' P-value is smaller than 5% in all the models, we can conclude that these residuals do not follow the assumption of normality.
