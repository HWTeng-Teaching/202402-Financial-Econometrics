library(POE5Rdata)

data <- POE5Rdata::wa_wheat   
Y <- data$northampton
X <- data$time

# model 1 : linear-linear model 
model1 <- lm(Y~X)
result<- summary(model1)
residual <- model1$residuals
#畫出residual 散佈圖
plot(residual)

coe<- c(model1$coefficients)
fitted_model_1 <- function(X){ return(coe[1] + coe[2] * X) }

plot(x = X,y = Y,main = "scatter plot of X and Y",
     xlab = "x-value" ,ylab = "y-value")
abline(model1,lwd=2)

print(result$r.squared)

########################
Y <- data$northampton
X <- data$time
X_2 <- log(data$time)
df<- data.frame(X,Y)
# model 2 : linear-linear model 
model2 <- lm(Y~X_2)
result<- summary(model2)
residual <- model1$residuals
#畫出residual 散佈圖
plot(residual)
coe<- c(model2$coefficients)
fitted_model_2 <- function(x){ return(coe[1] + coe[2] * log(x)) }
plot(df)
curve(fitted_model_2, from = 1, to = 100, n = 101,add =T)
shapiro.test(residual) # H0: The data is normal dist 
# H1: reject H0 
print(result$r.squared)
#############################

Y <- data$northampton
X <- data$time
X_3 <- data$time ** 2 
df<- data.frame(X,Y)
# model 3 : linear-quadratic model 
model3 <- lm(Y~X_3)
result<- summary(model3)
residual <- model3$residuals
#畫出residual 散佈圖
plot(residual)
coe<- c(model3$coefficients)
fitted_model_3 <- function(x){ return(coe[1] + coe[2] * x**2) }
plot(df$X, df$Y, main = "Fitted Model", xlab = "X", ylab = "Y")
curve(fitted_model_3, from = min(df$X), to = max(df$X), add = TRUE, col = "red")
shapiro.test(residual) # H0: THe data is normal dist 
# H1: reject H0 
print(result$r.squared)
########################
Y <- data$northampton
X <- data$time
Y_4 <- log(Y)
df<- data.frame(X,Y)
# model 4 : linear-quadratic model 
model4 <- lm(Y_4~X)
result<- summary(model4)
residual <- model4$residuals
#畫出residual 散佈圖
plot(residual)
coe<- c(model4$coefficients)
fitted_model_4 <- function(x){ return(exp(coe[1] + coe[2] * x)) }
plot(df$X, df$Y, main = "Fitted Model", xlab = "X", ylab = "Y")
curve(fitted_model_4, from = min(df$X), to = max(df$X), add = TRUE, col = "red")
shapiro.test(residual) # H0: THe data is normal dist 
# H1: reject H0 
print(result$r.squared)
############################
