library(POE5Rdata)
data(collegetown)
price = collegetown$price   
sqft = collegetown$sqft     

log_linear = lm(log(price)~sqft)     # The model from 4.25 a
log_log = lm(log(price)~log(sqft))   # The model from 4.25 b
linear_linear = lm(price~sqft)       # The model from 4.25 c

a_residual = resid(log_linear)       # Residual of log-linear model
b_residual = resid(log_log)          # Residual of log-log model
c_residual = resid(linear_linear)    # Residual of linear_linear model

plot(a_residual~sqft, main = "The relationship between log_linear residual and sqft",,ylim=c(-200,200))   
plot(b_residual~sqft, main = "The relationship between log_log residual and sqft",ylim=c(-200,200))
plot(c_residual~sqft, main = "The relationship between linear_linear residual and sqft",ylim=c(-200,200))   # To control residuals value in the same range of y axis


