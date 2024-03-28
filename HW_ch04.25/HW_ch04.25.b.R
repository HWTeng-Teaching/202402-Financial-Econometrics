rm(list = ls())

library(POE5Rdata)
data(collegetown)

model <- lm(log(price) ~ log(sqft), data = collegetown)
summary(model)

slope <- coef(model)[2]
elasticity <- slope * (mean(collegetown$sqft) / mean(collegetown$price))

print(paste("斜率：", slope))
print(paste("彈性：", elasticity))

price_mean <- mean(collegetown$price)
sqft_mean <- mean(collegetown$sqft)
print(paste("price平均數", price_mean))
print(paste("sqft平均數", sqft_mean))
