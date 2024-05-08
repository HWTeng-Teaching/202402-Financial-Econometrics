### This homework is written by 邱澤宇 (312707017)
### 10.20
### The CAPM [see Exercises 10.14 and 2.16] says that the risk premium on security j is related to the risk premium on the market portfolio. That is $r_j - r_f = \alpha_j + \beta_j (r_m - r_f)$ where $r_j$ and $r_f$ are the returns to security j and the risk-free rate, respectively, $r_m$ is the return on the market portfolio, and $\beta_j$, is the jth security's "beta" value. We measure the market portfolio using the Standard & Poor's value weighted index, and the risk-free rate by the 30-day LIBOR monthly rate of return. As noted in Exercise 10.14, if the market return is measured with error, then we face an errors-in-variables, or measurement error, problem.


### (c)
**Question:**\
Compute the first-stage residuals, $\hat{v}$, and add them to the CAPM model. Estimate the resulting augmented equation by OLS and test the significance of $\hat{v}$ at 1% level of significance. Can we conclude that the market return is exogenous?

**Answer:**

```
rm(list = ls())
library(AER) \# Applied Econometrics with R
library(POE5Rdata)
data(capm5)

capm5$Ex_Return = capm5$msft - capm5$riskfree
capm5$RP = capm5$mkt - capm5$riskfree

capm5$rank = rank(capm5$RP)
mod2S1 = lm(RP ~ rank, data = capm5) \# first stage regression

vhat1 = residuals(mod2S1) \# obtain first stage residuals
modc = lm(Ex_Return ~ vhat1 + RP, data = capm5)
summary(modc)
```
|Coefficients|Estimate|Std. Error|t value|P-value|
|--------|--------|--------|--------|--------|
|vhat1|-0.874599|0.428626|-2.040|0.0428`＊`|

This is the Hausman test for endogeneity. The t-statistic on $\hat{v}$ is -2.04 with a p-value = 0.043. It is not significant at the 1% level but it is at the 5% level. At the 1% level we cannot reject the null hypothesis that the market return is exogenous.

### (d)
**Question:**\
Use RANK as an IV and estimate the CAPM model by IV/2SLS. Compare this IV estimate to the OLS estimate in part(a). Does the IV estimate agree with your expectations?

```
iv1 = ivreg(Ex_Return ~ RP | rank, data = capm5)
coeftest(iv1, vcov = vcovHC, type = "HC1")
confint(iv1, level = 0.95) \#interval estimate
summary(iv1)
```
The estimate results are as followed:
|Coefficients|Estimate|Std. Error|t value|P-value|
|--------|--------|--------|--------|--------|
|RP|1.2783182|0.1317427|9.7031|<2e-16`***`|

And the 95% interval estimate of RP is:
|Coefficients|2.5%|97.5%|
|--------|--------|--------|
|RP|1.027421458|1.52921503|

If there is a measurement error problem, the OLS estimator suffers attenuation bias and is biased downward. The coefficient of RP in IV regression(1.2783) is slightly larger than the original OLS one(1.2018), which is what we would expect. The 95% interval estimate is now [1.0274, 1.5292]. We would still reject the null hypothesis that Microsoft's beta equals to 1.
