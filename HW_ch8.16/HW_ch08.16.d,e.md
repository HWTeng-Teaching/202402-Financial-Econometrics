##### This homework is written by 張祐慈 (312707005)
# 08.16
## d.
### Estimate the model by OLS using heteroskedasticity robust standard errors. Construct a 95% interval estimate for the effect of one more child on miles traveled, holding the two other variables constant. How does this interval estimate compare to the one in (a)?
## Ans.
For (a), regular OLS method, the estimate for the effect of one more child is -81.82642, se is 27.1296 and the 95% confidence interval estimate is  [ -135.3298 , -28.32302 ].
```
mile = vacation$miles
income = vacation$income
age = vacation$age
kid = vacation$kids
mod = lm(mile~income+age+kid)
a = 0.05
smod = summary(mod)
hatb4 = coef(smod)[4,1]
seb4 = coef(smod)[4,2]
tc = qt(1-a/2,df)
up = hatb4+tc*seb4
lw = hatb4-tc*seb4
cat("estimate of b4 is",hatb4,"\n")
cat("[",lw,",",up,"]")
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/d39b64f2-52c9-4259-96b1-ca119f48c276)

![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/18a890b6-7ac1-4339-8482-9fbdd0be52ce)

Using heteroskedasticity robust standard errors, it has the same estimate for the effect of one more child, se is 29.15438 and the 95% interval estimate is [ -139.323 , -24.32986 ].  
Compare to (a), its interval is wider since it has a larger standard error.
```
cov1 = hccm(mod,type = "hc1")
seb4.robust = sqrt(cov1[4,4])
up = hatb4+tc*seb4.robust
lw = hatb4-tc*seb4.robust
cat("[",lw,",",up,"]")
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/a5f518b4-7c8c-4bfb-93a1-d2027d4c48e5)
## e.
### Obtain GLS estimates assuming $σ^2= σ^2INCOME^2$. Using both conventional GLS and robust GLS standard errors, construct a 95% interval estimate for the effect of one more child on miles traveled,holding the two other variables constant. How do these interval estimates compare to the ones in (a) and (d)?
## Ans.
Set $\sigma_i^2=\sigma^2INCOME^2$, we need to multiply the model by $\frac{1}{INCOME}$, weight should be $\frac{1/income}$  
Using GLS robust standard error, the estimate for the effect of one more child is -78.36334, se is 24.73552 and the 95% confidence interval estimate is  [ -127.1453 , -29.5814 ].
```
w = 1/income
mod.gls = lm(mile~income+age+kid,weights = w)
smod.gls = summary(mod.gls)
hatb4.gls = coef(smod.gls)[4,1]
seb4.gls = coef(smod.gls)[4,2]
up = hatb4.gls+tc*seb4.gls
lw = hatb4.gls-tc*seb4.gls
cat("GLS estimate of b4 is",hatb4.gls,"\n")
cat("[",lw,",",up,"]")
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/18cefd43-8c9b-49cb-8b15-8499c4536560)
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161786886/87d84e8a-31ec-4a09-acc5-8d734e5fbb44)

Compare to (a) and (d). GLS method has the smallest standard error and narrowest 95% confidence interval.
|                        | OLS                      | Heteroskedasticity robust standard errors | GLS                      |
|------------------------|--------------------------|-------------------------------------------|--------------------------|
|  $b_4$                |  -81.82642                | -81.82642                                 | -78.36334                |
| $se(b_4)$             |27.1296                 | 29.15438                                   | 24.73552                 |
| 95% interval  | [ -135.3298 , -28.32302 ] | [ -139.323 , -24.32986 ]                  | [ -127.1453 , -29.5814 ] |
