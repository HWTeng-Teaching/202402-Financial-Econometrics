library(POE5Rdata)
data(collegetown)
price = collegetown$price   #擷取price
sqft = collegetown$sqft     #擷取sqft

log_linear = lm(log(price)~sqft)     #a小題のmodel
log_log = lm(log(price)~log(sqft))   #b小題のmodel
linear_linear =lm(price~sqft)        #c小題のmodel  

a_residual = resid(log_linear)       #log_linearのresidual
b_residual = resid(log_log)          #log_logのresidual
c_residual = resid(linear_linear)    #linear_linearのresidual

plot(a_residual~sqft,main = "The relationship between log_linear residual and sqft")
plot(b_residual~sqft,main = "The relationship between log_log residual and sqft")
plot(c_residual~sqft,main = "The relationship between linear_linear residual and sqft")
