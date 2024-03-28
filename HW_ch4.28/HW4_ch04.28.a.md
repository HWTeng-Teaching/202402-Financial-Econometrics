## This homework is written by 吳柏賢 (312707054)

## ch04.25(g)

## Question:


Model 1 linear-linear model\
\[
YIELD_t =\beta_0 +\beta_1 Time+\epsilon_{1t}
\]
Model 2 linear-log model\
\[
YIELD_t =\alpha_0 +\alpha_1ln(Time)+\epsilon_{2t}
\]
Model 3 linear-quadratic model\
\[
YIELD_t = \gamma_0 + \gamma_1 Time^2 + \epsilon_{3t}
\]
\
Model 4 log-linear model\
\[
ln(YIELD_t) = \phi_0 + \phi_1 Time + \epsilon_{3t}
\]
a. Estimate each of the four equations.\
(I) plot of the fitted equations \
(II) plot of the residuals \
(III) error normaility tests, and (IV) values for $R^2$, \
(IV)which equation do you think is preferable ? Explain it.\



## Code:


```r
read.csv("/Users/lai/Downloads/collegetown.csv")
```

```

```

```r
data = read.csv("/Users/lai/Downloads/collegetown.csv")
sqft = data$sqft
price = data$price
ln_price = log(price)
ln_sqft = log(sqft)
mean_sqft = mean(sqft)
b1 = coefficients(model_1)[1]
b2 = coefficients(model_1)[2]
a1 = coefficients(model_2)[1]
a2 = coefficients(model_2)[2]
d1 = coefficients(model_3)[1]
d2 = coefficients(model_3)[2]
model_1 = lm(ln_price~sqft , data = data)
model_2 = lm(ln_price~ln_sqft , data = data)
model_3 = lm(price~sqft , data = data)
price_1_hat = b1 + 27*b2
price_2_hat = a1 + log(27)*a2
price_3_hat = d1 + 27*d2
tvalue = qt(0.975,498)
vara_1_2 = vcov(model_1)[2,2]
sm1 = summary(model_1)
sigma_hat_1 = sm1$sigma^2 
varf_1 = sigma_hat_1 + sigma_hat_1/500 + (27- mean_sqft)^2 *vara_1_2 
sef_1 = sqrt(varf_1)
lowb_1 =exp( price_1_hat - tvalue *sef_1)
upb_1 =exp( price_1_hat + tvalue * sef_1)
#log-linear[110,418]

tvalue = qt(0.975,498)
vara_2_2 = vcov(model_2)[2,2]
sm2 = summary(model_2)
sigma_hat_2 = sm2$sigma^2 
varf_2 = sigma_hat_2 + sigma_hat_2/500 + (27- mean_sqft)^2 *vara_2_2 
sef_2 = sqrt(varf_2)
lowb_2 = exp(price_2_hat - tvalue *sef_2)
upb_2 = exp(price_2_hat + tvalue * sef_2)
#log-log[111,466]

tvalue = qt(0.975,498)
vara_3_2 = vcov(model_3)[2,2]
sm3 = summary(model_3)
sigma_hat_3 = sm3$sigma^2
varf_3 = sigma_hat_3 + sigma_hat_3/500 + (27- mean_sqft)^2 *vara_3_2
sef_3 = sqrt(varf_3)
lowb_3 = price_3_hat - tvalue *sef_3
upb_3 = price_3_hat + tvalue * sef_3
#linear[44.3,449]
```
