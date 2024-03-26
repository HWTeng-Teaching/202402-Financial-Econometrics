## This homework is written by 賴岳錡 (312707052)

## ch04.25(g)

## Question:

For each model in (a)--(c), construct a 95% prediction interval for the value of a house with 2700 square feet.

## Answer:

To calculate the prediction interval , we need to find the unbiased predictor ${\hat{y}}$ and the standard error of the forecast $se(f) = \sqrt{var(f)}$ and t-statistic $t_\frac{\alpha}{2}(n-2)$ .

$$
var(f) = {\sigma^2} \cdot [1 + \frac{1}{N} + \frac{(x_0 - \bar{x}^2)}{\sum(x_i - \bar{x})^2}]
$$

The interval is

$$
[{\hat{y} \pm se(f) \cdot t_\frac{\alpha}{2}(n-2) }]
$$

PI_model_1 = [109.768,418.116]\
PI_model_2 = [111.087,466.067]\
PI_model_3 = [44.277,448.634] ($1000)



## Code:
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
lowb_1 =exp(as.numeric(price_1_hat) - tvalue*sef_1)
upb_1 =exp(as.numeric(price_1_hat) + tvalue * sef_1)


tvalue = qt(0.975,498)
vara_2_2 = vcov(model_2)[2,2]
sm2 = summary(model_2)
sigma_hat_2 = sm2$sigma^2 
varf_2 = sigma_hat_2 + sigma_hat_2/500 + (27- mean_sqft)^2 *vara_2_2 
sef_2 = sqrt(varf_2)
lowb_2 = exp(as.numeric(price_2_hat) - tvalue *sef_2)
upb_2 = exp(as.numeric(price_2_hat) + tvalue * sef_2)


tvalue = qt(0.975,498)
vara_3_2 = vcov(model_3)[2,2]
sm3 = summary(model_3)
sigma_hat_3 = sm3$sigma^2
varf_3 = sigma_hat_3 + sigma_hat_3/500 + (27- mean_sqft)^2 *vara_3_2
sef_3 = sqrt(varf_3)
lowb_3 = as.numeric(price_3_hat) - tvalue *sef_3
upb_3 = as.numeric(price_3_hat) + tvalue * sef_3

```
