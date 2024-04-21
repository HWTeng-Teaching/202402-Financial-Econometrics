#
## This homework is written by  葉宗翰 (312707001)
## ch08.28 (d)
**Question:**\
Assume the heteroskedasticity pattern is $\sigma^2X_2^2$. Obtain GLS estimates with conventional and
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
---
## ch08.28 (e)
**Question:**\
Assume the multiplicative heteroskedasticity model $exp(α_1 + α_2X_2 + α_3X_3)$. Obtain FGLS
estimates with conventional and robust standard errors. Are the FGLS estimates closer to the
true parameter values than the GLS or OLS estimates? Which set of standard errors should
be used?

**Solution:**
|$b_1$ FLGS Standard Errors| $b_1$ FLGS Robust Standard Errors |
|:--------:|:-----------:|
| 1.784454 | 1.664399 |
|$b_2$ FLGS Standard Errors| $b_2$ FLGS Robust Standard Errors |
|0.4985102|  0.542164  |
|$b_3$ FLGS Standard Errors| $b_3$ FLGS Robust Standard Errors |
|0.3772329| 0.3573456 |

#### The standard errors of FLGS are slightly larger than GLS and significantly smaller than OLS. Therefore, GLS estimates are closer to the true parameter values compared to FLGS. While the robust standard error of b2 in FLGS is slightly larger than that of GLS, the robust standard errors of other coefficients in FLGS are slightly smaller than GLS. Hence, robust FLGS is preferred for the model.

**Code:**

```
OLS<-lm(Y~X2+X3)
e_hatsq<-resid(OLS)^2
sighatsq<-lm(log(e_hatsq)~X2+X3)
var<-exp(fitted(sighatsq))
flgs<-lm(Y~X2+X3,weights = 1/var)
cov5 <- hccm(flgs, type = "hc1")
flgsseb1 <- sqrt(vcov(flgs)[1,1])
flgsrobseb1 <- sqrt(cov5[1,1])
flgsseb2 <- sqrt(vcov(flgs)[2,2])
flgsrobseb2 <- sqrt(cov5[2,2])
flgsseb3 <- sqrt(vcov(flgs)[3,3])
flgsrobseb3 <- sqrt(cov5[3,3])
cat("b1 FLGS se:",flgsseb1,",","b1 FLGS Robust se:",flgsrobseb1,"\n")
cat("b2 FLGS se:",flgsseb2,",","b2 FLGS Robust se:",flgsrobseb2,"\n")
cat("b3 FLGS se:",flgsseb3,",","b3 FLGS Robust se:",flgsrobseb3,"\n")
```
