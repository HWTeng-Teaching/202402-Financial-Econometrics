#R square
R_square <- matrix(c("linear-linear","linear-log","linear-quadratic","log-linear"
                     ,result1$r.squared,result2$r.squared,result3$r.squared,result4$r.squared) , ncol = 2) 
R_square <- t(R_square)
R_square
plot(data$time , data$northampton , xlab = "Time" , ylab = "Yield" ,
     main = expression(widehat(Yield) == 0.7737+0.0005*Time^2)) #fitted equations
curve(coe3[1]+ coe3[2]*x^2 , lwd = 3 , col = "red", add = T)
