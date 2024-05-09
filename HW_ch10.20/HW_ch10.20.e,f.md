### This homework is written by 王柏皓 (312707019)
### 10.20
### The CAPM [see Exercises 10.14 and 2.16] says that the risk premium on security j is related to the risk premium on the market portfolio. That is $r_j - r_f = \alpha_j + \beta_j (r_m - r_f)$ where $r_j$ and $r_f$ are the returns to security j and the risk-free rate, respectively, $r_m$ is the return on the market portfolio, and $\beta_j$, is the jth security's "beta" value. We measure the market portfolio using the Standard & Poor's value weighted index, and the risk-free rate by the 30-day LIBOR monthly rate of return. As noted in Exercise 10.14, if the market return is measured with error, then we face an errors-in-variables, or measurement error, problem.


### (e)
**Question:**\
Create a new variable $POS$ = 1 if the market return $(r_m − r_𝑓)$ is positive, and zero otherwise.
Obtain the first-stage regression results using both $RANK$ and $POS$ as instrumental variables.
Test the joint significance of the $IV$. Can we conclude that we have adequately strong $IV$ ? What is the $R^2$ of the first-stage regression?

**Answer:**

```
data(capm5)

capm5$RP = capm5$mkt - capm5$riskfree
capm5$RANK <- rank(capm5$RP) 
capm5$POS <- ifelse(capm5$RP > 0, 1, 0)

first_stage_rank_pos <- lm(RP ~ RANK + POS, data = capm5) 
summary(first_stage_rank_pos)
```
![image](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/161856578/aa17be57-ae96-4e4d-9022-c933ae32b41a)

The F-test statistic for the joint significance of these variables is 951.3. Based on the F-test we would conclude the IV are not weak.
The $R^2$ is 0.9149.
RANK remains strongly significant but POS is not significant at the 1% level.
If we are willing to accept a 5% test then we can conclude the IV are not weak. 

### (f)
**Question:**\
Carry out the Hausman test for endogeneity using the residuals from the first-stage equation in (e). 
Can we conclude that the market return is exogenous at the 1% level of significance?

**Answer:**

```
capm5$first_stage_rank_pos_resid <- residuals(first_stage_rank_pos)
augmented_capm_plm <- plm(msft ~ (mkt - riskfree) + first_stage_rank_pos_resid, data = capm5, model = "pooling") 
summary(augmented_capm_plm)
```
![image](https://github.com/pulsar20000517/HW/blob/main/10.20f.png?raw=true)

The t-value on the first stage residuals is −2.22 with a p-value of 0.028. 
It is not significant at the 1% level. Thus at the 1% level we cannot reject the null hypothesis that the market return is exogenous.
