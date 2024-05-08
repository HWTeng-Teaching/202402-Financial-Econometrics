
# This homework is written by 林震洋 (312707020)

### g.

Obtain the IV/2SLS estimates of the CAPM model using RANK and POS as instrumental variables. Compare this IV estimate to the OLS estimate in part (a). Does the IV estimate agree with your expectations?

Answer:

The coefficient estimate 1.28 is larger than the OLS estimate from part (a) 1.201840. The IV estimate is slightly larger, which is what we would expect

```{r}
# (g)
# Estimate CAPM model using IV/2SLS with RANK and POS as IVs
capm_iv_rank_pos <- ivreg(msft-riskfree ~ MKTRET | RANK + POS, data = capm5)
summary(capm_iv_rank_pos)
```


### h.

Obtain the IV/2SLS residuals from part (g) and use them (not an automatic command) to carry out a Sargan test for the validity of the surplus IV at the 5% level of significance.

Answer:

The test statistic $NR^2$ = 0.5584634\
The rejection region is { $X^2:X^2>3.84$ } \
Thus we fail to reject the $H_0:cov(RANK,e)=0 , cov(POS,e)=0$\
This means that the surplus IVs ($RANK$ and $POS$) are valid instruments.

```{r}
# (h)
# Sargan test for the validity of surplus IV
capm_iv_rank_pos <- ivreg(msft-riskfree ~ MKTRET | RANK + POS, data = capm5)
summary_capm_iv2=summary(capm_iv_rank_pos)
residuals = summary_capm_iv2$residuals
OLS_eIV = lm(residuals~RANK+POS,data = capm5)

summary_OLS_eIV = summary(OLS_eIV)
N = length(capm_iv_rank_pos$residuals)
Rsquard = summary_OLS_eIV$r.squared
Rsquard*N

chi_2 <- qchisq(0.95,1)
chi_2
```
