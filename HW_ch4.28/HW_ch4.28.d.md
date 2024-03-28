## Ch4.28 (d)

This homework is written by 曾昱樵 (312707057)

## Question:
Using your chosen specification, use the observations up to 1996 to estimate the model. Construct a 95% prediction interval for $YIELD$ in 1997. Does your interval contain the true value?

## Answer:
The 95% prediction interval for $YIELD$ in 1997 is [1.383 , 2.3794], and the true yield in 1997 is 2.2318.

The prediction interval contains the true value.

## Calculation Process
Time: 1~47 (1950-1996)

Yield: Average wheat yield in tonnes per hectare in Northampton Shire from 1950-1996

Model: $YIELD_t = \gamma_0 + \gamma_1 \times TIME^2 + e_t$

The predictor: $\widehat{YIELD_t} = 0.7842 + 0.00048 \times TIME^2$

Predicting the yield of 1997: $\widehat{YIELD_{48}} = 0.7842 + 0.00048 \times 48^2 = 1.881$

Calculating the standard error of forecast: $se(f) = \sqrt{\hat{var}(f)} = \sqrt{\hat{\sigma}[1 + \frac{1}{N} + \frac{(x_0 - \bar{x})^2}{\sum (x_i - \bar{x})^2}]} = \sqrt{0.0563[1 + \frac{1}{47} + \frac{(48 - 24)^2}{\sum (x_i - 24)^2}]} = 0.2474$

Construcing a 95% prediction interval : $\alpha = 0.05$

The critical value: $t_c = t_{N-2,\frac{\alpha}{2}} = t_{47-2,\frac{0.05}{2}} = t_{45,0.025} = 2.014$

The 95% prediction interval for $YIELD_{48}$ is $\widehat{YIELD_{48}} \pm t_{45,0.025} se(f) = 1.881 \pm 2.014 \times 0.2474 = [1.383 , 2.3794]$

It contains the true yield in 1997: 2.2318

```R
new_TIME <- TIME[1:length(TIME)-1]
new_TIME2 <- TIME2[1:length(TIME2)-1]
new_YIELD <- YIELD[1:length(YIELD)-1]
new_mod <- lm(new_YIELD ~ new_TIME2)
g1 <- coef(new_mod)[[1]]
g2 <- coef(new_mod)[[2]]
y_hat <- g1 + g2 * 48^2
sigma_hat2 <- summary(new_mod)$sigma ^ 2
var_f <- sigma_hat2 + sigma_hat2 / length(new_TIME2) + sigma_hat2 * ((48-mean(new_TIME))^2 / sum((new_TIME-mean(new_TIME))^2))
se_f <- sqrt(var_f)

alpha = 0.05
cv1 <- qt(1-alpha/2,47-2)
cv2 <- qt(alpha/2,47-2)

up_b <- y_hat + cv1 * se_f
low_b <- y_hat + cv2 * se_f
low_b; up_b
```
