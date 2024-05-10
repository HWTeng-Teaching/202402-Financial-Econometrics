
# This homework is written by 林震洋 (312707020)

### g.

Obtain the IV/2SLS estimates of the CAPM model using RANK and POS as instrumental variables. Compare this IV estimate to the OLS estimate in part (a). Does the IV estimate agree with your expectations?

Answer:

The IV coefficient estimate 1.28 is larger than the OLS estimate from part (a) 1.201840. The IV estimate is slightly larger, which is what we would expect

```
# (g)
# Estimate CAPM model using IV/2SLS with RANK and POS as IVs
capm_iv_rank_pos <- ivreg(msft-riskfree ~ MKTRET | RANK + POS, data = capm5)
/* estimates an IV regression using the ivreg function*/
/*  the dependent variable (msft-riskfree) and the endogenous variable (MKTRET).
RANK + POS is instrumental variables */

summary(capm_iv_rank_pos)
```
|Coefficients|Estimate|Std. Error|t value|P-value|
|--------|--------|--------|--------|--------|
|MKTRET|1.283118|0.127866|10.035|<2e-16 `***`|

### h.

Obtain the IV/2SLS residuals from part (g) and use them (not an automatic command) to carry out a Sargan test for the validity of the surplus IV at the 5% level of significance.

Answer:

The test statistic $NR^2$ = 0.5584634\
The rejection region is { $X^2:X^2>3.84$ } \
Thus we fail to reject the $H_0:cov(RANK,e)=0 , cov(POS,e)=0$\
This means that the surplus IVs ($RANK$ and $POS$) are valid instruments.

```
# (h)
/* Sargan test for the validity of surplus IV*/
capm_iv_rank_pos <- ivreg(msft-riskfree ~ MKTRET | RANK + POS, data = capm5)


summary_capm_iv2=summary(capm_iv_rank_pos)

residuals = summary_capm_iv2$residuals
/* extracts the residuals from the IV regression. */

OLS_eIV = lm(residuals~RANK+POS,data = capm5)
/* runs an (OLS) regression using the extracted residuals as the dependent variable and the
(RANK and POS) as independent variables*/

summary_OLS_eIV = summary(OLS_eIV)
N = length(capm_iv_rank_pos$residuals)
Rsquard = summary_OLS_eIV$r.squared
Rsquard*N
/* multiplies the R-squared value by the number of observations.*/
chi_2 <- qchisq(0.95,1)
chi_2

/*The Sargan test examines whether the  IV are uncorrelated with the error term.
It does this by regressing the IV residuals on the instruments and checking the N*R-squared*/

```
