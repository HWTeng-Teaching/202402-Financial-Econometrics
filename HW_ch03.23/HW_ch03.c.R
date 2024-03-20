exp_price <- alpha1 + alpha2*sqft^2
sqft <- 20
alpha <- 0.05
tc <- qt(1-alpha/2,df)
alpha1 <- model$coef[1]
alpha2 <- model$coef[2]
vara1 <- vcov(model)[1, 1]
vara2 <- vcov(model)[2, 2]
cova1a2 <- vcov(model)[1, 2]
varL = vara1 + (sqft^2)^2*vara2 + 2*sqft^2*cova1a2 # var(L)
seL <- sqrt(varL)

# Interval estimate
lowb <- exp_price-tc*seL
upb <- exp_price+tc*seL
interval<-c(lowb,upb)
interval
