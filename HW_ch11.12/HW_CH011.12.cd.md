### This homework is written by 許桂萍 (312707028)
### 11.12(c)
### If you seek an alternative to least squares estimation for the wage equation, suggest an estimationprocedure and how (step by step, and NOT a computer command) it is carried out.

***Answer:***

Two stage least squares can be described as follows.\
1. First stage:

$HOURS=\pi_1+\pi_2 EDUC+\pi_3EXPER^2+\pi_5KIDS+\pi_6 ln(HWAGE)+v$

Obtain the fitted values $\hat{HOURS}$ from the reduced form equation. Note that the fitted values depend only on exogenous variables.

2. Second stage:
   we replace $HOURS$ by $\hat{HOURS}$ in the wage equation. Estimate this resulting equation by OLS. That is,

$ln(WAGE)=\beta_1+\beta_2\hat{HOURS}\beta_3EDUC+\beta_4EXPER+\beta_5EXPER^2+e_1^*$

This estimation process yields consistent estimators for the wage equation parameters. The standard errors from the second stage OLS estimation are not correct, as the error variance
$\sigma_1^2=var(e_1)$ is not correctly computed.


### 11.12(d)
### Other than the identification condition in part (b), are there any other conditions that must be met so that we can confidently use the estimation procedure in part (c)? What are those conditions?

***Answer:***

In order for 2SLS estimation process to be reliable the null hypothesis $H_0:\pi_5=0$ and $H_0:\pi_6=0$
must produce a large F-statistic value, greater than 10. This ensures that the two variables in the supply equation that are not in the demand equation do substantially shift supply relative to demand, making demand identified.
