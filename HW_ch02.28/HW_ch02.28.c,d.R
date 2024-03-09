#2.28
#c
yhat <- predict(mod1)
residual=cps5_small$wage-yhat 
plot(cps5_small$educ, residual, 
     xlab="educ", 
     ylab="OLS residual", 
     type = "p",)

#d
#for males
mod2 <- lm(wage[which(cps5_small$female==0)] ~ educ[which(cps5_small$female==0)], data = cps5_small)
b1 <- coef(mod2)[[1]]
b2 <- coef(mod2)[[2]]
#for females
mod3 <- lm(wage[which(cps5_small$female==1)] ~ educ[which(cps5_small$female==1)], data = cps5_small)
b1 <- coef(mod3)[[1]]
b2 <- coef(mod3)[[2]]
#for blacks
mod4 <- lm(wage[which(cps5_small$black==1)] ~ educ[which(cps5_small$black==1)], data = cps5_small)
b1 <- coef(mod4)[[1]]
b2 <- coef(mod4)[[2]]
#for white
mod5 <- lm(wage[which(cps5_small$black==0)] ~ educ[which(cps5_small$black==0)], data = cps5_small)
b1 <- coef(mod5)[[1]]
b2 <- coef(mod5)[[2]]
