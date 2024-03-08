# This homework is written by 312707006 黃馨霈

library(POE5Rdata)
data("cex5_small")

#2.25(c)
cex5_small$lnfoodaway <- log(cex5_small$foodaway)
cex5_small$lnfoodaway[is.infinite(cex5_small$lnfoodaway)] <- NA

hist(cex5_small$lnfoodaway)

summary(cex5_small$lnfoodaway)

#2.25(d)
lm_Income_lnFoodaway <- lm(lnfoodaway ~ income, data = cex5_small)
summary(lm_Income_lnFoodaway)
