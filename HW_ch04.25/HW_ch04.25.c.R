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

