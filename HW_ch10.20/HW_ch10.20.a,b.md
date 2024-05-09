### This homework is written by 許淨喻 (312707016)
### 10.20
### The CAPM [see Exercises 10.14 and 2.16] says that the risk premium on security j is related to the risk premium on the market portfolio. That is $r_j - r_f = \alpha_j + \beta_j (r_m - r_f)$ where $r_j$ and $r_f$ are the returns to security j and the risk-free rate, respectively, $r_m$ is the return on the market portfolio, and $\beta_j$, is the jth security's "beta" value. We measure the market portfolio using the Standard & Poor's value weighted index, and the risk-free rate by the 30-day LIBOR monthly rate of return. As noted in Exercise 10.14, if the market return is measured with error, then we face an errors-in-variables, or measurement error, problem.


### (a)
**Question:**\
Use the observations on Microsoft in the data file $capm5$ to estimate the CAPM model using OLS.
How would you classify the Microsoft stock over this period? Risky or relatively safe, relative to the market portfolio?

**Ans:**\

```{R }
data(capm5)
capm5$msftrf = (capm5$msft-capm5$riskfree)
capm5$rmrf = (capm5$mkt-capm5$riskfree)
msftrf=lm(msftrf~rmrf, data=capm5)
summary(msftrf)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/71587037/a2cd5d76-7be8-483a-8207-f280cbe826d7)

Microsoft's estimated beta is 1.2018, with a standard error of 0.122152. The t-value is 9.839, and the p-value is very small (< 2e-16). This means that the relationship is significant. Thus Microsoft is relatively hazardous as its beta exceeds 1. This indicates higher rates compared to the market and only by its riskier (we compensate for its risk) does CAPM assume.

### (b)
**Question:**\
It has been suggested that it is possible to construct an IV by ranking the values of the explanatory variable and using the rank as the IV, that is, we sort $r_m - r_f$ from smallest to largest, and assign the values $RANK$ = 1,2,....,180. Does this variable potentially satisfy the conditions IV1-IV3? Create $RANK$ and obtain the first-stage regression results. Is the coefficient of $RANK$ very significant? What is the $R^2$ of the first-stage regression? Can $RANK$ be regarded as a strong IV?

**Ans:**\

```{R }
capm5$rank = rank(capm5$rmrf)
rmrf.ols=lm(rmrf~rank , data=capm5)
summary(rmrf.ols)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/71587037/fd0d3082-120d-4348-a5ee-897b9e14850d)

The variable $RANK$ has no obvious causal effect on Microsoft’s return, so it satisfies condition IV1. This classification is probably exogenous to satisfy IV2. The ranking should be highly predictive so that IV3 is likely to be satisfied. 

The $R^2$ = 0.9126 is very large. The t-value is 43.10 which corresponds to F = 1858, which is huge. Thus $RANK$ seems to be an extremely strong IV, if it is valid.
