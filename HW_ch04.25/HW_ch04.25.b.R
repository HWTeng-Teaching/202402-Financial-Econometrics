rm(list = ls())

library(POE5Rdata)
data(collegetown)

model <- lm(log(price) ~ log(sqft), data = collegetown)
summary(model)

slope <- coef(model) * (mean(collegetown$price) / mean(collegetown$sqft))
elasticity <- coef(model)

print(paste("the slope at the sample means：", slope, collapse = ", "))
print(paste("the elasticity at the sample means：", elasticity, collapse = ", "))

price_mean <- mean(collegetown$price)
sqft_mean <- mean(collegetown$sqft)
print(paste("price平均數", price_mean))
print(paste("sqft平均數", sqft_mean))
