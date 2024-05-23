### This homework is written by 包坤達 (312707033)
### 11.19(e)
#### Check the identification of the supply equation,considering tha availability of instrument EXPER.
![螢幕擷取畫面 2024-05-23 164432](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162653388/e77a3fe8-03a0-4053-8bd7-12aa17da6801)
![螢幕擷取畫面 2024-05-23 164450](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162653388/cb8db338-51ed-4ec0-a9af-f80ccf32d09a)

When estimating the supply equation, in order to ensure the reliability of the estimation results, the instrumental variables used must be valid.Effective instrumental variables need to be strongly correlated with endogenous variables (WAGE) in order to accurately estimate the equation.
From the picture we know that the coefficient on EXPER is
significant with t-value 3.6.We transform t-value to F-value.We obtain 12.96(F=t²).If the F-value is at least 10, then the instrumental variable is considered strong.The we conclude that EXPER can effectively identify the supply equation and does not lead to weak instrumental variable problems.


### 11.19(f)
#### Estimate the supply equation by two-stage least squares, using software designed for this purpose.Discuss the signs and significance of the estimated coefficients.

![螢幕擷取畫面 2024-05-23 133940](https://github.com/HWTeng-Course/202402-Financial-Econometrics/assets/162653388/04856793-297c-454a-b08b-ea4725183b02)

We can see that the coefficient of  ln_wage is positive and significant at 0.01.The coefficient of EDUC is also significant at 0.01 but negative.And the other variables are not significant.

