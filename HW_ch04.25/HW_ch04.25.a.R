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
model1 <- lm(ln_price~sqft,data = D)
x_p <- data.frame(sqft=c(x_mean))
predict_lny <- predict(model1,newdata=x_p)  #newdata
predict_y <- exp(predict_lny)
#slope
slope <- coef(model1)[2] * predict_y
#elasticity
elas <- slope*x_mean/predict_y
print(paste("at the sample means, slope =", slope, "elasticity =", elas))

