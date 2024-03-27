library(POE5Rdata)
data = data("collegetown")

collegetown$ln_sqft = log(collegetown$sqft)
collegetown$ln_price = log(collegetown$price)

mod1 = lm(ln_price~sqft,data = collegetown)     #log_linear
mod2 = lm(ln_price~ln_sqft,data = collegetown)  #log_log
mod3 = lm(price~sqft,data = collegetown)        #linear

res_mod1 = residuals(mod1)
hist(res_mod1,breaks = 20,main = 'Log-Linear residual')
jarque.test(res_mod1)

res_mod2 = residuals(mod2)
hist(res_mod2,breaks = 20,main = 'Log-Log residual')
jarque.test(res_mod2)

res_mod3 = residuals(mod3)
hist(res_mod3,breaks = 20,main = 'Linear residual')
jarque.test(res_mod3)
