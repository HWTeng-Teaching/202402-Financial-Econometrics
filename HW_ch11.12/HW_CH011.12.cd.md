Two stage least squares can be described as follows. 
In the first stage we estimate:

$HOURS=\pi_1+\pi_2 EDUC+\pi_3EXPER^2+\pi_5KIDS+\piln(HWAGE)+v$

Obtain the fitted values $\hat{HOURS}$ from the reduced form equation. Note that the fitted values depend only on exogenous variables.

In the second stage we replace $HOURS$ by $\hat{HOURS}$ in the wage equation. Estimate this resulting equation by OLS. That is,

$ln(WAGE)=\beta_1+\beta_2\hat{HOURS}\beta_3EDUC+\beta_4EXPER+\beta_5EXPER^2+\epsilon_1^*$

This estimation process yields consistent estimators for the wage equation parameters. The standard errors from the second stage OLS estimation are not correct, as the error variance
$\sigma_1^2=var(e_1)$ is not correctly computed.

