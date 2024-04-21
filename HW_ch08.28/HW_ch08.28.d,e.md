#
## This homework is written by  葉宗翰 (312707001)
# ch08.28 (d)
Question:\
Assume the heteroskedasticity pattern is $\sigma^2X2^2$. Obtain GLS estimates with conventional and
robust standard errors. Are the GLS parameter estimates closer to the true parameter values or
not? Which set of standard errors should be used?

Solution:

```
w <- 1/X2^2
gls <- lm(Y ~ X2 + X3, weights = w)
cov4 <- hccm(gls, type = "hc1")
vcvmod <- coeftest(gls, vcov. = cov4)
glsseb1 <- sqrt(vcov(gls)[1,1])
glsrobseb1 <- sqrt(cov4[1,1])
glsseb2 <- sqrt(vcov(gls)[2,2])
glsrobseb2 <- sqrt(cov4[2,2])
glsseb3 <- sqrt(vcov(gls)[3,3])
glsrobseb3 <- sqrt(cov4[3,3])
cat("b1 GLS se:",glsseb1,",","b1 GLS Robust se:",glsrobseb1,"\n")
cat("b2 GLS se:",glsseb2,",","b2 GLS Robust se:",glsrobseb2,"\n")
cat("b3 GLS se:",glsseb3,",","b3 GLS Robust se:",glsrobseb3,"\n")
```
