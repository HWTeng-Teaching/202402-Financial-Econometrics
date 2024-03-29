#log-linear model
logline_model = lm(I(log(northampton)) ~ time , data = data)
result4 = summary(logline_model)
coe4 = c(logline_model$coefficients)
plot(logline_model$residuals , main = "log-linear residuals" , xlab = "Time" , ylab = "Residuals") #residuals
plot(data$time , data$northampton , xlab = "Time" , ylab = "Yield" ,
     main = expression(widehat(log(Yield)) == -0.3639+0.0186*Time)) #fitted equations
curve(exp(coe4[1]+ coe4[2]*x) , lwd = 3 , col = "red", add = T)

