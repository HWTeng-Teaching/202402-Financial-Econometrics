
library(POE5Rdata)
data("cex5_small")

cex5_small$lnfoodaway <- log(cex5_small$foodaway)
cex5_small$lnfoodaway[is.infinite(cex5_small$lnfoodaway)] <- NA

hist(cex5_small$lnfoodaway)

summary(cex5_small$lnfoodaway)

lm_Income_lnFoodaway <- lm(lnfoodaway ~ income, data = cex5_small)
summary(lm_Income_lnFoodaway)
