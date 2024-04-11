price <- collegetown$price
sqft <- collegetown$sqft
age <- price*sqft

linear_model <- lm(price~sqft+age)
sum_linear <- summary(linear_model)
sum_linear
