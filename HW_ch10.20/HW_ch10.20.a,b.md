### This homework is written by 許淨喻 (312707016)
### 10.20
### The CAPM [see Exercises 10.14 and 2.16] says that the risk premium on security j is related to the risk premium on the market portfolio. That is $r_j - r_f = \alpha_j + \beta_j (r_m - r_f)$ where $r_j$ and $r_f$ are the returns to security j and the risk-free rate, respectively, $r_m$ is the return on the market portfolio, and $\beta_j$, is the jth security's "beta" value. We measure the market portfolio using the Standard & Poor's value weighted index, and the risk-free rate by the 30-day LIBOR monthly rate of return. As noted in Exercise 10.14, if the market return is measured with error, then we face an errors-in-variables, or measurement error, problem.


### (a)
**Question:**\
Use the observations on Microsoft in the data fle capm5 to estimate the CAPM model using OLS.
How would you classify the Microsoft stock over this period? Risky or relatively safe, relative to the market portfolio?

**Ans:**\

### (b)
**Question:**\
It has been suggested that it is possible to construct an IV by ranking the values of the explanatory variable and using the rank as the IV, that is, we sort $r_m - r_f$ from smallest to largest, and assign the values $RANK$ = 1,2,....,180. Does this variable potentially satisfy the conditions IV1-IV3? Create $RANK$ and obtain the first-stage regression results. Is the coefficient of RANK very significant? What is the $R^2$ of the first-stage regression? Can $RANK$ be regarded as a strong IV?

**Ans:**\
