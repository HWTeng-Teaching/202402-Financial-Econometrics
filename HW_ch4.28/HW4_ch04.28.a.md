## This homework is written by 吳柏賢 (312707054)

## ch04.25(g)





## Question:


Model 1 linear-linear model\
$YIELD_t =\beta_0 +\beta_1 Time+\epsilon_{1t}$\
Model 2 linear-log model\
$YIELD_t =\alpha_0 +\alpha_1ln(Time)+\epsilon_{2t}$\
Model 3 linear-quadratic model\
$YIELD_t = \gamma_0 + \gamma_1 Time^2 + \epsilon_{3t}$
Model 4 log-linear model\
$ln(YIELD_t) = \phi_0 + \phi_1 Time + \epsilon_{3t}$
a. Estimate each of the four equations.\
(I) plot of the fitted equations \
(II) plot of the residuals \
(III) error normaility tests, and (IV) values for $R^2$, \
(IV)which equation do you think is preferable ? Explain it.\

### answer 
(I)
![1](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161539032/b6596498-3370-4a85-b273-765b97f79b68)


(II)


(III)


(IV)



## Code:

### Model 1
```{r}
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


```

### Model 2 
```{r }
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


```

### Model 3
```{r }

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

```



### Model 4 
```{r }
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

```
