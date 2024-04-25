#
## This homework is written by  葉宗翰 (312707001)
## ch08.28 (d)
**Question:**\
Assume the heteroskedasticity pattern is $\sigma^2X_2^2$. Obtain GLS estimates with conventional and
robust standard errors. Are the GLS parameter estimates closer to the true parameter values or
not? Which set of standard errors should be used?

**Solution:**
|     | OLS estimates |GLS estimates & Standard Errors| Robust GLS estimates & Standard Errors | 95% GLS CI| 95% Robust GLS CI |
|:---:|:-----------------------:|:-----------------------:|:--------------------------------:|:-----------------------:|:--------------------------------:|
|$b_1$|     3.4764     |       4.4113 (1.6225)       |           4.4113  (1.86449)         |  [ 1.1910 , 7.6316 ]        |      [ 0.7108 , 8.1118 ]        |
|$b_2$|     3.8779       |     3.4128 (0.4687)       |           3.4128  (0.56320)         | [ 2.4825 , 4.3431 ]        |         [ 2.2950 , 4.5306 ]           |
|$b_3$|     0.5838       |    0.7620 (0.3768)       |           0.7620  (0.38543)         | [ 0.0141 , 1.5098 ]        |      [ -0.0030 , 1.5269 ]            |
#### Compared to the OLS estimates, only $b_1$ is closer to the true parameter. Additionally, the robust standard errors are larger than the conventional ones, indicating a more conservative approach. Hence, robust GLS is preferred for the model.

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
lwgb1<-glsb1-tc*glsseb1
ubgb1<-glsb1+tc*glsseb1
lwgb2<-glsb2-tc*glsseb2
ubgb2<-glsb2+tc*glsseb2
lwgb3<-glsb3-tc*glsseb3
ubgb3<-glsb3+tc*glsseb3

lwgrb1<-glsb1-tc*glsrobseb1
ubgrb1<-glsb1+tc*glsrobseb1
lwgrb2<-glsb2-tc*glsrobseb2
ubgrb2<-glsb2+tc*glsrobseb2
lwgrb3<-glsb3-tc*glsrobseb3
ubgrb3<-glsb3+tc*glsrobseb3

cat("b1 GLS se:",glsseb1,",","b1 GLS Robust se:",glsrobseb1,"\n")
cat("b2 GLS se:",glsseb2,",","b2 GLS Robust se:",glsrobseb2,"\n")
cat("b3 GLS se:",glsseb3,",","b3 GLS Robust se:",glsrobseb3,"\n")
cat("b1 95% GLS CI: [",lwgb1,",",ubgb1,"]","\n")
cat("b2 95% GLS CI: [",lwgb2,",",ubgb2,"]","\n")
cat("b3 95% GLS CI: [",lwgb3,",",ubgb3,"]","\n")

cat("b1 95% robust GLS CI: [",lwgrb1,",",ubgrb1,"]","\n")
cat("b2 95% robust GLS CI: [",lwgrb2,",",ubgrb2,"]","\n")
cat("b2 95% robust GLS CI: [",lwgrb3,",",ubgrb3,"]","\n")
```
---
## ch08.28 (e)
**Question:**\
Assume the multiplicative heteroskedasticity model $exp(α_1 + α_2X_2 + α_3X_3)$. Obtain FGLS
estimates with conventional and robust standard errors. Are the FGLS estimates closer to the
true parameter values than the GLS or OLS estimates? Which set of standard errors should
be used?

**Solution:**
|     |FGLS estimates & Standard Errors| Robust FGLS estimates & Standard Errors |95% FGLS CI| 95% Robust FGLS CI |
|:---:|:--------:|:-----------:|:--------:|:-----------:|
|$b_1$|  4.6146 (1.7845) | 4.6146 (1.6644) | [ 1.0729 , 8.1562 ] | [ 1.3112 , 7.9179 ] 
|$b_2$|  3.4261 (0.4985) | 3.4261 (0.5422) | [ 2.4366 , 4.4155 ] | [ 2.3500 , 4.5021 ] 
|$b_3$|  0.6525 (0.3772) | 0.6525 (0.3574) | [ -0.0962 , 1.4012 ] | [ -0.0567 , 1.3617 ] 

#### The standard errors of FGLS are slightly larger than GLS and significantly smaller than OLS. Therefore, GLS estimates are closer to the true parameter values compared to FGLS. While the robust standard error of b2 in FGLS is slightly larger than that of GLS, the robust standard errors of other coefficients in FGLS are slightly smaller than GLS. Hence, robust FGLS is preferred for the model.

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
lwfb1<-fglsb1-tc*fglsseb1
ubfb1<-fglsb1+tc*fglsseb1
lwfb2<-fglsb2-tc*fglsseb2
ubfb2<-fglsb2+tc*fglsseb2
lwfb3<-fglsb3-tc*fglsseb3
ubfb3<-fglsb3+tc*fglsseb3

lwfrb1<-fglsb1-tc*fglsrobseb1
ubfrb1<-fglsb1+tc*fglsrobseb1
lwfrb2<-fglsb2-tc*fglsrobseb2
ubfrb2<-fglsb2+tc*fglsrobseb2
lwfrb3<-fglsb3-tc*fglsrobseb3
ubfrb3<-fglsb3+tc*fglsrobseb3
cat("b1 FLGS se:",flgsseb1,",","b1 FLGS Robust se:",flgsrobseb1,"\n")
cat("b2 FLGS se:",flgsseb2,",","b2 FLGS Robust se:",flgsrobseb2,"\n")
cat("b3 FLGS se:",flgsseb3,",","b3 FLGS Robust se:",flgsrobseb3,"\n")
cat("b1 95% FGLS CI: [",lwfb1,",",ubfb1,"]","\n")
cat("b2 95% FGLS CI: [",lwfb2,",",ubfb2,"]","\n")
cat("b3 95% FGLS CI: [",lwfb3,",",ubfb3,"]","\n")

cat("b1 95% robust FGLS CI: [",lwfrb1,",",ubfrb1,"]","\n")
cat("b2 95% robust FGLS CI: [",lwfrb2,",",ubfrb2,"]","\n")
cat("b3 95% robust FGLS CI: [",lwfrb3,",",ubfrb3,"]","\n")
```
