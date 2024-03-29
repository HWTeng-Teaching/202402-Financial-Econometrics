
## This homework is written by 張永濬 (312707048)

## ch04.25(c)

**Question** \
Compare the $R^2$ value from the linear model $PRICE = δ_1 + δ_2SQFT + e$ to the “generalized” $R^2$ measure for the models in (b) and (c).

## *Ans* 
\
1. Calculate $R^2$ : We can directly get the $R^2$ value in the summary statistics\ <img width="423" alt="截圖 2024-03-27 下午5 04 31" src="https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/145115138/14e168cc-a4b0-4918-b4a0-275075545654">
     

2. Calculate “generalized” $R^2$ : 
- log-linear model

$$ln(PRICE) = β_1 + β_2SQFT + e$$

$$\hat{y} = e^{b_1+b_2x}$$


$$R_g^2 = [corr(y,\hat{y})]^2 = r_{y\hat{y}}^2$$

- log-log model

$$ ln(PRICE) = α_1 + α_2ln(SQFT) + e$$

$$\hat{y} = e^{a_1+a_2ln(x)}$$


$$R_g^2 = [corr(y,\hat{y})]^2= r_{y\hat{y}}^2 $$

- linear model

$$ PRICE = δ_1 + δ_2SQFT + e $$

$$\hat{y} = δ_1 + δ_2x$$

$$R_g^2 = [corr(y,\hat{y})]^2= r_{y\hat{y}}^2$$

|   $modal$    |    $R^2$    | $generalized\ R^2$ |
|:------------:|:-----------:|:------------------:|
| $log-linear$ | $0.5417259$ |    $0.6621612$     |
|  $log-log$   | $0.4738445$ |    $0.6445084$     |
|   $linear$   | $0.6413167$ |    $0.6413167$     |



## code

``` r
#modal(a)
log_linear = lm(log(price)~sqft,data = collegetown)
log_linear
sum_log_linear = summary(log_linear)
#R^2
sum_log_linear$r.squared

#general_R^2
y_hat = exp(coef(log_linear)[1]+coef(log_linear)[2]*collegetown$sqft)
y = collegetown$price
general_R = cor(y,y_hat)^2
general_R



#modal(b)
log_log = lm(log(price)~log(sqft),data = collegetown)
log_log
sum_log_log = summary(log_log)
#R^2
sum_log_log$r.squared

#general_R^2
y_hat = exp(coef(log_log)[1]+coef(log_log)[2]*log(collegetown$sqft))
y = collegetown$price
general_R = cor(y,y_hat)^2
general_R

#modal(c)
linear = lm(price~sqft,data = collegetown)
linear
sumlinear = summary(linear)
#R^2
sumlinear$r.squared

#general_R^2
y_hat = coef(linear)[1]+coef(linear)[2]*collegetown$sqft
y = collegetown$price
general_R = cor(y,y_hat)^2
general_R
```
