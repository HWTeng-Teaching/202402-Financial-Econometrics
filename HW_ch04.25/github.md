

## This homework is written by 賴岳錡 (312707052)

## ch04.25(g)

**Question**\
For each model in (a)--(c), construct a 95% prediction interval for the value of a house with 2700 square feet.

## Ans


```r
model_1 = lm(ln_price~sqft , data = data)
model_2 = lm(ln_price~ln_sqft , data = data)
```

```
## Error in eval(predvars, data, env): object 'ln_sqft' not found
```

```r
model_3 = lm(price~sqft , data = data)
price_1_hat = b1 + 27*b2
price_2_hat = a1 + log(27)*a2
```

```
## Error in eval(expr, envir, enclos): object 'a1' not found
```

```r
price_3_hat = d1 + 27*d2
```

```
## Error in eval(expr, envir, enclos): object 'd1' not found
```

```r
tvalue = qt(0.975,498)
vara_1_2 = vcov(model_1)[2,2]
sm1 = summary(model_1)
sigma_hat_1 = sm1$sigma^2 
varf_1 = sigma_hat_1 + sigma_hat_1/500 + (27- mean_sqft)^2 *vara_1_2 
```

```
## Error in eval(expr, envir, enclos): object 'mean_sqft' not found
```

```r
sef_1 = sqrt(varf_1)
```

```
## Error in eval(expr, envir, enclos): object 'varf_1' not found
```

```r
lowb_1 =exp( price_1_hat - tvalue *sef_1)
```

```
## Error in eval(expr, envir, enclos): object 'sef_1' not found
```

```r
upb_1 =exp( price_1_hat + tvalue * sef_1)
```

```
## Error in eval(expr, envir, enclos): object 'sef_1' not found
```

```r
#log-linear[110,418]

tvalue = qt(0.975,498)
vara_2_2 = vcov(model_2)[2,2]
```

```
## Error in vcov(model_2): object 'model_2' not found
```

```r
sm2 = summary(model_2)
```

```
## Error in summary(model_2): object 'model_2' not found
```

```r
sigma_hat_2 = sm2$sigma^2 
```

```
## Error in eval(expr, envir, enclos): object 'sm2' not found
```

```r
varf_2 = sigma_hat_2 + sigma_hat_2/500 + (27- mean_sqft)^2 *vara_2_2 
```

```
## Error in eval(expr, envir, enclos): object 'sigma_hat_2' not found
```

```r
sef_2 = sqrt(varf_2)
```

```
## Error in eval(expr, envir, enclos): object 'varf_2' not found
```

```r
lowb_2 = exp(price_2_hat - tvalue *sef_2)
```

```
## Error in eval(expr, envir, enclos): object 'price_2_hat' not found
```

```r
upb_2 = exp(price_2_hat + tvalue * sef_2)
```

```
## Error in eval(expr, envir, enclos): object 'price_2_hat' not found
```

```r
#log-log[111,466]

tvalue = qt(0.975,498)
vara_3_2 = vcov(model_3)[2,2]
sm3 = summary(model_3)
sigma_hat_3 = sm3$sigma^2
varf_3 = sigma_hat_3 + sigma_hat_3/500 + (27- mean_sqft)^2 *vara_3_2
```

```
## Error in eval(expr, envir, enclos): object 'mean_sqft' not found
```

```r
sef_3 = sqrt(varf_3)
```

```
## Error in eval(expr, envir, enclos): object 'varf_3' not found
```

```r
lowb_3 = price_3_hat - tvalue *sef_3
```

```
## Error in eval(expr, envir, enclos): object 'price_3_hat' not found
```

```r
upb_3 = price_3_hat + tvalue * sef_3
```

```
## Error in eval(expr, envir, enclos): object 'price_3_hat' not found
```

```r
#linear[44.3,449]
```

