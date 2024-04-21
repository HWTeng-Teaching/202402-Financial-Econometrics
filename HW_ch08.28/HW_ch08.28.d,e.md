#
## This homework is written by  葉宗翰 (312707001)
# ch08.28 (d)
**Question:**\
Assume the heteroskedasticity pattern is $\sigma^2X2^2$. Obtain GLS estimates with conventional and
robust standard errors. Are the GLS parameter estimates closer to the true parameter values or
not? Which set of standard errors should be used?

**Solution:**
|$b_1$ GLS Standard Errors| $b_1$ GLS Robust Standard Errors |
|:--------:|:-----------:|
| 1.622549 | 1.864489  |
|$b_2$ GLS Standard Errors| $b_2$ GLS Robust Standard Errors |
|0.4687378|  0.5631968 |
|$b_3$ GLS Standard Errors| $b_3$ GLS Robust Standard Errors |
|0.3768156 | 0.3854274 |
#### Yes, GLS provides more precise estimates due to its smaller standard errors, potentially closer to the true parameter values. This boosts confidence in the model results, enabling reliable statistical inferences and hypothesis testing. Therefore, GLS is preferred for the model.

**Code:**
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
