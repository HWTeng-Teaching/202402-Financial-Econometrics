rm(list=ls())
install.packages("devtools") #install PoEdata packages
library(devtools) #devtools include install_github
install_github("ccolonescu/POE5Rdata")
library(POE5Rdata)
install.packages("ggplot2")
library(ggplot2)
head(collegetown)
ln_price <- log(collegetown$price)  
ln_sqft <- log(collegetown$sqft)

#4.25
#(a)
D <- data.frame(ln_price,ln_sqft,collegetown)
model1 <- lm(ln_price~sqft,data = D)
summary(model1)
x_mean <- mean(D$sqft)
y_mean <- mean(D$price)
slope <- coef(model1)[2] * y_mean
elas <- slope*x_mean/y_mean
print(paste("at the sample means, slope =", slope, "elasticity =", elas))

