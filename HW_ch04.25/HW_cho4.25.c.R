```{r}
#modal(a)
log_linear = lm(log(price)~sqft,data = collegetown)
log_linear
sum_log_linear = summary(log_linear)
#R^2
sum_log_linear[[9]]
#general_R^2
y_n = exp(coef(log_linear)[1]+coef(log_linear)[2]*collegetown$sqft)
y_c = y_n*exp(sum_log_linear$sigma^2/2)
y = collegetown$price
general_R = cor(y,y_c)^2
general_R


#modal(b)
log_log = lm(log(price)~log(sqft),data = collegetown)
log_log
sum_log_log = summary(log_log)
#R^2
sum_log_log[[9]]
#general_R^2
y_n = exp(coef(log_log)[1]+coef(log_log)[2]*log(collegetown$sqft))
y_c = y_n*exp(sum_log_linear$sigma^2/2)
y = collegetown$pric
general_R = cor(y,y_c)^2
general_R


#modal(c)
linear = lm(price~sqft,data = collegetown)
linear
sumlinear = summary(linear)
#R^2
sumlinear[[9]]
#general_R^2
y_n = coef(linear)[1]+coef(linear)[2]*collegetown$sqft
y_c = y_n*exp(sum_log_linear$sigma^2/2)
y = collegetown$price
general_R = cor(y,y_c)^2
general_R
```
